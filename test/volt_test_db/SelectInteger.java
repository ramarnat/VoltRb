import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_INTEGER.RID: 0",
    singlePartition = true
)

public class SelectInteger extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_INTEGER" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

