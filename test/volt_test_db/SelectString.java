import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_STRING.RID: 0",
    singlePartition = true
)

public class SelectString extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_STRING" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

