#!/usr/bin/env bash

echo '<----- starting JDBC-kafka connector --->'
${CONFLUENT_HOME}/bin/connect-distributed ${CONFLUENT_HOME}/etc/schema-registry/connect-avro-distributed.properties
configs/mysql-source.properties &

curl -X POST -H "Content-Type: application/json" --data '{"name": "mysql-source-finance", "config": {"connector
.class":"io.confluent.connect.jdbc.JdbcSourceConnector", "tasks.max":"1", "connection.url":"jdbc:mysql://mysql.dur.ac
.uk/Immgw12_FinanceData?user=mmgw12&password=french28", "topic.prefix":"mysql-" ,"mode":"timestamp",
"timestamp.column.name":"Date"}}' http://localhost:8083/connectors

${CONFLUENT_HOME}/bin/connect-standalone ${CONFLUENT_HOME}/etc/schema-registry/connect-avro-standalone.properties
