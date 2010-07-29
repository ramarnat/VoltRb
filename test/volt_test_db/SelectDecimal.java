import org.voltdb.*;
import java.math.BigDecimal;

@ProcInfo(
    partitionInfo = "T_DECIMAL.RID: 0",
    singlePartition = true
)

public class SelectDecimal extends VoltProcedure {

  public final SQLStmt sql = new SQLStmt(
      "SELECT RID, DUMMY FROM T_DECIMAL" +
      " WHERE RID = ?;"
  );

  public VoltTable[] run( int rid) 
      throws VoltAbortException {
          voltQueueSQL( sql, rid);
          return voltExecuteSQL();
      }
}

