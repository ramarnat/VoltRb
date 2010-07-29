import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_TIMESTAMP.RID: 0",
    singlePartition = true
)

public class SelectTimestamp extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_TIMESTAMP" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

