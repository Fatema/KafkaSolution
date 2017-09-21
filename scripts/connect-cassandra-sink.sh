#!/usr/bin/env bash

#create a keyspace and a table in cassandara
echo '<----- --->'
cqlsh -u 'cassandra' -p 'cassandra' -f cql-scripts/HistoricalData.cql

# add the sink or source to the connectors list / can use a POST request to http://localhost:8083/connectors for this
echo '<----- adding cassandra-kafka sink --->'
${STREAM_REACTOR_HOME}/bin/cli.sh create cassandra-sink-finance < configs/cassandra-sink.properties &