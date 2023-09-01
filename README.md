# README

## Requirements

Make sure you have the following installed on your system:

- Ruby version 3.2.2
- Bundler

## Installation

1. Clone the repository:

```bash
git clone https://..
```

2. Move into the project directory:

```bash
cd simple-api-wrapper
```

3. Install dependencies using Bundler:

```bash
bundle install
```

4. Create .env and .database.yml file from examples and update the values:

```bash
cp .env.example .env
```

```bash
cp config/database.example.yml config/database.yml
```

5. Setup Docker services (PostgreSQL and Redis):

```bash
docker-compose up
```

Ensure that the ports configured in `.env` do not conflict with your running services.

6. Create the database:

```bash
bundle exec rails db:create
```

7. Run database migrations:

```bash
bundle exec rails db:migrate
```

8. (Optional) Run seed data to create some sample data:

```bash
bundle exec rails db:seed
```

## Usage

To start the app, run the following command:

```bash
bundle exec rails server
```

Once the server is running, open your web browser and go to <http://localhost:3000> to access the app.

## Testing

To run the test suite, use the following command:

```bash
bundle exec rspec
```
