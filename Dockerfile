FROM ruby:2.6-alpine

MAINTAINER Mohamad Sakka laeiq

LABEL Description="This part is intended for test app of Mailer"

RUN \
  apk --update --upgrade add build-base tzdata postgresql-dev nodejs qt5-qtwebkit-dev npm ncurses

ENV QMAKE /usr/lib/qt5/bin/qmake
RUN npm install --global yarn
RUN npm install --global mjml

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 20 --retry 5
COPY . ./
RUN yarn install
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-d"]