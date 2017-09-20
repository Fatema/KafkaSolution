#!/usr/bin/env bash

scripts/start-confluent.sh &
sleep 10 && scripts/connect-jdbc-source.sh
sleep 10 && scripts/connect-cassandra-sink.sh
