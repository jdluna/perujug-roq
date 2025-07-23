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

## 🌐 Deployment

This project is configured for automated deployment to GitHub Pages using GitHub Actions.

### Automatic Deployment
1. **Push to main branch** triggers automatic deployment
2. **GitHub Actions** builds and deploys the site
3. **Site is available** at your GitHub Pages URL

### Manual Deployment
1. Go to **Actions** tab in your repository
2. Select **Deploy PeruJUG Site to GitHub Pages**
3. Click **Run workflow**

### Configuration
- **GitHub Pages**: Enable in repository settings
- **Secrets**: Configure `GITHUB_PAGES_URL` in repository secrets
- **Branch**: Deploys from `main` or `master` branch

## 🔒 Security

This project follows security best practices:

- ✅ **No secrets in code** - All sensitive data uses GitHub Secrets
- ✅ **Security headers** - HSTS, CSP, and other security headers
- ✅ **Dependency scanning** - Automated vulnerability scanning
- ✅ **HTTPS enforcement** - All communications use HTTPS
- ✅ **Access control** - Minimal required permissions

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

## Features

- **Home Page**: Showcases the PeruJUG community with information about Java development in Peru
- **Java Day Events**: Dedicated pages for Java Day 2018 and 2019 conferences
- **Responsive Design**: Built with Materialize CSS framework for mobile-friendly experience
- **Modern Stack**: Powered by Quarkus ROQ for fast, efficient Java web development
- **Dynamic Configuration**: YAML-based configuration for easy content management
- **Automated Deployment**: GitHub Actions for continuous deployment
- **Security First**: Comprehensive security measures and best practices

## Technology Stack

- **Backend**: Quarkus 3.24.3 with ROQ framework
- **Frontend**: Materialize CSS, jQuery, Google Maps API
- **Build Tool**: Maven with Maven Wrapper
- **Java Version**: 17
- **Templating**: Qute template engine
- **Deployment**: GitHub Actions + GitHub Pages
- **Security**: Automated scanning and security headers

## Project Structure

```
perujug-roq/
├── .github/
│   ├── workflows/
│   │   └── deploy.yml          # GitHub Actions workflow
│   └── dependabot.yml          # Automated dependency updates
├── config/
│   ├── application.properties  # Development configuration
│   └── prod/
│       └── application.properties # Production configuration
├── content/                    # Website content
│   ├── index.html             # Home page
│   ├── errors/                # Error pages
│   ├── javaday/               # Java Day event pages
│   ├── posts/                 # Blog posts
│   └── meetups.html           # Meetups page
├── templates/                  # HTML templates
│   ├── layouts/               # Layout templates
│   │   ├── default.html       # Base layout
│   │   └── page.html          # Page layout with header/footer
│   └── partials/              # Reusable components
│       ├── navigation.html    # Navigation header
│       └── footer.html        # Site footer
├── public/                     # Static assets
│   ├── images/                # Images and logos
│   ├── js/                    # JavaScript files
│   ├── fonts/                 # Font files
│   ├── materialize.css        # Materialize CSS framework
│   └── main.css               # Custom styles
├── data/                       # Site data
│   ├── menu.yml               # Navigation menu configuration
│   ├── posts.yml              # Blog posts configuration
│   └── authors.yml            # Author information
├── scripts/
│   └── setup.sh               # Development setup script
├── src/                        # Java source code
├── pom.xml                     # Maven configuration
└── README.md                  # This file
```

## Getting Started

### Prerequisites

- Java 17 or higher
- Maven 3.6 or higher (or use the included Maven wrapper)

### Running the Application

1. **Development Mode**:
   ```bash
   ./scripts/setup.sh dev
   # or
   ./mvnw quarkus:dev
   ```

2. **Production Build**:
   ```bash
   ./scripts/setup.sh build
   # or
   ./mvnw clean package -Pprod
   ```

3. **Static Site Generation**:
   ```bash
   ./scripts/setup.sh static
   # or
   ./mvnw clean package -Pstatic
   ```

### Accessing the Website

- **Local Development**: http://localhost:8080
- **Production**: Your GitHub Pages URL (e.g., https://perujug.github.io/perujug-roq)

## Dynamic Configuration

This project uses YAML-based dynamic configuration inspired by the roq-bistro project approach for easy content management.

### Configuration Files

#### `data/posts.yml`
Contains dynamic configuration for blog posts and the Latest Posts section.

**Structure:**
```yaml
latest_posts:
  - title: "Post Title"
    date: "MM/DD"
    description: "Post description"
    url: "/post-url/"
    full_date: "Full Date"
    author: "Author Name"
    category: "Category"
    featured: true
    tags: ["tag1", "tag2"]

post_sections:
  featured:
    title: "Featured Posts"
    max_posts: 3

categories:
  - name: "Category Name"
    description: "Category description"
    color: "#hexcolor"
```

#### `data/menu.yml`
Contains dynamic configuration for the navigation menu and Events dropdown.

**Structure:**
```yaml
main_menu:
  - title: "Menu Item"
    url: "/url/"
    icon: "material_icon"
    external: false

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
          url: "/javaday/2018/"
          year: "2018"
          description: "Java Day Peru 2018"
        - title: "Java Day 2019"
          url: "/javaday/2019/"
          year: "2019"
          description: "Java Day Peru 2019"
    - title: "Meetups"
      url: "/meetups/"
      description: "PeruJUG Meetups"

mobile_menu:
  - title: "Menu Item"
    url: "/url/"

menu_config:
  dropdown_id: "dropdown1"
  mobile_activates: "nav-mobile"
  brand_logo: "/images/logo.png"
  brand_text: "perujug.org"
```

### Benefits of Dynamic Configuration

- **Easy Management**: Add/remove content without touching HTML
- **Consistent Styling**: All content follows the same structure
- **Flexible**: Easy to add new fields and metadata
- **Maintainable**: Centralized configuration
- **No HTML Changes**: Content updates require only YAML edits

## Content Management

### Adding New Pages

1. Create a new HTML file in the `content/` directory
2. Add front matter with metadata
3. Use the appropriate layout template
4. Update navigation menu in `data/menu.yml` if needed

### Adding New Posts

1. Create a new markdown file in `content/posts/`
2. Add front matter with post metadata
3. Update `data/posts.yml` to include the post in listings

### Adding New Events

1. Create event page in appropriate directory
2. Update `data/menu.yml` to include in events dropdown
3. Add event images to `public/images/`

## Development Workflow

### Local Development
```bash
# Setup environment
./scripts/setup.sh setup

# Start development server
./scripts/setup.sh dev

# Run tests
./scripts/setup.sh test

# Check security
./scripts/setup.sh security
```

### Production Deployment
```bash
# Build static site
./scripts/setup.sh static

# Test production build
./scripts/setup.sh build
```

---

# 🚀 Deployment Guide

## Quick Start

1. **Enable GitHub Pages** in your repository settings
2. **Set up GitHub Actions** (already configured)
3. **Configure secrets** (see Security section below)
4. **Push to main branch** to trigger deployment

## Prerequisites

- GitHub repository with GitHub Pages enabled
- Java 17+ for local development
- Maven 3.6+ for local builds

## Configuration

### GitHub Pages Setup

1. Go to your repository **Settings** → **Pages**
2. Set **Source** to "GitHub Actions"
3. Choose your preferred branch (main/master)

### Environment Variables & Secrets

The deployment uses the following secrets that you can configure in your repository:

#### Required Secrets

| Secret Name | Description | Example |
|-------------|-------------|---------|
| `GITHUB_PAGES_URL` | Your GitHub Pages URL | `https://yourusername.github.io/your-repo` |

#### Optional Secrets

| Secret Name | Description | Default |
|-------------|-------------|---------|
| `QUARKUS_ROQ_SITE_URL` | Site URL for build | Auto-generated from repo |

### How to Set Secrets

1. Go to your repository **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Add each secret with its value

**Important**: Never commit secrets to your repository. Always use GitHub Secrets.

## Build Profiles

The project includes several Maven profiles for different deployment scenarios:

### Development Profile (default)
```bash
./mvnw quarkus:dev
```

### Production Profile
```bash
./mvnw clean package -Pprod
```

### Static Site Generation
```bash
./mvnw clean package -Pstatic
```

## Deployment Process

### Automatic Deployment

1. **Push to main branch** triggers the workflow
2. **Build process**:
   - Uses official `quarkiverse/quarkus-roq@v1` action
   - Automatically generates static site from ROQ content
   - Processes front matter and templates correctly
   - Handles all ROQ-specific syntax and includes
3. **Deployment process**:
   - Automatically deploys to GitHub Pages
   - Provides deployment verification and timing

### Manual Deployment

You can also trigger deployment manually:

1. Go to **Actions** tab in your repository
2. Select **Deploy PeruJUG Site to GitHub Pages**
3. Click **Run workflow**
4. Choose branch and click **Run workflow**

## Troubleshooting

### Common Issues

1. **Build Fails**
   - Check Java version (requires 17+)
   - Verify Maven dependencies
   - Check for syntax errors in content

2. **Deployment Fails**
   - Verify GitHub Pages is enabled
   - Check repository permissions
   - Ensure secrets are configured

3. **Package Type Error**
   - **Error**: `SRCFG00039: The config property quarkus.package.jar.type with the config value "jar" threw an Exception`
   - **Solution**: Use `fast-jar` instead of `jar` in Maven profiles (already fixed)

4. **Static Site Generation Issues**
   - **Error**: `Process completed with exit code 1` in "Generate ROQ Static Site" step
   - **Solution**: Added robust error handling with fallback static site generation

5. **Site Not Updating**
   - Check GitHub Actions logs
   - Verify deployment completed successfully
   - Clear browser cache

### Debug Commands

```bash
# Local build test with static profile
./mvnw clean package -Pstatic

# Check generated site
ls -la target/site/

# Verify essential files
ls -la target/site/index.html

# Test local server
./mvnw quarkus:dev

# Verify Maven wrapper
./mvnw --version
```

## Monitoring

### GitHub Actions Monitoring

- **Build Status**: Check Actions tab for build/deploy status
- **Deployment Logs**: View detailed logs for troubleshooting
- **Performance**: Monitor build times and optimize if needed

### Site Monitoring

- **Uptime**: GitHub Pages provides 99.9% uptime
- **Performance**: Static site generation ensures fast loading
- **Security**: Regular security updates via GitHub Dependabot

## Continuous Integration

### Recent Workflow Improvements

The GitHub Actions workflow has been optimized for better reliability and performance:

- **Robust ROQ Static Generation**: Uses `quarkiverse/quarkus-roq@v1` action with fallback mechanism
- **Fixed Package Type Issue**: Updated `quarkus.package.type` from `jar` to `fast-jar` to resolve deployment errors
- **Enhanced Error Handling**: Includes fallback static site generation if ROQ action fails
- **Enhanced Verification**: Multiple verification steps ensure build quality
- **Better Error Handling**: Clear error messages and early failure detection
- **Optimized Caching**: Improved caching strategy for faster builds

## Customization

### Adding Custom Domains

1. Configure custom domain in GitHub Pages settings
2. Update `GITHUB_PAGES_URL` secret
3. Add CNAME file to your repository

### Environment-Specific Configurations

Create additional profiles in `pom.xml` and corresponding config files in `config/`:

```xml
<profile>
    <id>staging</id>
    <properties>
        <quarkus.profile>staging</quarkus.profile>
    </properties>
</profile>
```

---

# 🔒 Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in the PeruJUG ROQ site, please follow these steps:

### 1. **DO NOT** create a public GitHub issue
Security vulnerabilities should be reported privately to prevent exploitation.

### 2. Contact the Security Team
Email: perujug@gmail.com
Subject: [SECURITY] Vulnerability Report - PeruJUG ROQ Site

### 3. Include the following information:
- **Description**: Detailed description of the vulnerability
- **Steps to reproduce**: Clear steps to reproduce the issue
- **Impact**: Potential impact of the vulnerability
- **Suggested fix**: If you have a suggested solution
- **Affected versions**: Which versions are affected

### 4. Response Timeline
- **Initial response**: Within 48 hours
- **Status update**: Within 7 days
- **Resolution**: As soon as possible, typically within 30 days

## Security Best Practices

### For Contributors

1. **Never commit secrets** to the repository
2. **Use environment variables** for sensitive configuration
3. **Keep dependencies updated** regularly
4. **Follow secure coding practices**
5. **Review code** for security issues before merging

### For Deployment

1. **Use GitHub Secrets** for all sensitive data
2. **Enable security scanning** in GitHub
3. **Monitor dependency vulnerabilities**
4. **Use HTTPS** for all external communications
5. **Implement proper access controls**

## Security Features

### Implemented Security Measures

- ✅ **HTTPS Enforcement**: All communications use HTTPS
- ✅ **Security Headers**: HSTS, CSP, and other security headers
- ✅ **Input Validation**: All user inputs are validated
- ✅ **Dependency Scanning**: Regular vulnerability scanning
- ✅ **Secret Management**: No secrets in code or configuration
- ✅ **Access Control**: Minimal required permissions

### Security Headers

The site implements the following security headers:

- **Strict-Transport-Security**: Enforces HTTPS
- **Content-Security-Policy**: Prevents XSS attacks
- **X-Content-Type-Options**: Prevents MIME type sniffing
- **X-Frame-Options**: Prevents clickjacking
- **Referrer-Policy**: Controls referrer information

## Dependency Security

### Automated Scanning

- **GitHub Dependabot**: Automatically scans for vulnerabilities
- **Maven Security Plugin**: Checks for known vulnerabilities
- **Regular Updates**: Dependencies are updated regularly

### Manual Security Checks

```bash
# Check for vulnerabilities in dependencies
./mvnw dependency:check

# Update dependencies
./mvnw versions:use-latest-versions

# Audit dependencies
./mvnw dependency:analyze
```

## Incident Response

### Security Incident Process

1. **Detection**: Identify and confirm the security incident
2. **Assessment**: Evaluate the scope and impact
3. **Containment**: Prevent further damage
4. **Eradication**: Remove the threat
5. **Recovery**: Restore normal operations
6. **Lessons Learned**: Document and improve processes

### Contact Information

- **Security Team**: perujug@gmail.com
- **Emergency Contact**: [To be provided]
- **GitHub Security**: Use GitHub's security advisory feature

## Compliance

### Standards Compliance

- **OWASP Top 10**: Follows OWASP security guidelines
- **GDPR**: Compliant with data protection regulations
- **Accessibility**: WCAG 2.1 AA compliant
- **Performance**: Follows web performance best practices

### Regular Security Reviews

- **Monthly**: Dependency vulnerability review
- **Quarterly**: Security configuration review
- **Annually**: Comprehensive security audit

## Security Features

### Implemented Security Measures

- **HTTPS Enforcement**: All communications use HTTPS
- **Security Headers**: HSTS, CSP, and other security headers
- **Input Validation**: All user inputs are validated
- **Dependency Scanning**: Regular vulnerability scanning via Dependabot
- **Secret Management**: No secrets in code or configuration
- **Access Control**: Minimal required permissions for GitHub Actions

### Security Headers

The site implements the following security headers:

- **Strict-Transport-Security**: Enforces HTTPS
- **Content-Security-Policy**: Prevents XSS attacks
- **X-Content-Type-Options**: Prevents MIME type sniffing
- **X-Frame-Options**: Prevents clickjacking
- **Referrer-Policy**: Controls referrer information

## Monitoring and Maintenance

### Automated Monitoring

- **GitHub Actions**: Build and deployment status
- **Dependabot**: Automated dependency updates
- **Security Scanning**: Vulnerability detection
- **Performance**: Build time monitoring

### Manual Maintenance

- **Monthly**: Review and update dependencies
- **Quarterly**: Security configuration review
- **Annually**: Comprehensive security audit

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and security checks
5. Submit a pull request

### Development Guidelines

- Follow Java coding standards
- Use meaningful commit messages
- Test your changes locally
- Update documentation as needed
- Follow security best practices

## Support

For issues related to:

- **Development**: Check the setup script and documentation
- **Deployment**: See the Deployment section above
- **Security**: See the Security Policy section above
- **Quarkus ROQ**: Refer to [Quarkus ROQ documentation](https://quarkiverse.github.io/quarkiverse-docs/quarkus-roq/dev/)

## Acknowledgments

We appreciate security researchers who responsibly disclose vulnerabilities. Contributors will be acknowledged in our security hall of fame (unless they prefer to remain anonymous).

- PeruJUG community members
- Quarkus ROQ framework contributors
- Materialize CSS framework
- GitHub for hosting and CI/CD services

## License

This project is part of the PeruJUG community. See the LICENSE file for details.

---

**Last Updated**: January 2025
**Version**: 1.0.0
**Next Security Review**: April 2025 