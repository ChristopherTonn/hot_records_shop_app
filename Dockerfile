FROM ruby:2.3.5

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends build-essential libpq-dev && \
    gem install bundler -v '~>1.17'

WORKDIR /app
COPY Gemfile* ./
RUN bundle install --without development test
COPY . .
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
