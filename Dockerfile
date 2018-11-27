FROM ruby:2.5.1

RUN apt-get update && apt-get install -y build-essential nodejs

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler && bundle install --jobs 20 --retry 5

ADD . ./

RUN bundle exec rake db:setup

EXPOSE 3000
CMD ["sh", "docker-cmd.sh"]