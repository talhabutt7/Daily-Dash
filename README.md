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
