import org.voltdb.*;

@ProcInfo(
    partitionInfo = "T_STRING.RID: 0",
    singlePartition = true
)

public class InsertString extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_STRING VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          String dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

