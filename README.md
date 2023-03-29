## REQUIREMENTS
---

- Ruby 3.0.2
- Ruby on Rails 6.1
- PostgreSQL 13.3
- Use the gems **`dry-initializer`** and **`dry-monads`** for service patterns.
- Use the gems **`rswag-ui`** and **`rswag-api`** to document APIs.
- Use **`gem sidekiq`** for background job processing.
- Endpoints should use serializers for JSON rendering. Use **`gem 'jsonapi-serializer'`**.
- Use **RSPEC** for automated testing.

## Configuration
---

1. Clone project
2. Create database
3. Run migrations
4. Install gems
5. Run seed to populate database
6. Have fun :)


# Runable command
- run test `rspec`
- setup database & cron jobs `rails db:setup`
- start server `rails server`
- access console `rails console`

# TODO
---
- Use `gem devise` for authentication.
- Add admin panel with `gem administrate`.
- Add mailer specs
- Dockerize & CI/CD for deploying
