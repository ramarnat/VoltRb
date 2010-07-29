import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_FLOAT.RID: 0",
    singlePartition = true
)

public class SelectFloat extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_FLOAT" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

