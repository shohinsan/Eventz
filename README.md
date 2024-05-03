# Setting Up Your Rails Project

Follow these steps to set up your Rails project for events management:

1. **Installation**: Refer to [this guide](https://gorails.com/setup/macos/14-sonoma) to set up Ruby on Rails on your macOS.

2. **Create a New Rails App**:
   ```bash
   rails new eventz
   ```

3. Define API Routes: Add your API routes to config/routes.rb.
4. Generate Controller:

`rails g controller events`

5. Create HTML Page:
* Navigate to app/controllers/events_controller.rb.
* Create an HTML page in app/views/events and name it index.html.erb.

6. Generate Model:

`rails g model event name:string location:string price:decimal`

Ensure you carefully create your model as it generates migrations too.

7. Run Migrations:
`rails db:migrate`

Verify migration status with:
`rails db:migrate:status`

8. Seed Database:
Use Rails console to seed the database with events:

```ruby
rails c
e = Event.new(name: "BugSmash", location: "Denver, CO", price: 0.0)
e.save

# OR

e = Event.create(name: "Hackathon", location: "Austin, TX", price: 15.00)

# OR

e = Event.create(name: "Kata Camp", location: "Dallas, TX", price: 75.00)
```

Verify:

```ruby
Event.count
Event.all
e = Event.find(3)
e.price.to_s
```

9. Add Additional Fields:
Create a migration to add fields to the events table:
`rails g migration AddFieldsToEvents starts_at:datetime description:text`

Run the migration:
`rails db:migrate`

10. Gems:
Add gems in the Gemfile and install them:

`bundle install`

11. Assets:
Images and stylesheets can be found in app/assets/images and app/assets/stylesheets respectively.

12. Custom Database Seeds:
Paste custom seed data in the db folder and reset the database:
`rails db:reset`

13. Debug Routes:
Check available routes using:
`localhost:3000/rails/info/routes`

14. Associations:
Ensure associations are set up properly, e.g., for liked_events use source: event for association.

15. Categories:
Create categories via Rails console:

```ruby
rails c
names = ["Free Food", "Rails", "Ruby", "Things That Fly"]
names.each { |name| Category.create(name: name) }
```

# Deployment

When your project is ready for deployment:

1. Update Gemfile:
Change the database gem from sqlite3 to pg for production:

```ruby
group :development, :test do
    gem "sqlite3", "~> 1.4"
end

group :production do
    gem "pg"
end
```

2. Run Commands:
Execute the following commands:

```bash
bundle config set --local without 'production'
bundle install
bundle lock --add-platform x86-64-linux
```