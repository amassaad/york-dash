#!/bin/sh
ruby -v
which ruby
bundle -v
which bundle
cat /usr/local/bin/bundle
bundle exec dashing start -p 5001
