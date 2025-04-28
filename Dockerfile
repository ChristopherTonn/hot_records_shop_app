FROM ruby:2.3.5

RUN sed -i 's|deb.debian.org|archive.debian.org/debian-archive|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && printf "Acquire::Check-Valid-Until \"0\";\nAcquire::Check-Date \"0\";\n" > /etc/apt/apt.conf.d/99no-check-valid-until

RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

RUN gem install bundler -v '~>1.17'

WORKDIR /app
COPY Gemfile* ./
RUN bundle install --without development test

COPY . .
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
