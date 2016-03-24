FROM ruby:2.3-onbuild

EXPOSE 5001

# Default command
CMD ["/usr/src/app/server"]
