#!/bin/bash

# Set permissions
chmod -R 755 .

# Clean cache
rm -rf tmp/cache

# Install dependencies
bundle install

echo "Setup complete. You can now start the server with 'rails server'."