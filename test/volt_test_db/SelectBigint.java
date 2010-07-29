import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_BIGINT.RID: 0",
    singlePartition = true
)

public class SelectBigint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_BIGINT" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

