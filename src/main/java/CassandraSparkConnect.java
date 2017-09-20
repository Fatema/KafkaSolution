import com.datastax.spark.connector.japi.CassandraJavaUtil;
import org.apache.commons.net.ntp.TimeStamp;
import org.apache.spark.SparkConf;
import org.apache.spark.api.java.JavaRDD;
import org.apache.spark.api.java.JavaSparkContext;

import static com.datastax.spark.connector.japi.CassandraJavaUtil.mapRowTo;

public class CassandraSparkConnect {
    public static void main(String[] args) {
        SparkConf conf = new SparkConf(true).set("spark.cassandra.connection.host", "localhost");
        JavaSparkContext sc = new JavaSparkContext(conf);
        JavaRDD<Finance> cassandraRdd = CassandraJavaUtil.javaFunctions(sc).cassandraTable("finance", "highdata",
                mapRowTo(Finance.class));


    }

    private class Finance {
        public int id;
        public String company;
        public TimeStamp date;
        public float high;
        public float low;
        public float close;
        public float open;
        public float adjclose;
        public float volume;
    }
}