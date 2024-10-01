# README
# 1. Setting Up Your Local Environment

## a) Clone the Repositories
Make sure you have cloned both the Rails API repository to your local machine.

```bash
git clone https://github.com/anhnd012/shorten_url_server.git
```
## b) Install Dependencies for the Rails API
Navigate to the Rails API directory and install the required gems

```linux
cd shorten_url_server
bundle install
```
## c) Configure Database
Set up the database for your Rails API

```ruby
rails db:create
rails db:migrate
```
## d) Configure CORS in Rails
Make sure your CORS configuration in config/initializers/cors.rb is set up correctly

```ruby
# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000', 'https://shortenurlss.netlify.app'  # Include localhost for local development

    resource "*",
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
Note: Ensure http://localhost:3000 is included to allow requests from your React app running on this port

## e) Start the Rails Server
Start the Rails server to run your API locally
```ruby
rails s
```
By default, your Rails server will run on http://localhost:3000

# 2. Technology choices
- I've recently learned about Rails so I'm famliar with it. Moreover, Rails is known for its convention over configuration philosophy and rapid development capabilities.
- For the database, I chose PostgreSQL, which is the default database for Rails applications. I've deployed my application on Render, which requires PostgreSQL as the standard database, making it a fitting choice for my project

# 3. Completed feature
- Shorten long URLs
- Redirect short URLs to original long URLs
- Copy shortened URLs to clipboard

# 4. Known Issues and Limitations
- No analytics for tracking short URL usage

# 5. Future Improvements
- Add URL expiration feature
- Allow custom short codes
- Add analytics dashboard for URL usage statistics




