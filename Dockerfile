FROM ruby:2.3-alpine
EXPOSE 5001


ENV BUILD_PACKAGES bash curl-dev ruby-dev build-base git libxml2-dev libxslt-dev
ENV RUBY_PACKAGES ruby ruby-io-console ruby-bundler

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    apk add $RUBY_PACKAGES && \
    rm -rf /var/cache/apk/*

RUN mkdir /usr/app
WORKDIR /usr/app

COPY Gemfile /usr/app/
COPY Gemfile.lock /usr/app/
RUN bundle config build.nokogiri --use-system-libraries && \
  bundle install

COPY . /usr/app

# Default command
CMD ["bash", "/usr/app/server.sh"]
