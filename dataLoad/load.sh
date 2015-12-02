#!/bin/sh

cat accidentology5.csv | ~/dev/logstash/logstash-2.0.0/bin/logstash -w 1 -f paris.conf