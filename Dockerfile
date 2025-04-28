FROM ruby:2.3.5

# ------------------------------------------------------------------
# 1) Point APT sources to the Debian archive
#    and turn off signature / timestamp checks (Jessie keys are expired)
# ------------------------------------------------------------------
RUN sed -i 's|deb.debian.org|archive.debian.org/debian-archive|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && printf "Acquire::AllowUnauthenticated \"true\";\nAcquire::AllowInsecureRepositories \"true\";\nAcquire::Check-Valid-Until \"0\";\n" \
      > /etc/apt/apt.conf.d/99disable-signature-check

# ------------------------------------------------------------------
# 2) Install system packages without failing on missing/expired GPG keys
# ------------------------------------------------------------------
RUN apt-get update  -o Acquire::AllowInsecureRepositories=true -o Acquire::Check-Valid-Until=false -qq \
 && apt-get install -y --allow-unauthenticated --no-install-recommends build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------------
# 3) Install Bundler compatible with Ruby 2.3
# ------------------------------------------------------------------
RUN gem install bundler -v '~>1.17'

# ------------------------------------------------------------------
# 4) Set up application
# ------------------------------------------------------------------
WORKDIR /app
COPY Gemfile* ./
RUN bundle install --without development test
COPY . .

# ------------------------------------------------------------------
# 5) Start Puma when the container launches
# ------------------------------------------------------------------
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]