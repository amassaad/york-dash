# Base image
FROM alpine:latest


# Install PGsql dependencies and js engine
RUN apk update && apk --update add ruby ruby-irb ruby-json ruby-rake ruby-bigdecimal ruby-io-console libstdc++ tzdata postgresql-client nodejs



# Install gems
ADD Gemfile* /app/

RUN apk --update add --virtual build-dependencies build-base ruby-dev openssl-dev  git ruby-nokogiri ruby-mini_portile \
    postgresql-dev libc-dev linux-headers && \
    gem install bundler && \
    cd /app ; bundle install --without development test && \
    apk del build-dependencies && rm -rf /var/cache/apk/*


ADD . /app
RUN chown -R nobody:nogroup /app
USER nobody

ENV RAILS_ENV production
WORKDIR /app

EXPOSE 5001

# Default command
CMD ["bundle", "exec", dashing", "start", "-p", "5001"]
