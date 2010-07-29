import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_FLOAT.RID: 0",
    singlePartition = true
)

public class InsertFloat extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_FLOAT VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          double dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

