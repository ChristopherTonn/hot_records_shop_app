
    FROM ghcr.io/railsdock/ruby:2.3-bullseye
    # Everything you need (build-essentials, libpq-dev, node) is pre-installed.
    
    WORKDIR /app
    COPY Gemfile* ./
    RUN gem install bundler -v '~>1.17' \
     && bundle install --without development test
    
    COPY . .
    CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
    