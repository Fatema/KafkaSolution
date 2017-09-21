#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#create tables in a sqlite database and import data into it
echo '<----- creating tables and importing data in sqlite --->'
sqlite3 finance.db < ${DIR}/../database-scripts/finance.sql

#create a keyspace and a table in cassandara
echo '<----- creating keyspace and a table in cassandra --->'
cqlsh -u 'cassandra' -p 'cassandra' -f cql-scripts/HistoricalData.cql

# add the sink or source to the connectors list / can use a POST request to http://localhost:8083/connectors for this
echo '<----- adding sqlite-kafka source --->'
java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-source-sqlite < ${DIR}/../configs/finance-source-sqlite.properties &

echo '<----- adding cassandra-kafka sink --->'
sleep 20 & java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-sink-cassandra < ${DIR}/../configs/finance-sink-cassandra.properties &