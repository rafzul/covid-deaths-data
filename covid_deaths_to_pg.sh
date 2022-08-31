#!/usr/bin/env bash

source /home/rafzul/projects/covid-death-data/.env

#-O ensuring consistent output name (not numbered copies)
wget -O /home/rafzul/projects/covid-death-data/tmp/deaths.csv https://raw.githubusercontent.com/nytimes/covid-19-data/master/excess-deaths/deaths.csv

#psql using docker

psql -h 127.0.0.1 -U $PGUSER -c "\COPY covid_deaths from '/home/rafzul/projects/covid-death-data/tmp/deaths.csv' WITH (format csv, header true)" 