import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class Exam_01 {

		public static void main(String[] args) throws Exception{
			
			//JDBC
			//Java DataBase Connectivity
			//자바 프로그램을 통해서 DBMS를 사용하는 문법
			
			//오라클 외장 라이브러리를 통해 자바와 오라클 연결 
			
			
			//Step 1. DBMS 라이브러리 등록하기 
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//Step 2. DBMS에 접속하기
			String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbID = "kh";
			String dbPw = "kh";
			Connection con = DriverManager.getConnection(dbURL,dbID,dbPw);
			
			//Step 3. Query  전달 인스턴스 생성
			Statement stat =con.createStatement();
			
			String sql = "insert into cafe_menu values(cafe_menu_seq.nextval,'Cafe Mocha',4000,'Y')";
			
			int result = stat.executeUpdate(sql);
			
			//Step 4. Query 실행 결과 확인
			if(result>0) {
				System.out.println("입력 성공");
			}else {
				System.out.println("입력 실패");
			}
			
			//Step 5. 마무리 작업
	 		con.commit();
			con.close();
			
		}
}
