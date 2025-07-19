# Dynamic Configuration for PeruJUG Website

This directory contains dynamic configuration files for the PeruJUG website, inspired by the roq-bistro project approach.

## Files

### `posts.yml`
Contains dynamic configuration for blog posts and the Latest Posts section.

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

## Template Integration

The configuration is used in templates via Qute syntax:
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

## Inspired by roq-bistro

This approach is inspired by the roq-bistro project's menu configuration:
- Dynamic data-driven content
- YAML configuration files
- Qute template integration
- Easy maintenance and updates 