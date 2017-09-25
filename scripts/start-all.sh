#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# first start zookeeper, kafka and schema registry
echo '<----- starting zookeeper --->'
${CONFLUENT_HOME}/bin/zookeeper-server-start ${CONFLUENT_HOME}/etc/kafka/zookeeper.properties &

echo '<----- starting kafka servers --->'
echo '<----- starting kafka server 0 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start ${DIR}/../configs/kafka-server-00.properties &
echo '<----- starting kafka servers 1 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start ${DIR}/../configs/kafka-server-01.properties &
echo '<----- starting kafka servers 2 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start ${DIR}/../configs/kafka-server-02.properties &
echo '<----- starting kafka server 3 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start ${DIR}/../configs/kafka-server-03.properties &
echo '<----- starting kafka server 4 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start ${DIR}/../configs/kafka-server-04.properties &


echo '<----- starting schema registry --->'
sleep 10 && ${CONFLUENT_HOME}/bin/schema-registry-start ${CONFLUENT_HOME}/etc/schema-registry/schema-registry.properties &

echo '<----- starting cassandra --->'
sleep 10 && cassandra &

echo '<----- starting kafka connect --->'
echo '<----- adding needed jars to the classpath --->'
for jar in ${DIR}/../libs/*.jar; do
    CLASSPATH=${CLASSPATH}:${jar}
done
export CLASSPATH

echo '<----- starting kafka connect worker in distributed mode --->'
sleep 10 && ${CONFLUENT_HOME}/bin/connect-distributed ${CONFLUENT_HOME}/etc/schema-registry/connect-avro-distributed.properties &

export KAFKA_CONNECT_REST=http://localhost:8083
