#!/usr/bin/env bash

# first start zookeeper, kafka and schema registry
echo '<----- starting zookeeper --->'
${CONFLUENT_HOME}/bin/zookeeper-server-start ${CONFLUENT_HOME}/etc/kafka/zookeeper.properties &

echo '<----- starting kafka servers --->'
echo '<----- starting kafka server 0 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start configs/kafka-server-00.properties &
echo '<----- starting kafka servers 1 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start configs/kafka-server-01.properties &
echo '<----- starting kafka servers 2 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start configs/kafka-server-02.properties &
echo '<----- starting kafka server 3 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start configs/kafka-server-03.properties &
echo '<----- starting kafka server 4 --->'
sleep 10 && ${CONFLUENT_HOME}/bin/kafka-server-start configs/kafka-server-04.properties &


echo '<----- starting schema registry --->'
sleep 10 && ${CONFLUENT_HOME}/bin/schema-registry-start ${CONFLUENT_HOME}/etc/schema-registry/schema-registry.properties &
