#!/bin/sh
set -e

# Run database migrations
bundle exec rails db:migrate

# Start Puma server
bundle exec puma -C config/puma.rb
