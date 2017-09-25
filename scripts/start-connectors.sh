#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# add the sink or source to the connectors list / can use a POST request to http://localhost:8083/connectors for this
echo '<----- adding sqlite-kafka source --->'
java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-source-sqlite < ${DIR}/../configs/finance-source-sqlite.properties
sleep 40 & java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-source-sqlite-apple-selected < ${DIR}/../configs/finance-source-sqlite-apple-selected.properties

echo '<----- adding cassandra-kafka sink --->'
sleep 40 & java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-sink-cassandra < ${DIR}/../configs/finance-sink-cassandra.properties
sleep 40 & java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-sink-cassandra-ms < ${DIR}/../configs/finance-sink-cassandra-ms.properties
sleep 40 & java -jar ${DIR}/../libs/kafka-connect-cli-1.0-all.jar create finance-sink-cassandra-apple-selected < ${DIR}/../configs/finance-sink-cassandra-apple-selected.properties
