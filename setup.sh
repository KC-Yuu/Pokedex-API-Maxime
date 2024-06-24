#!/bin/bash

# Set permissions
chmod -R 755 .

# Clean cache
rm -rf tmp/cache

# Install dependencies
bundle install

# Compile CSS with Tailwind
rails tailwindcss:build

echo "Setup terminé. Vous pouvez maintenant démarrer le serveur avec 'rails server'."