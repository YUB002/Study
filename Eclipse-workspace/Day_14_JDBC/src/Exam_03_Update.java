import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Exam_03_Update {
	//Americano  가격을 5000원으로 변경하는 프로그램을 작성
	
	
	public static void main(String[] args) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbID = "kh";
		String dbPW = "kh";
		Connection con = DriverManager.getConnection(dbURL,dbID,dbPW);
		
		Statement stat = con.createStatement();
		
		String sql = "update cafe_menu set pprice=2000";
		
		int result = stat.executeUpdate(sql);
		

		if(result>0) {
			System.out.println("입력 성공");
		}else {
			System.out.println("입력 실패");
		}
		
		con.commit();
		con.close();
	
	}
}
