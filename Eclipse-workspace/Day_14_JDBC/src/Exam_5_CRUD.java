import java.util.ArrayList;
import java.util.Scanner;

public class Exam_5_CRUD {
	public static void main(String[] args) {

		CafeMenuDAO dao= new CafeMenuDAO();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		Scanner sc=new Scanner(System.in);

		while(true) {
			System.out.println("<<카페 메뉴 관리 프로그램>>");
			System.out.println("1. 신규 메뉴 등록");
			System.out.println("2. 메뉴 목록 출력");
			System.out.println("3. 메뉴 삭제(상품코드로 삭제)");
			System.out.println("4. 메뉴 변경(상품코드로 변경)");
			System.out.println("0. 프로그램 종료");
			System.out.print(">>");
			int menu=Integer.parseInt(sc.nextLine());

			if (menu == 1) {
				System.out.print("메뉴 이름 : ");
				String pname=sc.nextLine();

				System.out.print("메뉴 가격 : ");
				int pprice=Integer.parseInt(sc.nextLine());

				System.out.print("아이스 가능(Y,N) ? ");
				String iced=sc.nextLine();

				try {
					int result =dao.insert(new CafeMenuDTO(0,pname,pprice,iced));
					if(result>0) {
						System.out.println("입력 완료");
					}
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("같은 오류가 반복되면 관리자에게 문의하세요.");
				}


			}else if (menu == 2){

				try {
					ArrayList<CafeMenuDTO> result = dao.selectAll();
					for(CafeMenuDTO dto : result) {
						System.out.println(dto.getPid()+"\t"+dto.getPname()+"\t"+dto.getPprice()+"\t"+dto.getIced());
					}
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("같은 오류가 반복되면 관리자에게 문의하세요.");
				}

			}else if (menu == 3){

				System.out.print("삭제할 메뉴의 코드 : ");
				int delid = Integer.parseInt(sc.nextLine());

				try {
					int result = dao.delete(delid);
					if(result > 0) {
						System.out.println("삭제 완료");
					}
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("문제가 발생했습니다. 관리자에게 문의하세요.");
					System.out.println("manager@admin.com");
				}
			}else if (menu == 4){

				System.out.print("변경할 메뉴의 코드 : ");
				int updpid = Integer.parseInt(sc.nextLine());
				System.out.print("메뉴 이름 : ");
				String pname=sc.nextLine();
				System.out.print("메뉴 가격 : ");
				int pprice=Integer.parseInt(sc.nextLine());
				System.out.print("아이스 가능(Y,N) ? ");
				String iced=sc.nextLine();

				try {
					int result =dao.update(new CafeMenuDTO(updpid,pname,pprice,iced));
					if(result>0) {
						System.out.println("입력 완료");
					}
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("같은 오류가 반복되면 관리자에게 문의하세요.");
				}
			}else if (menu == 0){
				System.out.println("프로그램을 종료합니다");
				System.exit(0);
			}else {
				System.out.println("메뉴를 다시 확인해주세요");
			}
		}
	}
}
