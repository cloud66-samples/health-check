# Generated by Cloud66 Starter
FROM ruby:2.5.3

RUN sed -i '/jessie-updates/d' /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler
RUN bundle install

ADD . $APP_HOME

RUN apt-get update -qq && apt-get install -y apt-transport-https ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y yarn

RUN yarn install --check-files
RUN bundle exec rails assets:precompile
