import org.voltdb.*;
import org.voltdb.client.*;

public class Inserter {

    public static void main(String[] args) throws Exception {
        int i;

        /*
         * Instantiate a client and connect to the database.
         */
        org.voltdb.client.Client myApp;
        myApp = ClientFactory.createClient();
        myApp.createConnection("localhost", "scott", "tiger");

        /*
         * Load the database.
         */
        for(i=0; i < Integer.parseInt(args[1]); i++) {
          myApp.callProcedure(args[0], i, i);
        }
    }
}
