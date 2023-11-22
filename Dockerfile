# Use the official Ruby image as a base
FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Set the working directory in the container
WORKDIR /pando2-measure

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /pando2-measure/Gemfile
COPY Gemfile.lock /pando2-measure/Gemfile.lock

# Install the gems
RUN bundle install

# Copy the main application
COPY . /pando2-measure

# Add a script to be executed every time the container starts
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

# Expose the port the app runs on
EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
