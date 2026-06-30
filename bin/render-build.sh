#!/usr/bin/env bash
set -o errexit

export RUBYOPT=-rlogger
export NODE_OPTIONS=--openssl-legacy-provider

gem install bundler -v 2.4.22
bundle _2.4.22_ install
yarn install --ignore-engines
bundle _2.4.22_ exec rails assets:precompile
bundle _2.4.22_ exec rails db:migrate
bundle _2.4.22_ exec rails db:seed