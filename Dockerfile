FROM ruby:2.3.5

# ----- Paketquellen aufs Archiv umbiegen + Signatur-Checks deaktivieren -----
RUN sed -i 's|deb.debian.org|archive.debian.org/debian-archive|g' /etc/apt/sources.list \
 && sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
 && printf "Acquire::Check-Valid-Until \"0\";\nAcquire::AllowInsecureRepositories \"1\";\n" \
      > /etc/apt/apt.conf.d/99disable-valid-until

# ----- System-Abhängigkeiten installieren (ohne GPG-Blocker) ----------------
RUN apt-get -o Acquire::AllowInsecureRepositories=true -o Acquire::Check-Valid-Until=false update -qq \
 && apt-get install -y --no-install-recommends build-essential libpq-dev \
 && rm -rf /var/lib/apt/lists/*

# ----- Bundler & App ---------------------------------------------------------
RUN gem install bundler -v '~>1.17'

WORKDIR /app
COPY Gemfile* ./
RUN bundle install --without development test
COPY . .
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
