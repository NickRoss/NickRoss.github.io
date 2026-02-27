# NickRoss.github.io

Personal website for Nick Ross, built with [Hugo](https://gohugo.io/) and deployed to GitHub Pages via GitHub Actions.

**Live site:** [www.nickross.site](https://www.nickross.site)

## Local Development

Everything runs via Docker. Use the Makefile:

```bash
make serve   # Build image and serve at localhost:4000
make build   # Build Docker image only
make inter   # Interactive shell in container
make trace   # Run with debug/verbose flags
make clean   # Clean up Docker resources
```

## How to Add Content

### Adding a new page to an existing section

Create a markdown file in the appropriate `content/` subdirectory:

- `content/career/` - Career advice articles
- `content/classes/` - Course pages
- `content/research/` - Research publications
- `content/talks/` - Conference talks and presentations

Each section has its own frontmatter fields. Check an existing file in the section for the expected format.

### Adding a standalone page

Create a markdown file in `content/` with a `url:` field in the frontmatter:

```yaml
---
title: Page Title
url: /my-page/
---
```

Then add a nav link in `layouts/_default/baseof.html` if needed.

### Adding a new section

1. Create `content/<section>/_index.md` with a title
2. Create `layouts/<section>/single.html` for individual pages
3. Create `layouts/<section>/list.html` for the section index
4. Add a nav link in `layouts/_default/baseof.html`

## Project Structure

```
assets/sass/       # SCSS source (compiled via Hugo Pipes)
content/           # Markdown content files
layouts/           # Hugo templates
  _default/        # Base templates (baseof.html, single.html)
  partials/        # Shared template fragments
  shortcodes/      # Reusable content shortcodes
  <section>/       # Section-specific templates
static/            # Static assets (images, PDFs, etc.)
config.yaml        # Hugo configuration
```

## Deployment

Pushes to `main` automatically trigger the GitHub Actions workflow (`.github/workflows/hugo.yml`), which builds the site with Hugo and deploys to GitHub Pages.

## Notes

- Resume (`static/assets/RossResume.pdf`) should be updated occasionally -- make sure to remove address
- Hugo version 0.111.3 extended (pinned in both Dockerfile and GitHub Actions)
