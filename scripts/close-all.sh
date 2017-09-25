#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '<----- closing kafka servers --->'
${CONFLUENT_HOME}/bin/kafka-server-stop ${DIR}/../configs/kafka-server-00.properties &
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-stop ${DIR}/../configs/kafka-server-01.properties &
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-stop ${DIR}/../configs/kafka-server-02.properties &
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-stop ${DIR}/../configs/kafka-server-03.properties &
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-stop ${DIR}/../configs/kafka-server-04.properties &

echo '<----- closing schema registry --->'
sleep 10 && ${CONFLUENT_HOME}/bin/schema-registry-stop ${CONFLUENT_HOME}/etc/schema-registry/schema-registry.properties &

echo '<----- closing zookeeper --->'
sleep 60 && ${CONFLUENT_HOME}/bin/zookeeper-server-stop ${CONFLUENT_HOME}/etc/kafka/zookeeper.properties &

echo '<----- closing cassandra --->'
sleep 10 && pgrep -u FatemaK -f cassandra | xargs kill -9 &

