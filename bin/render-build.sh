#!/usr/bin/env bash
set -o errexit

export RUBYOPT=-rlogger
export NODE_OPTIONS=--openssl-legacy-provider

bundle install
yarn install --ignore-engines
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed