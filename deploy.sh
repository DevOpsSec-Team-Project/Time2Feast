# Writing correct version to .ruby-version file
echo "3.2.2" > .ruby-version
# Setting version to 3.2.2
rbenv rehash
# Installing dependencies
bundle install
# Set environment to production
# export RAILS_ENV = production
# Run migrations on database
# rails db:migrate
# Run server (Port 80 for now until production ready)
sudo -E /home/ubuntu/.rbenv/shims/bundle exec rails server --binding 0.0.0.0 --port 80