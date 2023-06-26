# Use the official Ruby image as the base image
FROM ruby:3.1.3

# Set the working directory inside the container
WORKDIR /app

# Install dependencies
RUN apt-get update  && apt-get install -y build-essential nodejs

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install the bundler gem
RUN gem install bundler

# Install the project dependencies
RUN bundle install

# Copy the application code into the container
COPY . .


# Expose the port on which the app