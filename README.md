# alpine-nginx-grav

This is my first docker image.
It is an Alpine 3.19-based image with Nginx 1.25.4, PHP 8.1.27 and Grav 1.7.44
This image was built to work on the Oracle Instances machine running Ubuntu 22.04 with the default configuration. If you have a different environment, please change the Dockerfile before building.

```bash
docker build -t <name>:<version> .
```

## What is Alpine?

Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox-based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with container images.

## What is Grav?

Grav is a modern, open-source content management system (CMS) that uses a unique flat-file approach instead of a traditional database. This means all your content, configuration, and settings are stored in simple text files and folders.
Developer-Focused: Grav strongly emphasises speed, simplicity, and flexibility for developers. It doesn't have a heavy admin interface like other CMSs, making it lightweight and highly customizable.
Markdown-Based: Content in Grav is primarily written in Markdown, a human-readable formatting syntax that makes writing and editing content easy.
Key Features

Due to its flat-file system, Grav is lightning-fast, especially for static content.
Easy Setup: There's no database to configure, installation and setup are a breeze.
Powerful Templating: Grav uses the Twig templating engine, allowing for flexible website design and layouts.
Extensible: A rich ecosystem of plugins and themes exists to add functionalities like blogs, forms, e-commerce, and more.
Modern Technologies: Built with modern technologies like YAML for configuration and Markdown for content authoring.

## When is Grav a Good Choice?

Small to Medium Websites: Grav excels with blogs, portfolios, brochure sites, or documentation sites.
Developer-Friendly Projects: If you're comfortable with basic web development concepts (HTML, CSS), Grav allows for a high level of customization.
Performance Matters: If you prioritize a blazing-fast website, Grav's flat-file approach is a major advantage.

## When Grav Might Not Be Ideal?

Large, Complex Websites: A database-driven CMS might be more manageable for sites with vast content and intricate relationships.
Non-Technical Users: If your content editors aren't comfortable with Markdown or basic code editing, Grav may have a steeper learning curve.
