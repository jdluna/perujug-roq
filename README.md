# PeruJUG Website with Quarkus Roq

This is the PeruJUG website built with Quarkus and Roq framework.

## Prerequisites

- Java 17 or later
- Gradle 7.0 or later

## Running the Application

### Development Mode

```bash
./gradlew quarkusDev
```

The application will be available at `http://localhost:8080`

### Production Build

```bash
./gradlew build
./gradlew quarkusBuild
```

### Running the JAR

```bash
java -jar build/quarkus-app/quarkus-run.jar
```

## Project Structure

- `src/main/java/org/perujug/` - Java source code
  - `controller/` - REST controllers with Roq annotations
  - `model/` - Data models
  - `service/` - Business logic services
- `src/main/resources/` - Configuration and templates
  - `templates/` - Qute templates
  - `static/` - Static assets (CSS, JS, images)
  - `application.properties` - Application configuration

## Features

- Home page with latest posts
- Template-based rendering with Qute
- Materialize CSS for styling
- Roq framework integration for simplified web development

## Configuration

The application is configured through `application.properties`:

- Server port: 8080
- Template engine: Qute
- Static files path: `/static`
- Templates path: `/templates`

## Development

The application supports live reload in development mode. Any changes to Java files or templates will automatically trigger a reload. 