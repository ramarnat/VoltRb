import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_SMALLINT.RID: 0",
    singlePartition = true
)

public class SelectSmallint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_SMALLINT" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

