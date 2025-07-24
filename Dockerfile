FROM ruby:3.2.2

# Rails dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client libpq-dev yarn

# Set working directory
WORKDIR /app

# Cache gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose port
EXPOSE 3000

# Start server
CMD ["rails", "server", "-b", "0.0.0.0"]
