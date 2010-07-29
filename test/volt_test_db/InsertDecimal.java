import org.voltdb.*;
import java.math.BigDecimal;

@ProcInfo(
    partitionInfo = "T_DECIMAL.RID: 0",
    singlePartition = true
)

public class InsertDecimal extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "INSERT INTO T_DECIMAL VALUES (?, ?);"
  );

  public VoltTable[] run( int rid,
                          BigDecimal dummy)
      throws VoltAbortException {
          voltQueueSQL( sql, rid, dummy);
          voltExecuteSQL();
          return null;
      }
}

