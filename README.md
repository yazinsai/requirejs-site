# Start Style Guide
SCSS style-guide for all browser-based projects. Helps keep us from having to recreate the same CSS styles everytime we create a new project (which tends to happen quite a bit these days).

## Folder structure
The repo looks like this:
- `/base`: contains things like color settings, normalized styles
- components: kinda like directives in Angular, these are things you typically use on their own (like buttons, forms, etc.)
- fonts
- images
- utils
- vendors

## How to add stuff
The project is structured like so:
- There's a `main.scss` file in the root folder that includes the `_module.scss` file in each folder (e.g. `@import "base/module"`, etc.).
- The `_module.scss` file in each of these folders imports all of the files in that folder.

### Example: Adding a component
