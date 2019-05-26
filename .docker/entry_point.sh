#!/bin/bash

bundle check || bundle install

bin/rake db:create db:migrate

bin/rails s -b 0.0.0.0 -p 3000

cat;