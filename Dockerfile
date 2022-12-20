FROM ruby:3.1-slim

# RUN apt-get update && apt-get install -y --no-install-recommends \
# 	build-essential \
# 	libpq-dev \
# 	nodejs \
# 	yarn

RUN apt-get update && apt-get install -y --no-install-recommends \
	build-essential \
	libpq-dev 

WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Configure the main process to run when running the image
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
