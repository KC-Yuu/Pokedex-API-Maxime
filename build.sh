#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Configure Bundler to use the vendor/bundle path
bundle config set path 'vendor/bundle'

# Install gems without the --deployment option
bundle install

# Precompile assets
bundle exec rails assets:precompile