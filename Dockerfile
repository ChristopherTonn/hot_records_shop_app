# Alpine image that still hosts Ruby 2.3 packages
FROM ruby:2.3-alpine3.8 

# ---- system libraries -------------------------------------------------
RUN apk add --no-cache build-base postgresql-dev nodejs yarn tzdata

# ---- Ruby / Bundler ---------------------------------------------------
RUN gem install bundler -v '~>1.17'

# ---- app setup --------------------------------------------------------
WORKDIR /app
COPY Gemfile* ./
RUN bundle install --without development test
COPY . .

# ---- add entrypoint ---------------------------------------------------
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# ---- start server -----------------------------------------------------
CMD ["/entrypoint.sh"]
