import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CafeMenuDAO {
	
	public int insert(String pname, int pprice, String iced) throws Exception{
		
		String URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String ID = "kh";
		String PW = "kh";
		
		Connection con = DriverManager.getConnection(URL,ID,PW);
		
		String sql = 
				"insert into cafe_menu values(cafe_menu_seq.nextval,?,?,?)";
		
		PreparedStatement pstat =con.prepareStatement(sql);
		pstat.setString(1, pname);
		pstat.setInt(2, pprice);
		pstat.setString(3, iced);
		int result = pstat.executeUpdate();
		con.commit();
		con.close();
		return result;
	}	
}
