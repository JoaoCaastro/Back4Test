# Start from the official Ruby image
FROM ruby:3.2.2

# Install Node.js and Yarn (needed for Rails asset compilation)
RUN apt-get update -qq && apt-get install -y build-essential autoconf bison zlib1g g++ libvips libncurses5-dev libffi-dev libgdbm-dev libssl-dev bash bash-completion libffi-dev nano tzdata nodejs npm yarn gnupg wget libyaml-dev sudo apt-transport-https ca-certificates gnupg2 curl postgresql postgresql-contrib

# Set the working directory
WORKDIR /aba-project-rails-api

# Add the Gemfile and Gemfile.lock to the image
COPY Gemfile /aba-project-rails-api/Gemfile
COPY Gemfile.lock /aba-project-rails-api/Gemfile.lock
RUN gem install bundler:2.2.26
RUN bundle install

# Expose the port that the Rails server will run on
EXPOSE 3000

# Define the command to start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
