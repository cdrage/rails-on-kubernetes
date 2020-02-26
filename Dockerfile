FROM ruby:2.7.0

RUN apt-get update
RUN apt-get install nodejs netcat-openbsd postgresql-client -y
#RUN apk --update add nodejs netcat-openbsd postgresql-dev
#RUN apk --update add --virtual build-dependencies make g++

RUN mkdir /myapp

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN bundle install

ADD . /myapp

COPY docker-entrypoint.sh /usr/local/bin

ENTRYPOINT ["docker-entrypoint.sh"]
