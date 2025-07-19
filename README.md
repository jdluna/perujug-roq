# PeruJUG Website - Quarkus ROQ Implementation

This is the PeruJUG (Peru Java User Group) website implemented using Quarkus ROQ framework. The website has been migrated from the original Jekyll-based perujugwebsite to use modern Java technologies.

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

## Technology Stack

- **Backend**: Quarkus 3.24.3 with ROQ framework
- **Frontend**: Materialize CSS, jQuery, Google Maps API
- **Build Tool**: Maven
- **Java Version**: 17
- **Templating**: Qute template engine

## Project Structure

```
perujug-roq/
├── content/                 # Website content
│   ├── index.html          # Home page
│   ├── about/              # About page
│   │   └── index.md
│   ├── contact/            # Contact page
│   │   └── index.md
│   ├── events/             # Events page
│   │   └── index.md
│   ├── javaday/            # Java Day event pages
│   │   ├── 2018.html
│   │   └── 2019.html
│   └── posts/              # Blog posts
├── templates/              # HTML templates
│   ├── layouts/            # Layout templates
│   │   ├── default.html    # Base layout
│   │   └── page.html       # Page layout with header/footer
│   └── partials/           # Reusable components
│       ├── navigation.html # Navigation header
│       ├── latest-posts.html # Latest posts section
│       └── footer.html     # Site footer
├── public/                 # Static assets
│   ├── images/             # Images and logos
│   ├── js/                 # JavaScript files
│   ├── fonts/              # Font files
│   ├── materialize.css     # Materialize CSS framework
│   └── main.css            # Custom styles
├── data/                   # Site data
│   ├── menu.yml            # Navigation menu configuration
│   ├── posts.yml           # Blog posts configuration
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
- **About Page**: http://localhost:8080/about/
- **Contact Page**: http://localhost:8080/contact/
- **Events Page**: http://localhost:8080/events/
- **Java Day 2018**: http://localhost:8080/javaday/2018
- **Java Day 2019**: http://localhost:8080/javaday/2019

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
2. Add front matter with metadata:
   ```html
   ---
   title: Page Title
   description: Page description
   layout: page
   ---
   ```

### Adding New Posts

1. Add a new entry to `latest_posts` in `posts.yml`
2. The post will automatically appear in the Latest Posts section
3. No HTML changes required

**Example:**
```yaml
- title: "New Java Tutorial"
  date: "12/25"
  description: "Learn about the latest Java features"
  url: "/new-java-tutorial/"
  full_date: "December 25, 2024"
  author: "PeruJUG"
  category: "Technical"
  featured: true
  tags: ["java", "tutorial", "learning"]
```

### Adding New Menu Items

1. Add a new entry to `main_menu` in `menu.yml`
2. The menu item will automatically appear in the navigation
3. No HTML changes required

**Example:**
```yaml
- title: "About Us"
  url: "/about/"
  icon: "info"
  external: false
```

### Adding New Events

1. Add a new entry to `events_dropdown.items` in `menu.yml`
2. The event will automatically appear in the Events dropdown
3. Also add to `mobile_menu` for mobile navigation
4. No HTML changes required

### Adding New Submenus

1. Add a new entry to `events_dropdown.items` with `type: "submenu"`
2. Include a unique `submenu_id` and nested `items` array
3. The submenu will appear in the Events dropdown with a right arrow

**Example:**
```yaml
# Regular event
- title: "Workshop"
  url: "/workshop/"
  description: "Java Workshop"

# Submenu with nested items
- title: "Java Day"
  type: "submenu"
  submenu_id: "javaday-submenu"
  items:
    - title: "Java Day 2024"
      url: "/javaday/2024/"
      year: "2024"
      description: "Java Day Peru 2024"
```

### Adding New Categories

1. Add a new entry to `categories` in `posts.yml`
2. Assign the category to posts
3. The category will be displayed with its color

## Template Integration

The configuration is used in templates via Qute syntax:

### Posts Template:
```html
{#for post in cdi:posts.latest_posts}
<li class="collection-item avatar">
  <div class="date-post">{post.date}</div>
  <span class="title">
    <a class="post-link" href="{post.url}">{post.title}</a>
  </span>
  <p>{post.description}</p>
</li>
{/for}
```

### Menu Template:
```html
{#for item in cdi:menu.main_menu}
<li>
  <a href="{item.url}" {#if item.external}target="_blank"{/if} class="nav-link">
    {#if item.icon}<i class="material-icons left">{item.icon}</i>{/if}
    <span class="nav-text">{item.title}</span>
  </a>
</li>
{/for}

<li class="dropdown-container">
  <a class="dropdown-trigger" data-target="{cdi:menu.menu_config.dropdown_id}">
    <i class="material-icons left">{cdi:menu.events_dropdown.icon}</i>
    <span class="nav-text">{cdi:menu.events_dropdown.title}</span>
    <i class="material-icons right">{cdi:menu.events_dropdown.dropdown_icon}</i>
  </a>
  <ul id="{cdi:menu.menu_config.dropdown_id}" class="dropdown-content">
    {#for item in cdi:menu.events_dropdown.items}
    {#if item.type?? && item.type == "submenu"}
    <li class="submenu-container">
      <a href="#" class="submenu-trigger" data-target="{item.submenu_id}">
        {item.title}
        <i class="material-icons right">arrow_right</i>
      </a>
      <ul id="{item.submenu_id}" class="submenu-content">
        {#for subitem in item.items}
        <li><a href="{subitem.url}">{subitem.title}</a></li>
        {/for}
      </ul>
    </li>
    {#else}
    <li><a href="{item.url}">{item.title}</a></li>
    {/if}
    {/for}
  </ul>
</li>
```

## Events

### Upcoming Events

Stay tuned for our upcoming events! We regularly host meetups, workshops, and conferences.

### Past Events

- **Java Day Peru 2023**: Our annual conference featuring international speakers and local Java experts
- **Java Day Peru 2022**: A successful event with workshops, talks, and networking opportunities

### Event Types

- **Monthly Meetups**: Regular community gatherings
- **Java Day Peru**: Annual conference
- **Workshops**: Hands-on learning sessions
- **Online Events**: Virtual meetups and webinars

For more information about our events, follow us on social media or join our mailing list.

## Contact

### Get in Touch

We'd love to hear from you! Here are the best ways to reach us:

### Social Media

- **Twitter**: [@perujug](https://twitter.com/perujug)
- **GitHub**: [perujug](https://github.com/perujug)
- **LinkedIn**: [perujug](https://linkedin.com/company/perujug)

### Community Channels

- **Meetup Group**: Join our meetup group for event updates
- **Slack**: Connect with other community members
- **Discord**: Join our Discord server for discussions

### For Speakers

Interested in speaking at one of our events? We're always looking for speakers to share their knowledge with the community.

### For Sponsors

Want to support our community? We welcome sponsors for our events and activities.

### For Organizers

Looking to start a JUG in your area? We're happy to help and share our experience.

---

*PeruJUG is a volunteer-run community. We appreciate your patience and support!*

## Migration Notes

This implementation successfully migrates the original Jekyll-based perujugwebsite to Quarkus ROQ while maintaining:

- **Visual Design**: Exact replication of the original Materialize CSS design
- **Content Structure**: All original content preserved and properly formatted
- **Functionality**: Google Maps integration, responsive navigation, and interactive elements
- **Performance**: Improved performance through Quarkus's efficient Java runtime
- **Dynamic Configuration**: Enhanced with YAML-based content management

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Join Us

Whether you're a beginner or an experienced Java developer, there's a place for you in our community. Join us at our next event and become part of the growing Java community in Peru!

## License

This project is part of the PeruJUG community and follows the same licensing as the original perujugwebsite.

## Contact

- **Website**: https://perujug.org
- **Twitter**: @perujug
- **Meetup**: https://www.meetup.com/Peru-Java-User-Group/ 