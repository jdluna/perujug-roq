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

# Function to setup development environment
setup_dev() {
    print_status "Setting up development environment..."
    
    # Check prerequisites
    check_java
    check_maven
    
    # Create necessary directories
    mkdir -p config/prod
    mkdir -p target/site
    
    # Make mvnw executable
    if [ -f "./mvnw" ]; then
        chmod +x ./mvnw
        print_success "Made mvnw executable"
    fi
    
    # Clean and compile
    print_status "Cleaning and compiling project..."
    if command_exists mvn; then
        mvn clean compile
    else
        ./mvnw clean compile
    fi
    
    print_success "Development environment setup complete!"
}

# Function to build for production
build_prod() {
    print_status "Building for production..."
    
    if command_exists mvn; then
        mvn clean package -Pprod
    else
        ./mvnw clean package -Pprod
    fi
    
    print_success "Production build complete!"
}

# Function to build static site
build_static() {
    print_status "Building static site..."
    
    if command_exists mvn; then
        mvn clean package -Pstatic
    else
        ./mvnw clean package -Pstatic
    fi
    
    print_success "Static site build complete!"
    print_status "Static site generated in: target/site/"
}

# Function to start development server
start_dev() {
    print_status "Starting development server..."
    
    if command_exists mvn; then
        mvn quarkus:dev
    else
        ./mvnw quarkus:dev
    fi
}

# Function to run tests
run_tests() {
    print_status "Running tests..."
    
    if command_exists mvn; then
        mvn test
    else
        ./mvnw test
    fi
    
    print_success "Tests completed!"
}

# Function to check security
check_security() {
    print_status "Checking for security vulnerabilities..."
    
    if command_exists mvn; then
        mvn dependency:check
    else
        ./mvnw dependency:check
    fi
    
    print_success "Security check completed!"
}

# Function to show help
show_help() {
    echo "PeruJUG ROQ Site Setup Script"
    echo ""
    echo "Usage: $0 [COMMAND]"
    echo ""
    echo "Commands:"
    echo "  setup     - Setup development environment"
    echo "  build     - Build for production"
    echo "  static    - Build static site"
    echo "  dev       - Start development server"
    echo "  test      - Run tests"
    echo "  security  - Check for security vulnerabilities"
    echo "  help      - Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 setup      # Setup development environment"
    echo "  $0 build      # Build for production"
    echo "  $0 dev        # Start development server"
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
        build_static
        ;;
    "dev")
        start_dev
        ;;
    "test")
        run_tests
        ;;
    "security")
        check_security
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