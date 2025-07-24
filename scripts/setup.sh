#!/bin/bash

# PeruJUG ROQ Site Setup Script
# This script sets up the development environment and prepares for deployment

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check Java version
check_java() {
    if ! command_exists java; then
        print_error "Java is not installed. Please install Java 17 or higher."
        exit 1
    fi
    
    JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
    if [ "$JAVA_VERSION" -lt 17 ]; then
        print_error "Java version $JAVA_VERSION is too old. Please install Java 17 or higher."
        exit 1
    fi
    
    print_success "Java version $(java -version 2>&1 | head -n 1 | cut -d'"' -f2) detected"
}

# Function to check Maven
check_maven() {
    if ! command_exists mvn; then
        print_warning "Maven is not installed. Using Maven wrapper (mvnw)."
        if [ ! -f "./mvnw" ]; then
            print_error "Maven wrapper not found. Please ensure mvnw is present in the project root."
            exit 1
        fi
    else
        print_success "Maven $(mvn -version | head -n 1 | cut -d' ' -f3) detected"
    fi
}

# Function to get Maven command
get_maven_cmd() {
    if command_exists mvn; then
        echo "mvn"
    else
        echo "./mvnw"
    fi
}

# Function to setup development environment
setup_dev() {
    print_status "Setting up development environment..."
    
    # Check prerequisites
    check_java
    check_maven
    
    # Create necessary directories
    mkdir -p config/prod
    mkdir -p target/roq
    
    # Make mvnw executable
    if [ -f "./mvnw" ]; then
        chmod +x ./mvnw
        print_success "Made mvnw executable"
    fi
    
    # Clean and compile
    print_status "Cleaning and compiling project..."
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD clean compile
    
    print_success "Development environment setup complete!"
}

# Function to build for production
build_prod() {
    print_status "Building for production..."
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD clean package -Pprod
    
    print_success "Production build complete!"
}

# Function to generate static site for GitHub Pages
generate_static() {
    print_status "Generating static site for GitHub Pages..."
    
    MAVEN_CMD=$(get_maven_cmd)
    
    # First build the project
    print_status "Building project..."
    $MAVEN_CMD clean package -DskipTests
    
    # Then run the ROQ generator in batch mode
    print_status "Running ROQ static site generator..."
    QUARKUS_ROQ_GENERATOR_BATCH=true $MAVEN_CMD quarkus:run -DskipTests &
    
    # Wait for the application to start and generate files
    print_status "Waiting for static site generation (this may take a moment)..."
    sleep 45
    
    # Stop the application
    print_status "Stopping application..."
    pkill -f "quarkus:run" || true
    sleep 5
    
    if [ -d "target/roq" ]; then
        print_success "Static site generated successfully!"
        print_status "Static site location: target/roq/"
        print_status "Generated files:"
        ls -la target/roq/
        
        # Verify key files exist
        if [ -f "target/roq/index.html" ]; then
            print_success "✅ index.html generated"
        else
            print_warning "⚠️  index.html not found"
        fi
        
        if [ -f "target/roq/404/index.html" ]; then
            print_success "✅ 404 page generated"
        else
            print_warning "⚠️  404 page not found"
        fi
        
        print_status "Static site is ready for deployment!"
    else
        print_error "Static site generation failed. Check the build logs."
        exit 1
    fi
}

# Function to start development server
start_dev() {
    print_status "Starting development server..."
    print_status "The application will be available at: http://localhost:8080/perujug-roq/"
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD quarkus:dev
}

# Function to run tests
run_tests() {
    print_status "Running tests..."
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD test
    
    print_success "Tests completed!"
}

# Function to run tests with coverage
run_tests_coverage() {
    print_status "Running tests with coverage..."
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD clean test jacoco:report
    
    print_success "Tests with coverage completed!"
    print_status "Coverage report available in: target/site/jacoco/"
}

# Function to check security
check_security() {
    print_status "Checking for security vulnerabilities..."
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD dependency:check
    
    print_success "Security check completed!"
}

# Function to clean project
clean_project() {
    print_status "Cleaning project..."
    
    MAVEN_CMD=$(get_maven_cmd)
    $MAVEN_CMD clean
    
    # Also clean generated directories
    rm -rf target/roq
    rm -rf target/site
    
    print_success "Project cleaned!"
}

# Function to validate project structure
validate_project() {
    print_status "Validating project structure..."
    
    # Check required directories
    local missing_dirs=()
    
    for dir in "content" "data" "templates" "public" "config"; do
        if [ ! -d "$dir" ]; then
            missing_dirs+=("$dir")
        fi
    done
    
    if [ ${#missing_dirs[@]} -gt 0 ]; then
        print_error "Missing required directories: ${missing_dirs[*]}"
        exit 1
    fi
    
    # Check required files
    local missing_files=()
    
    for file in "pom.xml" "config/application.properties"; do
        if [ ! -f "$file" ]; then
            missing_files+=("$file")
        fi
    done
    
    if [ ${#missing_files[@]} -gt 0 ]; then
        print_error "Missing required files: ${missing_files[*]}"
        exit 1
    fi
    
    print_success "Project structure validation passed!"
}

# Function to show project info
show_info() {
    echo "PeruJUG ROQ Site - Project Information"
    echo "======================================"
    echo ""
    echo "Project Structure:"
    echo "  📁 content/     - Website content (pages, posts, events)"
    echo "  📁 data/        - Dynamic configuration (menu, posts, authors)"
    echo "  📁 templates/   - Qute templates (layouts, partials)"
    echo "  📁 public/      - Static assets (images, CSS, JS)"
    echo "  📁 config/      - Application configuration"
    echo "  📁 scripts/     - Build and deployment scripts"
    echo ""
    echo "Key Files:"
    echo "  📄 pom.xml      - Maven project configuration"
    echo "  📄 mvnw         - Maven wrapper"
    echo "  📄 setup.sh     - This setup script"
    echo ""
    echo "Available Commands:"
    echo "  setup           - Initialize development environment"
    echo "  dev             - Start development server"
    echo "  build           - Build for production"
    echo "  static          - Generate static site for GitHub Pages"
    echo "  test            - Run tests"
    echo "  test-coverage   - Run tests with coverage"
    echo "  security        - Check for security vulnerabilities"
    echo "  clean           - Clean project"
    echo "  validate        - Validate project structure"
    echo "  info            - Show project information"
    echo "  help            - Show help message"
}

# Function to show help
show_help() {
    echo "PeruJUG ROQ Site Setup Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  setup           - Setup development environment"
    echo "  dev             - Start development server"
    echo "  build           - Build for production"
    echo "  static          - Generate static site for GitHub Pages"
    echo "  test            - Run tests"
    echo "  test-coverage   - Run tests with coverage"
    echo "  security        - Check for security vulnerabilities"
    echo "  clean           - Clean project"
    echo "  validate        - Validate project structure"
    echo "  info            - Show project information"
    echo "  help            - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 setup        # Setup development environment"
    echo "  $0 dev          # Start development server"
    echo "  $0 static       # Generate static site"
    echo "  $0 validate     # Validate project structure"
    echo ""
    echo "Development Workflow:"
    echo "  1. $0 setup     # First time setup"
    echo "  2. $0 dev       # Start development"
    echo "  3. $0 test      # Run tests"
    echo "  4. $0 static    # Generate for deployment"
}

# Main script logic
case "${1:-help}" in
    "setup")
        setup_dev
        ;;
    "build")
        build_prod
        ;;
    "static")
        generate_static
        ;;
    "dev")
        start_dev
        ;;
    "test")
        run_tests
        ;;
    "test-coverage")
        run_tests_coverage
        ;;
    "security")
        check_security
        ;;
    "clean")
        clean_project
        ;;
    "validate")
        validate_project
        ;;
    "info")
        show_info
        ;;
    "help"|"--help"|"-h")
        show_help
        ;;
    *)
        print_error "Unknown command: $1"
        echo ""
        show_help
        exit 1
        ;;
esac 