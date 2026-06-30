#!/usr/bin/env bash
set -o errexit

bundle install
yarn install --ignore-engines
export NODE_OPTIONS=--openssl-legacy-provider
bundle exec rails assets:precompile
bundle exec rails db:migrate
bundle exec rails db:seed