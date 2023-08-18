# Use the official Ruby image as the base image
FROM ruby:3.1.3

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Install bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]