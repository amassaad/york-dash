FROM ruby:2.3-onbuild

EXPOSE 5001

# Default command
CMD ["bundle", "exec", "dashing", "start", "-p", "5001"]
