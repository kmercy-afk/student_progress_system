#!/usr/bin/env bash
set -o errexit

export RUBYOPT=-rlogger
export NODE_OPTIONS=--openssl-legacy-provider

gem install bundler -v 2.4.22
bundle update --bundler
bundle install
yarn install --ignore-engines
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed