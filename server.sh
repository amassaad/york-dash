#!/bin/sh
ruby -v
which -a ruby
bundle -v
which bundle
cat /usr/local/bin/bundle
bundle exec dashing start -p 5001
