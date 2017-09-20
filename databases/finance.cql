create keyspace finance WITH REPLICATION = {'class' : 'SimpleStrategy', 'replication_factor' : 3};

use finance;

create table historicaldata (company varchar, date timestamp, open float, high float, low float, close float, adjclose float, volume float, primary key (date,company)) with clustering order by (company asc);