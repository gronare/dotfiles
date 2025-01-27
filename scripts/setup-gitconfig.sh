#!/bin/bash

read -p "Enter your Git name: " git_name
read -p "Enter your Git email: " git_email

# Create the config directory if it doesn't exist
mkdir -p ~/.config/git

# Write the configuration to the new location
cat > ~/.config/git/gitconfig <<EOF
[user]
    name = $git_name
    email = $git_email
EOF

echo "Private Git configuration saved to ~/.config/git/gitconfig"
