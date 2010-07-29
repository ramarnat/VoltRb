import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_TINYINT.RID: 0",
    singlePartition = true
)

public class SelectTinyint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_TINYINT" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

