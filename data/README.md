# Dynamic Configuration for PeruJUG Website

This directory contains dynamic configuration files for the PeruJUG website, inspired by the roq-bistro project approach.

## Files

### `posts.yml`
Contains dynamic configuration for blog posts and the Latest Posts section.

### `menu.yml`
Contains dynamic configuration for the navigation menu and Java Day dropdown.

#### Structure:
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

#### Benefits:
- **Easy Management**: Add/remove posts without touching HTML
- **Consistent Styling**: All posts follow the same structure
- **Flexible**: Easy to add new fields and metadata
- **Maintainable**: Centralized configuration

### `menu.yml` Structure:
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

#### Benefits:
- **Easy Management**: Add/remove menu items without touching HTML
- **Consistent Navigation**: All pages use the same menu structure
- **Flexible**: Easy to add new menu items and dropdowns
- **Maintainable**: Centralized menu configuration

## Usage

### Adding a New Post
1. Add a new entry to `latest_posts` in `posts.yml`
2. The post will automatically appear in the Latest Posts section
3. No HTML changes required

### Example:
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

### Adding a New Category
1. Add a new entry to `categories` in `posts.yml`
2. Assign the category to posts
3. The category will be displayed with its color

### Adding a New Menu Item
1. Add a new entry to `main_menu` in `menu.yml`
2. The menu item will automatically appear in the navigation
3. No HTML changes required

### Example:
```yaml
- title: "About Us"
  url: "/about/"
  icon: "info"
  external: false
```

### Adding a New Event
1. Add a new entry to `events_dropdown.items` in `menu.yml`
2. The event will automatically appear in the Events dropdown
3. Also add to `mobile_menu` for mobile navigation
4. No HTML changes required

### Adding a New Submenu
1. Add a new entry to `events_dropdown.items` with `type: "submenu"`
2. Include a unique `submenu_id` and nested `items` array
3. The submenu will appear in the Events dropdown with a right arrow

### Example:
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

## Inspired by roq-bistro

This approach is inspired by the roq-bistro project's menu configuration:
- Dynamic data-driven content
- YAML configuration files
- Qute template integration
- Easy maintenance and updates 