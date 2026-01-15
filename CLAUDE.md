# CLAUDE.md - Guidelines for Agentic Coding Assistants

## Build Commands
- `make build` - Build Docker image only
- `make serve` - Build and serve Jekyll site (localhost:4000)
- `make inter` - Interactive shell in container
- `make trace` - Run with debug tracing for troubleshooting
- `make clean` - Clean up Docker resources
- `./build_and_run_server.sh` - One-step build and run

## Development
- Jekyll 4.2.0 static site generator
- Docker-based development for consistent environment
- Markdown content with GitHub Flavored Markdown (GFM)
- Add new content to appropriate collection (_career, _classes, etc.)

## Style Guidelines
- SCSS with expanded style (not minified)
- Follow existing directory structure (_career, _classes, etc.)
- New content types require _config.yml update
- Content files use Jekyll frontmatter (YAML)
- Each collection has a dedicated layout in _layouts/
- Use absolute paths for links between pages
- Rouge syntax highlighter for code blocks

## Testing
- Local testing via `make serve` or `./build_and_run_server.sh`
- Verify site renders correctly at localhost:4000
- Site rebuilds automatically with livereload when files change

## Other notes
- Do not install any packages. Everything is run via make and docker in it's own VM.
- Do not run things directly. Only use the make file.
