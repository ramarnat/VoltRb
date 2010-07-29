import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_TIMESTAMP.RID: 0",
    singlePartition = true
)

public class InsertTimestamp extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_TIMESTAMP VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          long dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

