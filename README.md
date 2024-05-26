# SammyStore

SammyStore is an e-commerce application built with Ruby on Rails. This application allows users to manage shopping carts, items, and place orders. The application is dockerized to facilitate setup and deployment.

## Features

- Item management (products)
- Shopping cart management
- Creation and updating of cart items
- Integration with PostgreSQL
- Dockerized for easy deployment

## Requirements

- Docker
- Docker Compose
- Ruby 3.3.1
- Rails 6.1.7.7

### Key Gems Used

- `pg` (~> 1.1): PostgreSQL adapter for Active Record.
- `puma` (~> 5.0): A Ruby web server built for concurrency.
- `bootsnap` (>= 1.4.4): Reduces boot times through caching.
- `rswag-api`, `rswag-specs`, `rswag-ui`: Tools for generating and presenting Swagger documentation.
- `factory_bot_rails`: A fixtures replacement with a straightforward definition syntax.
- `pry-byebug`: An integration of Pry and Byebug for debugging.
- `rspec-rails` (~> 5.0): RSpec testing framework for Rails.
- `listen` (~> 3.3): A library to listen to file modifications.
- `annotate`: Adds comments summarizing the current schema to the top of each of your models and fixtures.
- `rubocop`: A Ruby static code analyzer and formatter.
- `spring`: Preloads your Rails application to speed up development tasks.

## Setup

### Clone the Repository

bash:
git clone https://github.com/mazc1995/SammyStore.git
cd sammystore

### Configure Environment Variables
Create a .env file in the root of the project and define the necessary environment variables. Here's an example:

``` DATABASE_URL=postgres://sammystore:password@db:5432/sammystore_development ```

``` RAILS_ENV=development ```

### Build and Run the Containers
``` docker-compose build ```

``` docker-compose up ```

### Set Up the Database
Run migrations and seeds to set up the database:

``` docker-compose run web bundle exec rails db:create db:migrate db:seed ```

### Usage
Access the application in your browser at http://localhost:3000.

### Access Swagger UI
You can access the Swagger UI to view the API documentation at http://localhost:3000/api-docs.

### Endpoints
#### Items
- GET /items - List all items
- POST /items - Create a new item
- GET /items/:id - Get a specific item
- PUT /items/:id - Update an item
- DELETE /items/:id - Delete an item

#### Carts
- GET /carts/:id - Get a specific cart

#### Cart Items

- POST /cart_items - Add an item to the cart
- PUT /cart_items/:id - Update a cart item
- DELETE /cart_items/:id - Remove a cart item

### Tests
To run the tests, use the following command:

``` docker-compose run web bundle exec rspec ```
# SammyStore

SammyStore is an e-commerce application built with Ruby on Rails. This application allows users to manage shopping carts, items, and place orders. The application is dockerized to facilitate setup and deployment.

## Features

- Item management (products)
- Shopping cart management
- Creation and updating of cart items
- Integration with PostgreSQL
- Dockerized for easy deployment

## Requirements

- Docker
- Docker Compose
- Ruby 3.3.1
- Rails 6.1.7.7

### Key Gems Used

- `pg` (~> 1.1): PostgreSQL adapter for Active Record.
- `puma` (~> 5.0): A Ruby web server built for concurrency.
- `bootsnap` (>= 1.4.4): Reduces boot times through caching.
- `rswag-api`, `rswag-specs`, `rswag-ui`: Tools for generating and presenting Swagger documentation.
- `factory_bot_rails`: A fixtures replacement with a straightforward definition syntax.
- `pry-byebug`: An integration of Pry and Byebug for debugging.
- `rspec-rails` (~> 5.0): RSpec testing framework for Rails.
- `listen` (~> 3.3): A library to listen to file modifications.
- `annotate`: Adds comments summarizing the current schema to the top of each of your models and fixtures.
- `rubocop`: A Ruby static code analyzer and formatter.
- `spring`: Preloads your Rails application to speed up development tasks.

## Setup

### Clone the Repository

bash:
git clone https://github.com/mazc1995/SammyStore.git
cd sammystore

### Configure Environment Variables
Create a .env file in the root of the project and define the necessary environment variables. Here's an example:

``` DATABASE_URL=postgres://sammystore:password@db:5432/sammystore_development ```

``` RAILS_ENV=development ```

### Build and Run the Containers
``` docker-compose build ```

``` docker-compose up ```

### Set Up the Database
Run migrations and seeds to set up the database:

``` docker-compose run web bundle exec rails db:create db:migrate db:seed ```

### Usage
Access the application in your browser at http://localhost:3000.

### Access Swagger UI
You can access the Swagger UI to view the API documentation at http://localhost:3000/api-docs.

### Endpoints
#### Items
- GET /items - List all items
- POST /items - Create a new item
- GET /items/:id - Get a specific item
- PUT /items/:id - Update an item
- DELETE /items/:id - Delete an item

#### Carts
- GET /carts/:id - Get a specific cart

#### Cart Items

- POST /cart_items - Add an item to the cart
- PUT /cart_items/:id - Update a cart item
- DELETE /cart_items/:id - Remove a cart item

### Tests
To run the tests, use the following command:

``` docker-compose run web bundle exec rspec ```

# SammyStore

SammyStore is an e-commerce application built with Ruby on Rails. This application allows users to manage shopping carts, items, and place orders. The application is dockerized to facilitate setup and deployment.

## Features

- Item management (products)
- Shopping cart management
- Creation and updating of cart items
- Integration with PostgreSQL
- Dockerized for easy deployment

## Requirements

- Docker
- Docker Compose
- Ruby 3.3.1
- Rails 6.1.7.7

### Key Gems Used

- `pg` (~> 1.1): PostgreSQL adapter for Active Record.
- `puma` (~> 5.0): A Ruby web server built for concurrency.
- `bootsnap` (>= 1.4.4): Reduces boot times through caching.
- `rswag-api`, `rswag-specs`, `rswag-ui`: Tools for generating and presenting Swagger documentation.
- `factory_bot_rails`: A fixtures replacement with a straightforward definition syntax.
- `pry-byebug`: An integration of Pry and Byebug for debugging.
- `rspec-rails` (~> 5.0): RSpec testing framework for Rails.
- `listen` (~> 3.3): A library to listen to file modifications.
- `annotate`: Adds comments summarizing the current schema to the top of each of your models and fixtures.
- `rubocop`: A Ruby static code analyzer and formatter.
- `spring`: Preloads your Rails application to speed up development tasks.

## Setup

### Clone the Repository

bash:
git clone https://github.com/mazc1995/SammyStore.git
cd sammystore

### Configure Environment Variables
Create a .env file in the root of the project and define the necessary environment variables. Here's an example:

``` DATABASE_URL=postgres://sammystore:password@db:5432/sammystore_development ```

``` RAILS_ENV=development ```

### Build and Run the Containers
``` docker-compose build ```

``` docker-compose up ```

### Set Up the Database
Run migrations and seeds to set up the database:

``` docker-compose run web bundle exec rails db:create db:migrate db:seed ```

### Usage
Access the application in your browser at http://localhost:3000.

### Access Swagger UI
You can access the Swagger UI to view the API documentation at http://localhost:3000/api-docs.

### Endpoints
#### Items
- GET /items - List all items
- POST /items - Create a new item
- GET /items/:id - Get a specific item
- PUT /items/:id - Update an item
- DELETE /items/:id - Delete an item

#### Carts
- GET /carts/:id - Get a specific cart

#### Cart Items

- POST /cart_items - Add an item to the cart
- PUT /cart_items/:id - Update a cart item
- DELETE /cart_items/:id - Remove a cart item

### Tests
To run the tests, use the following command:

``` docker-compose run web bundle exec rspec ```
