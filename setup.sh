#!/bin/bash

dropdb hogwarts
sleep 1
createdb hogwarts
psql -d hogwarts -f ./db/hogwarts.sql

ruby ./db/seed.rb
