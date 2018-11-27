FROM ruby:2.5.1

RUN apt-get update && apt-get install -y build-essential nodejs

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV SECRET_KEY_BASE 587b0c4e6e20e99663b198fd9aa1e786fd88105d20ed873d959ed47d4753a9f388991c90f31305c285c19443166d43861b6e29f2984be8aff812773605e42a3d

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler
RUN bundle config --global frozen 1
RUN bundle install --without development test --jobs 20 --retry 5

ADD . ./
RUN bundle exec rake db:setup

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]