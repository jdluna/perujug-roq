# PeruJUG Website

The official website for PeruJUG (Peru Java User Group) built with Quarkus ROQ.

## 🚀 Quick Start

### Prerequisites
- Java 17 or higher
- Maven (or use the included Maven wrapper)

### Development
```bash
# Setup development environment
./scripts/setup.sh setup

# Start development server
./scripts/setup.sh dev

# The site will be available at: http://localhost:8080/perujug-roq/
```

### Build & Deploy
```bash
# Generate static site for GitHub Pages
./scripts/setup.sh static

# Build for production
./scripts/setup.sh build
```

## 📁 Project Structure

```
perujug-roq/
├── content/          # Website content (pages, posts, events)
├── data/            # Dynamic configuration (menu, posts, authors)
├── templates/       # Qute templates (layouts, partials)
├── public/          # Static assets (images, CSS, JS)
├── config/          # Application configuration
├── scripts/         # Build and deployment scripts
└── pom.xml          # Maven project configuration
```

## 🛠️ Available Scripts

| Command | Description |
|---------|-------------|
| `./scripts/setup.sh setup` | Initialize development environment |
| `./scripts/setup.sh dev` | Start development server |
| `./scripts/setup.sh static` | Generate static site for GitHub Pages |
| `./scripts/setup.sh build` | Build for production |
| `./scripts/setup.sh test` | Run tests |
| `./scripts/setup.sh clean` | Clean project |
| `./scripts/setup.sh validate` | Validate project structure |
| `./scripts/setup.sh info` | Show project information |
| `./scripts/setup.sh help` | Show help message |

## 📝 Content Management

### Adding Blog Posts
1. Create AsciiDoc files in `content/posts/YYYY/`
2. Add metadata to `data/posts.yml`
3. Add author info to `data/authors.yml` if needed

### Updating Navigation
Edit `data/menu.yml` to modify the site navigation structure.

### Configuration
- **Development**: `config/application.properties`
- **Production**: `config/prod/application.properties`

## 🚀 Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

### Manual Deployment
```bash
# Generate static site
./scripts/setup.sh static

# The static files will be in target/roq/
```

## 🛠️ Technology Stack

- **Framework**: Quarkus ROQ 1.6.3
- **Java**: 17
- **Build Tool**: Maven
- **Templates**: Qute
- **Content**: AsciiDoc + HTML
- **Styling**: Materialize CSS
- **Deployment**: GitHub Pages

## 📞 Contact

- **Email**: perujug@gmail.com
- **Twitter**: [@perujug](https://twitter.com/perujug)
- **GitHub**: [perujug](https://github.com/perujug)
- **Website**: [perujug.org](https://perujug.org)

---

**PeruJUG** - Java User Group of Peru 🇵🇪 