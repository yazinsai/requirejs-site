# Start Style Guide
SCSS style-guide for all browser-based projects. Helps keep us from having to recreate the same CSS styles everytime we create a new project (which tends to happen quite a bit these days).

## Adding the Style Guide to your project

#### Step 1: Add it to your `bower.json` file

That can be done like so:
```json
"dependencies": {
  "start-style-guide": "~0.1"
},
```

#### Step 2: Install it

Just run `bower install` to pull in the latest version of the style guide to your repository.

#### Step 3: Reference the SCSS files into your repo

Now make sure you have a `main.scss` that serves as the main entry point for your repository's SCSS. You'll add the style guide in there (along with your `layouts` and `pages` folders, which are repo-specific):

```scss
// Style guide
@import 'app/bower_components/start-style-guide/main';

// Add your project-specific styles
@import 'layout/module';
@import 'pages/module';
```

**Note:** If you get an error similar to the one below: 
```
Error: File to import not found or unreadable: app/bower_components/start-style-guide/main.
```
..  then make sure that you've set the `loadPath` parameter in your `Gruntfile`. Here's what that might look like in Coffeescript:

```coffee
sass:
  app:
    options:
      style: 'compressed',
      loadPath: '.', # evaluate relative references from the root dir
    files:
      ...
```

#### Step 4: Update your Gruntfile
Copy the assets (images/fonts) from the style guide. Here's an example in Coffeescript that copies the relevant fonts and images to their respective directories (which may vary by repository).

```coffee
copy:
  images: files: [ {
    expand: true
    cwd: ''
    src: [ '<%= styleguidedir %>/images/**' ]
    dest: '<%= distdir %>/images/'
  } ]
  fonts: files: [ {
    expand: true
    cwd: '<%= styleguidedir %>/fonts/'
    src: [ '**' ]
    dest: '<%= distdir %>/stylesheets/fonts/'
  } ]
```

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
