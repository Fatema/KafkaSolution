#!/usr/bin/env bash

#start cassandra
echo '<----- running cassandra --->'
sleep 10 && cassandra &

#create a keyspace and a table in cassandara
echo '<----- running cassandra script--->'
cqlsh -u 'cassandra' -p 'cassandra' -f cql-scripts/HistoricalData.cql

# start kafka connect with all the plugins from datamountaineer
echo '<----- starting kafka connector --->'
sleep 10 && ${STREAM_REACTOR_HOME}/bin/start-connect.sh &

# export the link of kafka rest
echo '<----- export kafka connect rest --->'
export KAFKA_CONNECT_REST=http://localhost:8083

# add the sink or source to the connectors list / can use a POST request to http://localhost:8083/connectors for this
echo '<----- adding cassandra-kafka sink --->'
${STREAM_REACTOR_HOME}/bin/cli.sh create cassandra-sink-finance < configs/cassandra-sink.properties &