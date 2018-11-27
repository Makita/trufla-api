FROM ruby:2.5.1

RUN apt-get update
RUN apt-get install -y build-essential nodejs

ADD Gemfile* /tmp
WORKDIR /tmp
RUN gem install bundler && bundle install --jobs 20 --retry 5

RUN mkdir /app
WORKDIR /app
ADD . ./

EXPOSE 3000

CMD ["sh", "docker-cmd.sh"]