import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_BIGINT.RID: 0",
    singlePartition = true
)

public class InsertBigint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_BIGINT VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          long dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

