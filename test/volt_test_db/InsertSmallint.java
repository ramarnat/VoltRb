import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_SMALLINT.RID: 0",
    singlePartition = true
)

public class InsertSmallint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_SMALLINT VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          short dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

