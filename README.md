# Shreddit!

## What is it?
A rails 5 clone of reddit.com but with a heavy metal edge. Subshreddits can be about anything metal. A user can create subshreddits, create posts, add comments to posts, and message other users.

see it live here: https://shreddit.howlcode.com

## Why did you make it?
Reddit is an elaborate site. It's one of the most heavily trafficked sites on the web and has what I imagine to be a relatively complex database-model.
My version, while not as complex for sure, was created to explore the fundamentals of a social-networking web app.

## How can I use it?
-Clone the repo, cd into the directory and run bundle install.
-You'll need to set up Postgresql on your machine, I recommend following this tutorial(linux): https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04
-Update config/database.yml with your user and password for postgres
-run commands 'rails db:create' and 'rails db:migrate'

\m/(>.<)\m/