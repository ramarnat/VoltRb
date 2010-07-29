import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_INTEGER.RID: 0",
    singlePartition = true
)

public class InsertInteger extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_INTEGER VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          int dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

