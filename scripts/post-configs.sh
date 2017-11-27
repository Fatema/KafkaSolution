#!/usr/bin/env bash

#to add the configs of a jdbc connector
curl -X POST -H "Content-Type: application/json" --data '{"name": "finance-source-sqlite-v2", "config": {"connector.class":"io.confluent.connect.jdbc.JdbcSourceConnector","tasks.max":"1","connection.url":"jdbc:sqlite:/Users/FatemaK/Desktop/BigData_Project/connectors/finance.db","table.whitelist":"apple,ms,csco","mode":"incrementing","incrementing.column.name":"id","topic.prefix":"finance-sqlite-v2-"}}' http://localhost:8083/connectors
