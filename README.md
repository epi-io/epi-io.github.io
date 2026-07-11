# Ahmed Azeez | Portfolio & Blog

Welcome to the source repository for my personal website and portfolio. This site is built using **Hugo** (via the `blogdown` R package) and hosted on **GitHub Pages**.

## 🌐 Site Overview
- **Live Site:** [https://mscazmy.github.io/](https://mscazmy.github.io/)
- **Theme:** A customized version of the `data-science` theme.
- **Focus:** Public Health, Infectious Disease Epidemiology, and Data Science.

---

## 🗺️ Repository Map

This guide helps you navigate the project structure and understand where specific content and configurations are located.

### ⚙️ Core Configuration
- **`config.toml`**: The main configuration file. Use this to change the site title, description, and social media links.
- **`netlify.toml`**: Configuration for Netlify deployment (if applicable).

### 📝 Content & Pages
- **`content/`**: Contains the source Markdown files for all your pages.
  - `post/`: Your blog posts and articles.
  - `about/`: The "About Me" page content.
  - `apps/`: Showcases for interactive applications.
  - `certs/`: Academic and professional certifications.
  - `contact/`: The contact page details.
- **`index.html`**: The root entry point for the Hugo/blogdown site generation.

### 🎨 Assets & Styling
- **`static/`**: Files in this folder are copied directly to the root of the website.
  - `favicon.ico`, `favicon.png`, `apple-touch-icon.png`: The site's tab icons.
  - `images/`: General site images, including the logo and intro graphics.
  - `css/` & `js/`: Custom styles and scripts.
- **`themes/data-science/`**: The theme files defining the site's look and feel.
  - `layouts/partials/`: HTML snippets like `header.html` (for `<head>` tags) and `footer.html`.
  - `static/css/style.css`: The primary stylesheet.

### 🏗️ Build & Deployment
- **`public/`**: The generated static site. This folder is what actually gets served to visitors. **Note:** Do not edit files here directly; they are overwritten during the build process.

---

## 🚀 Common Tasks

### Changing the Favicon
Replace the icon files in the `static/` directory with your new images. Ensure you keep the same filenames (`favicon.ico`, `favicon.png`, etc.).

### Updating the Site Title
Edit the `title` field in the `config.toml` file at the root of the repository.

### Adding a New Post
Create a new `.md` or `.Rmd` file within the `content/post/` directory.

---

## 🛠️ Technology Stack
- **Hugo**: Static site generator.
- **Blogdown**: R package for managing Hugo sites.
- **GitHub Actions/Pages**: For hosting and automated deployment.
