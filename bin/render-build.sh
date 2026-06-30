#!/usr/bin/env bash
set -o errexit

export NODE_OPTIONS=--openssl-legacy-provider

bundle config set frozen false
bundle install
yarn install --ignore-engines
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed