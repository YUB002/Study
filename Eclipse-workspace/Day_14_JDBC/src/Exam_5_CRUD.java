import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class Exam_5_CRUD  {
   public static void main(String[] args) throws Exception {

      Class.forName("oracle.jdbc.driver.OracleDriver");
      Scanner sc = new Scanner(System.in);

      String url = "jdbc:oracle:thin:@localhost:1521:xe";
      String id = "kh";
      String pw = "kh";
      
      while(true) {
         System.out.println("<< 카페 메뉴 관리 프로그램 >>");
         System.out.println("1. 신규 메뉴 등록");
         System.out.println("2. 메뉴 목록 출력");
         System.out.println("3. 메뉴 정보 삭제 (상품코드로 삭제)");
         System.out.println("4. 메뉴 정보 수정 (상품코드로 변경)");
         System.out.println("0. 프로그램 종료");
         System.out.print(">> ");
         int menu = Integer.parseInt(sc.nextLine());

         if(menu == 1) {
            System.out.print("메뉴 이름 : ");
            String pname = sc.nextLine();
            
            System.out.print("메뉴 가격 : ");
            int pprice = Integer.parseInt(sc.nextLine());
            
            System.out.print("아이스 가능 (Y,N) ? ");
            String iced = sc.nextLine();
            
            Connection con = DriverManager.getConnection(url,id,pw);
            Statement stat = con.createStatement();
            
            String sql = 
               "insert into cafe_menu values(cafe_menu_seq.nextval,'"+pname+"',"+pprice+",'"+iced+"')";
            
            int result = stat.executeUpdate(sql);
            
            if(result>0) {
               System.out.println("입력 완료");
            }
            con.commit();
            con.close();
         }else if(menu == 2) {
            
            Connection con = DriverManager.getConnection(url,id,pw);
            Statement stat = con.createStatement();
            
            String sql = "select * from cafe_menu order by 1";
            
            ResultSet rs = stat.executeQuery(sql);
            
            while(rs.next()) {
               int pid = rs.getInt("pid");
               String pname = rs.getString("pname");
               int pprice = rs.getInt("pprice");
               String iced = rs.getString("iced");
               System.out.println(pid + " : " + pname + " : " + pprice + " : " + iced);
            }
            con.close();
            
         }else if(menu == 3) {
            System.out.print("삭제할 상품 코드 : ");
            int delPID = Integer.parseInt(sc.nextLine());
            
            Connection con = DriverManager.getConnection(url,id,pw);
            Statement stat = con.createStatement();
            
            String sql = "delete from cafe_menu where pid = " + delPID;
            
            int result = stat.executeUpdate(sql);
            if(result > 0) {
               System.out.println("삭제 성공");
            }
            con.commit();
            con.close();
         }else if(menu == 4) {
            
            System.out.print("변경할 메뉴의 상품 코드 : ");
            int updPID = Integer.parseInt(sc.nextLine());
            
            System.out.print("메뉴 이름 : ");
            String pname = sc.nextLine();
            
            System.out.print("메뉴 가격 : ");
            int pprice = Integer.parseInt(sc.nextLine());
            
            System.out.print("아이스 가능 (Y,N) ? ");
            String iced = sc.nextLine();
            
            
            Connection con = DriverManager.getConnection(url,id,pw);
            Statement stat = con.createStatement();
            
            String sql = 
                  "update cafe_menu set pname='"+pname+
                  "', pprice="+pprice+
                  ",iced='"+iced+
                  "' where pid="+updPID;
            int result = stat.executeUpdate(sql);
            
            if(result > 0) {
               System.out.println("변경 완료");
            }
            
            con.commit();
            con.close();
         }else if(menu == 0) {
            System.out.println("프로그램을 종료합니다.");
            System.exit(0);
         }else {
            System.out.println("메뉴를 다시 확인해주세요.");
         }
      }

   }
}