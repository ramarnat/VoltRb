import org.voltdb.*;

public class SelectIntegerMulti extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_INTEGER" +
      " ORDER BY RID;"
  );

  public VoltTable[] run() 
      throws VoltAbortException {
          voltQueueSQL( sql );
          return voltExecuteSQL();
      }
}

