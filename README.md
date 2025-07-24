# PeruJUG Website - Quarkus ROQ Implementation

This is the PeruJUG (Peru Java User Group) website implemented using Quarkus ROQ framework. The website has been migrated from the original Jekyll-based perujugwebsite to use modern Java technologies with automated deployment to GitHub Pages.

## 🚀 Quick Start

### Prerequisites
- Java 17 or higher
- Maven 3.6 or higher (or use the included Maven wrapper)

### Local Development
```bash
# Setup development environment
./scripts/setup.sh setup

# Start development server
./scripts/setup.sh dev

# Or use Maven directly
./mvnw quarkus:dev
```

### Production Build
```bash
# Build for production
./scripts/setup.sh build

# Build static site for GitHub Pages
./scripts/setup.sh static
```

## 📁 Project Structure

```
perujug-roq/
├── .github/                    # GitHub Actions workflows
│   ├── workflows/
│   │   └── deploy.yml         # GitHub Pages deployment workflow
│   └── dependabot.yml         # Automated dependency updates
├── content/                    # Website content
│   ├── index.html             # Homepage
│   ├── meetups.html           # Meetups page
│   ├── 404.html               # 404 error page
│   ├── posts/                 # Blog posts
│   │   ├── 2016/
│   │   │   └── 2016-05-20-welcome-to-perujug.adoc
│   │   └── 2018/
│   │       └── 2018-06-30-java-day-2018.adoc
│   └── javaday/               # Java Day conference pages
│       ├── 2018.html          # Java Day 2018
│       └── 2019.html          # Java Day 2019
├── data/                      # Dynamic configuration
│   ├── menu.yml               # Navigation menu configuration
│   ├── posts.yml              # Blog posts metadata
│   └── authors.yml            # Author information
├── templates/                 # Qute templates
│   ├── layouts/               # Page layouts
│   │   ├── default.html       # Base layout
│   │   ├── page.html          # Page layout
│   │   └── post.html          # Blog post layout
│   └── partials/              # Reusable components
│       ├── navigation.html    # Navigation menu
│       ├── footer.html        # Footer component
│       └── latest-posts.html  # Latest posts widget
├── public/                    # Static assets
│   ├── images/                # Images and photos
│   │   ├── javadayperu/       # Java Day event photos
│   │   ├── logo.png           # PeruJUG logo
│   │   ├── perujug2023.png    # Community photo
│   │   └── organizers/        # Organizer photos
│   ├── js/                    # JavaScript files
│   │   ├── init.js            # Initialization scripts
│   │   ├── gmaps.js           # Google Maps integration
│   │   ├── jquery.min.js      # jQuery library
│   │   └── materialize.min.js # Materialize CSS framework
│   ├── fonts/                 # Web fonts
│   ├── main.css               # Custom styles
│   └── materialize.css        # Materialize CSS framework
├── config/                    # Application configuration
│   └── application.properties # Quarkus configuration
├── scripts/                   # Build and deployment scripts
│   └── setup.sh               # Development setup script
├── pom.xml                    # Maven project configuration
├── mvnw                       # Maven wrapper
└── README.md                  # This file
```

## 🌐 Website Content

### Main Pages
- **Homepage** (`/`): Community overview, mission, and organizer profiles
- **Meetups** (`/meetups/`): Information about monthly meetups and community events
- **Java Day 2018** (`/javaday/2018/`): Conference details, speakers, and venue information
- **Java Day 2019** (`/javaday/2019/`): Conference details and speaker information

### Blog Posts
- **Welcome to PeruJUG** (2016-05-20): Introduction to the community
- **Java Day 2018** (2018-06-30): Conference recap and highlights

### Community Leaders
The website features profiles of key community leaders:
- **José Diaz**: Java Champion / JUG Leader
- **Ytalo Borja**: JUG Leader
- **Carlos Zela**: JUG Leader
- **Eddu Melendez**: JUG Co-Leader

### Java Day Speakers
The Java Day conferences featured speakers from across the Americas:
- **Mark Heckler** (Pivotal / USA)
- **Jorge Vargas** (Java Champion / Mexico)
- **Alexis Lopez** (Java Champion / Colombia)
- **Hillmer Chona** (Medellín JUG / Colombia)
- **Lucas Olmos** (Inkafarma / Argentina)
- **José Flores** (Intercorp Retail / Perú)
- **Edgar Rios Navarro** (Consultor Independiente / Perú)

## 🎨 Design & Technology

### Frontend Framework
- **Materialize CSS**: Modern responsive design framework
- **Material Icons**: Icon library for consistent UI
- **jQuery**: JavaScript library for DOM manipulation
- **Google Maps API**: Interactive maps for event locations

### Backend Technology
- **Quarkus ROQ**: Modern Java web framework
- **Qute Templates**: Server-side templating engine
- **AsciiDoc**: Content authoring format for blog posts
- **YAML Configuration**: Dynamic content management

### Key Features
- **Responsive Design**: Mobile-first approach with Materialize CSS
- **Dynamic Navigation**: YAML-based menu configuration
- **Blog System**: AsciiDoc-based content with metadata
- **Event Pages**: Dedicated pages for Java Day conferences
- **Image Gallery**: Rich collection of community and event photos
- **Interactive Maps**: Google Maps integration for event locations

## 🌐 Deployment

This project is configured for automated deployment to GitHub Pages using GitHub Actions.

### GitHub Pages Setup

To enable GitHub Pages for this repository:

1. **Go to Repository Settings**
   - Navigate to your repository on GitHub
   - Click on **Settings** tab

2. **Enable GitHub Pages**
   - Scroll down to **Pages** section in the left sidebar
   - Under **Source**, select **GitHub Actions**
   - This allows the workflow to deploy automatically

3. **Configure Branch Protection (Optional)**
   - Go to **Branches** section
   - Add rule for `main` branch
   - Enable **Require status checks to pass before merging**
   - Select the **CI - Build and Test** workflow

### Automatic Deployment
1. **Push to main branch** triggers automatic deployment
2. **GitHub Actions** builds the application and creates a static site
3. **Site is deployed** to GitHub Pages automatically
4. **Site is available** at your GitHub Pages URL

### Manual Deployment
1. Go to **Actions** tab in your repository
2. Select **Deploy PeruJUG Site to GitHub Pages**
3. Click **Run workflow**

### Workflow Files

The project includes GitHub Actions workflows:

- **`.github/workflows/deploy.yml`**: 
  - Runs only on pushes to main branch
  - Builds the application with production settings
  - Generates static site in `target/roq/`
  - Deploys to GitHub Pages
  - Uses GitHub Pages deployment action

### Deployment Process
The deployment workflow:
1. **Sets up** Java 17 and Maven environment
2. **Builds** the Quarkus application with `QUARKUS_ROQ_GENERATOR_BATCH=true`
3. **Generates** static site in `target/roq/` directory
4. **Uploads** the static site as GitHub Pages artifact
5. **Deploys** to GitHub Pages using official deployment action

### Configuration
- **GitHub Pages**: Enable in repository settings
- **Branch**: Deploys from `main` branch
- **No secrets required**: Uses standard GitHub Actions permissions

## 🔧 Development

### Scripts
The project includes a comprehensive setup script (`scripts/setup.sh`) with the following commands:

- `./scripts/setup.sh setup`: Initialize development environment
- `./scripts/setup.sh dev`: Start development server
- `./scripts/setup.sh build`: Build for production
- `./scripts/setup.sh static`: Generate static site
- `./scripts/setup.sh clean`: Clean build artifacts

## ⚙️ Configuration

### Application Configuration

#### Development Configuration (`config/application.properties`)
```properties
# Server configuration
quarkus.http.port=8080
quarkus.http.host=0.0.0.0
quarkus.http.root-path=/perujug-roq

# Development mode
quarkus.live-reload.password=changeit
quarkus.live-reload.url=http://localhost:8080

# AsciiDoc configuration
quarkus.asciidoctorj.attributes.icons=font
quarkus.asciidoctorj.attributes.source-highlighter=highlight.js
quarkus.web-bundler.dependencies.auto-import=all
quarkus.default-locale=en
```

#### Production Configuration (`config/prod/application.properties`)
```properties
# Production Site configuration
site.title=PeruJUG
site.description=Comunidad de @java en Perú y @javaee_guardian
site.url=${QUARKUS_ROQ_SITE_URL}
site.author=PeruJUG
site.email=perujug@gmail.com
site.twitter=perujug
site.github=perujug
site.path-prefix=/perujug-roq
site.generator=true

# Production Server configuration
quarkus.http.port=8080
quarkus.http.host=0.0.0.0

# Disable development features
quarkus.live-reload.password=disabled
quarkus.live-reload.url=disabled

# AsciiDoc configuration
quarkus.asciidoctorj.attributes.icons=font
quarkus.asciidoctorj.attributes.source-highlighter=highlight.js
quarkus.web-bundler.dependencies.auto-import=all
quarkus.default-locale=en

# Production optimizations
quarkus.http.root-path=/perujug-roq
quarkus.http.cors=false
quarkus.http.compression.enabled=true
quarkus.http.compression.max-input=10M

# Security headers
quarkus.http.headers.security-headers=true
quarkus.http.headers.hsts=true
quarkus.http.headers.content-security-policy=true

# Performance optimizations
quarkus.http.limits.max-body-size=10M
quarkus.http.limits.max-header-size=10K
```

### Dynamic Content Configuration

#### Navigation Menu (`data/menu.yml`)
```yaml
# Top-level items for ROQ default theme compatibility
items:
  - title: "Inicio"
    url: "/perujug-roq/"
    icon: "home"
    external: false
    
  - title: "Jconf Peru"
    url: "https://jconfperu.org/"
    icon: ""
    external: true

# Main navigation menu items
main_menu:
  - title: "Inicio"
    url: "/perujug-roq/"
    icon: "home"
    external: false
    
  - title: "Jconf Peru"
    url: "https://jconfperu.org/"
    icon: ""
    external: true

# Events dropdown menu
events_dropdown:
  title: "Events"
  icon: "event"
  dropdown_icon: "arrow_drop_down"
  items:
    - title: "Java Day"
      type: "submenu"
      submenu_id: "javaday-submenu"
      items:
        - title: "Java Day 2018"
          url: "/perujug-roq/javaday/2018/"
          year: "2018"
          description: "Java Day Peru 2018"
          
        - title: "Java Day 2019"
          url: "/perujug-roq/javaday/2019/"
          year: "2019"
          description: "Java Day Peru 2019"
      
    - title: "Meetups"
      url: "/perujug-roq/meetups/"
      description: "PeruJUG Meetups"

# Mobile navigation menu
mobile_menu:
  - title: "Inicio"
    url: "/perujug-roq/"
    
  - title: "Java Day 2018"
    url: "/perujug-roq/javaday/2018/"
    
  - title: "Java Day 2019"
    url: "/perujug-roq/javaday/2019/"
    
  - title: "Meetups"
    url: "/perujug-roq/meetups/"

# Menu configuration
menu_config:
  dropdown_id: "dropdown1"
  mobile_activates: "nav-mobile"
  brand_logo: "/perujug-roq/images/logo.png"
  brand_text: "perujug.org"
```

#### Blog Posts Configuration (`data/posts.yml`)
```yaml
# Latest Posts Configuration
latest_posts:
  - title: "Java Day 2018"
    date: "06/30"
    description: "30th June was a fantastic day on Lima, Peru. 10 best Java developers around the world come to lecture the Peruvian Java community with the trends and future for this outstanding programming language."
    url: "/perujug-roq/2018/java-day-2018/"
    full_date: "June 30, 2018"
    author: "PeruJUG"
    category: "Events"
    featured: true
    tags: ["java", "conference", "peru"]
    
  - title: "Welcome to PeruJUG"
    date: "05/20"
    description: "This is an early version of the PeruJUG website, which will be improved surely."
    url: "/perujug-roq/2016/welcome-to-perujug/"
    full_date: "May 20, 2016"
    author: "PeruJUG"
    category: "Community"
    featured: true
    tags: ["community", "welcome"]

# Configuration for different post sections
post_sections:
  featured:
    title: "Featured Posts"
    max_posts: 3
    
  events:
    title: "Event Posts"
    max_posts: 5
    
  community:
    title: "Community Posts"
    max_posts: 5

# Post categories for filtering
categories:
  - name: "Events"
    description: "Java events and conferences"
    color: "#83a60a"
    
  - name: "Community"
    description: "Community announcements and updates"
    color: "#83a60a"
    
  - name: "Technical"
    description: "Technical articles and tutorials"
    color: "#ff9800"
```

#### Authors Configuration (`data/authors.yml`)
```yaml
perujug:
  name: "PeruJUG Team"
  job: Java User Group
  nickname: perujug
  profile: "https://github.com/perujug"
  avatar: "/images/perujug2023.png"
  bio: |
    PeruJUG is the Java User Group of Peru, a community of Java developers passionate about sharing knowledge and experiences.
    We organize meetups, workshops, and conferences to promote Java technology in Peru.

admin:
  name: "PeruJUG Administrator"
  job: Community Manager
  nickname: admin
  profile: "https://github.com/perujug"
  avatar: "/images/logo.png"
  bio: |
    Administrator of the PeruJUG community, helping to organize events and manage the community.
```

### Build Configuration

#### Maven Configuration (`pom.xml`)
```xml
<!-- Project Properties -->
<properties>
    <compiler-plugin.version>3.14.0</compiler-plugin.version>
    <maven.compiler.release>17</maven.compiler.release>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
    <quarkus.platform.artifact-id>quarkus-bom</quarkus.platform.artifact-id>
    <quarkus.platform.group-id>io.quarkus.platform</quarkus.platform.group-id>
    <quarkus.platform.version>3.24.3</quarkus.platform.version>
    <skipITs>true</skipITs>
    <surefire-plugin.version>3.5.3</surefire-plugin.version>
</properties>

<!-- Key Dependencies -->
<dependencies>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq</artifactId>
        <version>1.6.3</version>
    </dependency>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq-theme-default</artifactId>
        <version>1.6.3</version>
    </dependency>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq-plugin-asciidoc-jruby</artifactId>
        <version>1.6.3</version>
    </dependency>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq-plugin-aliases</artifactId>
        <version>1.6.3</version>
    </dependency>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq-plugin-sitemap</artifactId>
        <version>1.6.3</version>
    </dependency>
    <dependency>
        <groupId>io.quarkiverse.roq</groupId>
        <artifactId>quarkus-roq-generator</artifactId>
        <version>1.6.3</version>
    </dependency>
</dependencies>
```

#### Build Profiles
```xml
<profiles>
    <!-- Native Image Profile -->
    <profile>
        <id>native</id>
        <activation>
            <property>
                <name>native</name>
            </property>
        </activation>
        <properties>
            <skipITs>false</skipITs>
            <quarkus.native.enabled>true</quarkus.native.enabled>
        </properties>
    </profile>
    
    <!-- Production Profile -->
    <profile>
        <id>prod</id>
        <activation>
            <property>
                <name>prod</name>
            </property>
        </activation>
        <properties>
            <quarkus.profile>prod</quarkus.profile>
            <quarkus.package.type>fast-jar</quarkus.package.type>
            <quarkus.build.optimize>true</quarkus.build.optimize>
            <quarkus.build.optimize.imports>true</quarkus.build.optimize.imports>
        </properties>
    </profile>
</profiles>
```

### CI/CD Configuration

#### GitHub Actions Workflow (`.github/workflows/deploy.yml`)
```yaml
name: Deploy PeruJUG Site to GitHub Pages

on:
  push:
    branches: [ main ]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: true

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
        
      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'
          cache: 'maven'
          
      - name: Cache Maven packages
        uses: actions/cache@v3
        with:
          path: ~/.m2
          key: ${{ runner.os }}-m2-${{ hashFiles('**/pom.xml') }}
          restore-keys: ${{ runner.os }}-m2
          
      - name: Build and generate static site
        run: |
          QUARKUS_ROQ_GENERATOR_BATCH=true mvn package quarkus:run -DskipTests
          
      - name: Setup Pages
        uses: actions/configure-pages@v4
        
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: './target/roq'
          
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

#### Dependabot Configuration (`.github/dependabot.yml`)
```yaml
version: 2
updates:
  # Maven dependencies
  - package-ecosystem: "maven"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
      timezone: "America/Lima"
    open-pull-requests-limit: 10
    reviewers:
      - "perujug"
    assignees:
      - "perujug"
    commit-message:
      prefix: "deps"
      include: "scope"
    labels:
      - "dependencies"
      - "maven"
    ignore:
      # Ignore major version updates for critical dependencies
      - dependency-name: "io.quarkus.platform:*"
        update-types: ["version-update:semver-major"]
      - dependency-name: "io.quarkiverse.roq:*"
        update-types: ["version-update:semver-major"]

  # GitHub Actions
  - package-ecosystem: "github-actions"
    directory: "/"
    schedule:
      interval: "weekly"
      day: "monday"
      time: "09:00"
      timezone: "America/Lima"
    open-pull-requests-limit: 5
    reviewers:
      - "perujug"
    assignees:
      - "perujug"
    commit-message:
      prefix: "ci"
      include: "scope"
    labels:
      - "dependencies"
      - "github-actions"
```

### Environment Configuration

#### Git Ignore (`.gitignore`)
```gitignore
#Maven
target/
pom.xml.tag
pom.xml.releaseBackup
pom.xml.versionsBackup
release.properties
.flattened-pom.xml

# Eclipse
.project
.classpath
.settings/
bin/

# IntelliJ
.idea
*.ipr
*.iml
*.iws

# NetBeans
nb-configuration.xml

# Visual Studio Code
.vscode
.factorypath

# OSX
.DS_Store

# Vim
*.swp
*.swo

# patch
*.orig
*.rej

# Local environment
.env

# Plugin directory
/.quarkus/cli/plugins/
# TLS Certificates
.certs/
```

### Configuration Management

#### Environment Variables
- `QUARKUS_ROQ_SITE_URL`: Site URL for production builds
- `QUARKUS_ROQ_GENERATOR_BATCH`: Enable batch mode for static site generation

#### Configuration Profiles
- **Development** (default): Uses `config/application.properties`
- **Production**: Uses `config/prod/application.properties` with `-Pprod` profile

#### Content Management
- **Blog Posts**: Written in AsciiDoc format in `content/posts/`
- **Pages**: HTML files with front matter in `content/`
- **Images**: Stored in `public/images/` with organized subdirectories
- **Templates**: Qute templates in `templates/` directory

## 🔒 Security

This project follows security best practices:

- ✅ **No secrets in code** - All sensitive data uses GitHub Secrets
- ✅ **Security headers** - HSTS, CSP, and other security headers
- ✅ **Dependency scanning** - Automated vulnerability scanning via Dependabot
- ✅ **HTTPS enforcement** - All communications use HTTPS
- ✅ **Access control** - Minimal required permissions

## 📊 Community Impact

### Events Hosted
- **Java Day 2018**: Major conference with 10 international speakers
- **Java Day 2019**: Regional conference as part of Latin American Java events
- **Monthly Meetups**: Regular community gatherings

### Topics Covered
- Microservices and Serverless architectures
- Big Data and Cloud technologies
- Java and Jakarta EE development
- Reactive programming
- Performance optimization
- DevOps and CI/CD practices

### Community Reach
- **Social Media**: Active presence on Twitter, Facebook, and Meetup
- **International Collaboration**: Partnerships with JUGs across Latin America
- **Knowledge Sharing**: Regular technical presentations and workshops
- **Developer Growth**: Supporting Java developers in Peru

## About PeruJUG

PeruJUG (Peru Java User Group) is a community of Java developers and enthusiasts in Peru. Our mission is to promote Java technology and foster a strong developer community in our country.

### Our Mission

- Promote Java technology in Peru
- Provide educational resources for Java developers
- Organize meetups, workshops, and conferences
- Connect Java developers across Peru
- Share knowledge and best practices

### What We Do

- **Monthly Meetups**: Regular gatherings to discuss Java topics
- **Java Day Peru**: Annual conference featuring international speakers
- **Workshops**: Hands-on sessions for learning new Java technologies
- **Online Events**: Virtual meetups and webinars
- **Community Support**: Helping developers grow their skills

## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

### Content Contributions
- **Blog Posts**: Submit technical articles and tutorials
- **Event Coverage**: Write about meetups and conferences
- **Speaker Profiles**: Help maintain speaker information
- **Photos**: Share event photos and community moments

### Technical Contributions
- **Bug Fixes**: Report and fix issues
- **Feature Development**: Add new functionality
- **Documentation**: Improve documentation and guides
- **Design**: Enhance the website design and user experience

### Community Contributions
- **Speaking**: Present at meetups and events
- **Organizing**: Help organize events and activities
- **Mentoring**: Support new community members
- **Outreach**: Promote Java technology in Peru

## 📞 Contact

- **Website**: [perujug.org](https://perujug.org)
- **Twitter**: [@perujug](https://twitter.com/perujug)
- **Facebook**: [PeruJUG Group](https://www.facebook.com/groups/perujug)
- **Meetup**: [Peru Java User Group](https://www.meetup.com/Peru-Java-User-Group/)
- **Email**: info@perujug.org

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

**Built with ❤️ by the PeruJUG community using Quarkus ROQ** 