# PeruJUG Website - Quarkus ROQ Implementation

This is the PeruJUG (Peru Java User Group) website implemented using Quarkus ROQ framework. The website has been migrated from the original Jekyll-based perujugwebsite to use modern Java technologies.

## Features

- **Home Page**: Showcases the PeruJUG community with information about Java development in Peru
- **Java Day Events**: Dedicated pages for Java Day 2018 and 2019 conferences
- **Responsive Design**: Built with Materialize CSS framework for mobile-friendly experience
- **Modern Stack**: Powered by Quarkus ROQ for fast, efficient Java web development

## Technology Stack

- **Backend**: Quarkus 3.24.3 with ROQ framework
- **Frontend**: Materialize CSS, jQuery, Google Maps API
- **Build Tool**: Maven
- **Java Version**: 17

## Project Structure

```
perujug-roq/
├── content/                 # Website content
│   ├── index.html          # Home page
│   ├── javaday/            # Java Day event pages
│   │   ├── 2018.html
│   │   └── 2019.html
│   └── posts/              # Blog posts
├── templates/              # HTML templates
│   ├── layouts/            # Layout templates
│   │   ├── default.html    # Base layout
│   │   └── page.html       # Page layout with header/footer
│   └── partials/           # Reusable components
│       ├── header.html     # Navigation header
│       └── footer.html     # Site footer
├── public/                 # Static assets
│   ├── images/             # Images and logos
│   ├── js/                 # JavaScript files
│   ├── fonts/              # Font files
│   ├── materialize.css     # Materialize CSS framework
│   └── main.css            # Custom styles
├── data/                   # Site data
│   ├── menu.yml            # Navigation menu configuration
│   └── authors.yml         # Author information
└── config/                 # Application configuration
    └── application.properties
```

## Getting Started

### Prerequisites

- Java 17 or higher
- Maven 3.6 or higher

### Running the Application

1. **Development Mode**:
   ```bash
   ./mvnw quarkus:dev
   ```

2. **Production Build**:
   ```bash
   ./mvnw clean package
   java -jar target/quarkus-app/quarkus-run.jar
   ```

3. **Native Build** (requires GraalVM):
   ```bash
   ./mvnw clean package -Pnative
   ```

### Accessing the Website

- **Home Page**: http://localhost:8080
- **Java Day 2018**: http://localhost:8080/javaday/2018
- **Java Day 2019**: http://localhost:8080/javaday/2019

## Content Management

### Adding New Pages

1. Create a new HTML file in the `content/` directory
2. Add front matter with metadata:
   ```html
   ---
   title: Page Title
   description: Page description
   layout: page
   ---
   ```

### Updating Navigation

Edit `data/menu.yml` to modify the site navigation menu.

### Styling

- Main styles are in `public/main.css`
- Materialize CSS framework is used for responsive design
- Custom styles follow the original perujugwebsite design

## Migration Notes

This implementation successfully migrates the original Jekyll-based perujugwebsite to Quarkus ROQ while maintaining:

- **Visual Design**: Exact replication of the original Materialize CSS design
- **Content Structure**: All original content preserved and properly formatted
- **Functionality**: Google Maps integration, responsive navigation, and interactive elements
- **Performance**: Improved performance through Quarkus's efficient Java runtime

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is part of the PeruJUG community and follows the same licensing as the original perujugwebsite.

## Contact

- **Website**: https://perujug.org
- **Twitter**: @perujug
- **Meetup**: https://www.meetup.com/Peru-Java-User-Group/ 