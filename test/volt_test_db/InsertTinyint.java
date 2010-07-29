import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_TINYINT.RID: 0",
    singlePartition = true
)

public class InsertTinyint extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_TINYINT VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          byte dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

