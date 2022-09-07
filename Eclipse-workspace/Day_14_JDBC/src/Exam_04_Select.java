import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Exam_04_Select {
	public static void main(String[] args) throws Exception{

		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "kh";
		String dbPW = "kh";
		Connection con = DriverManager.getConnection(dbURL,dbID,dbPW);
		
		Statement stat = con.createStatement();
		
		String sql = "select * from cafe_menu order by 1";
		ResultSet rs =stat.executeQuery(sql);

		while(rs.next()) {
		int pid = rs.getInt("pid");
		String pname = rs.getString("pname");
		int pprice = rs.getInt("pprice");
		System.out.println(pid +" :"+pname+":"+pprice);
		}
		con.close();
		
	}
}
