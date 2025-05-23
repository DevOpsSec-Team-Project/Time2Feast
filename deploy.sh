# Deployment script

# Load bashrc
source ~/.bashrc

# Properly load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Installing dependencies
bundle install

# Set environment to production
# export RAILS_ENV = production

# Run migrations on database
rails db:migrate

# Kill any process using port 80
sudo fuser -k 80/tcp

# Run server in background
nohup sudo -E /home/ubuntu/.rbenv/shims/bundle exec rails server --binding 0.0.0.0 --port 80 > log/deploy.log 2>&1 &