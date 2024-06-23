#!/bin/bash

# Install gems without the --deployment option
bundle install --path vendor/bundle

# Continue with the default build process
bundle exec rails assets:precompile