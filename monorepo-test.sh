#!/bin/bash
set -e  # stop if anything fails

echo "🚀 Running monorepo-test.sh Script..."

echo "➡️ Moving to ~/Code/mozrin..."
cd ~/Code/mozrin

echo "🛑 Stopping and removing Docker containers and volumes for mozrin..."
docker compose down -v

echo "➡️ Moving to ~/Code..."
cd ~/Code

echo "🗑 Removing local mozrin folder..."
sudo rm -rf ./mozrin

echo "🗑 Deleting GitHub repo moztopia/mozrin..."
gh repo delete moztopia/mozrin --yes

echo "📦 Creating new private repo moztopia/mozrin from template moztopia/monorepo..."
gh repo create moztopia/mozrin --template moztopia/monorepo --private

echo "📥 Cloning new repo into ~/Code/mozrin..."
gh repo clone moztopia/mozrin mozrin

echo "➡️ Entering mozrin folder..."
cd mozrin

echo "⚙️ Running make setup (showing full output)..."
make setup

echo "✅ All steps completed successfully."
