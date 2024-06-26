# DailyDrift

DailyDrift is a blogging platform built with Ruby on Rails and styled using Tailwind CSS. It allows users to create, edit, publish, and manage blog posts with ease. The application supports user authentication and includes rich text editing for content creation.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Usage](#usage)
- [Models](#models)
    - [BlogPost](#blogpost)
- [Controllers](#controllers)
    - [BlogPostsController](#blogpostscontroller)
- [Views](#views)
- [Contributing](#contributing)
- [License](#license)

## Features

- User authentication
- Create, edit, delete, and view blog posts
- Rich text editing for blog content
- Draft, scheduled, and published post statuses
- Responsive and modern UI using Tailwind CSS

## Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- Ruby (>= 3.0)
- Rails (>= 7.0)
- PostgreSQL (or any other preferred database)
- Node.js and Yarn

### Installation

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/dailydrift.git
   cd dailydrift

2. Install the dependencies:
bundle install
yarn install

3. Set up the database:
rails db:create
rails db:migrate

4. Start the Rails server:
rails server

5. Open your browser and navigate to http://localhost:3000.

Usage
Sign up for an account or log in if you already have one.
Create a new blog post by clicking the "New Post" button.
Fill in the title and content, and set the publish date if needed.
Save the post. It will be displayed on the main page according to its status (Draft, Scheduled, Published).


Models
BlogPost
The BlogPost model represents a blog post with the following attributes:

title: The title of the blog post.
content: The rich text content of the blog post.
published_at: The date and time when the post is published.


Validations
title and content must be present.

Scopes
sorted: Orders posts by published date (newest first) and updated date.
draft: Returns posts that are not yet published.
published: Returns posts that are published.
scheduled: Returns posts that are scheduled for future publication.

Instance Methods
draft?: Returns true if the post is a draft.
published?: Returns true if the post is published.
scheduled?: Returns true if the post is scheduled.


Controllers
BlogPostsController
The BlogPostsController handles CRUD operations for BlogPost objects.

Actions
index: Displays a list of all blog posts. Shows all posts if the user is signed in, otherwise only published posts.
show: Displays a single blog post.
new: Renders a form for creating a new blog post.
create: Creates a new blog post with the provided parameters.
edit: Renders a form for editing an existing blog post.
update: Updates an existing blog post with the provided parameters.
destroy: Deletes a blog post.
Private Methods
set_blog_post: Finds a blog post based on the user's sign-in status and the post's publication status.
blog_post_params: Permits the parameters title, content, and published_at.


Views
The views are organized to provide a clean and modern user interface using Tailwind CSS.

application.html.erb: The main layout file.
index.html.erb: Displays the list of blog posts.
show.html.erb: Displays a single blog post.
edit.html.erb: Renders the form for editing a blog post.
new.html.erb: Renders the form for creating a new blog post.
_form.html.erb: The shared form partial used for new and edit actions.
_navbar.html.erb: The navigation bar partial.


Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/talhabutt7/dailydrift. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

