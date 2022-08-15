package exam;

import java.util.Scanner;

public class Netflix {
	public static void main(String[] args) {

		Movie[] mov= new Movie[10];
		Scanner sc= new Scanner(System.in);
		int n=0;
		int menu=0;

		abc:while(true) {
			System.out.println("<<Netflix>>");
			System.out.println("1. 신규 영화 등록");
			System.out.println("2. 영화 목록 출력");
			System.out.println("3. 영화 검색");
			System.out.println("4. 프로그램 종료");

			while(true) {
				try {
					System.out.print("선택 >>");
					menu = Integer.parseInt(sc.nextLine());
					break;
				}catch (Exception e) {
					System.out.println("메뉴를 선택해주세요");}
			}

			switch(menu) {
			case 1:
				mov[n]=new Movie();
				System.out.println("<<신규 영화 등록>>");
				System.out.print("영화 제목 : ");
				mov[n].setName(sc.nextLine());
				System.out.print("영화 장르 : ");
				mov[n].setGenre(sc.nextLine());
				System.out.print("영화 평점(백점만점) : ");
				mov[n].setRating();
				n++;
				break;

			case 2:
				if(n==0) {
					System.out.println("출력할 내용이 없습니다.");
					break;
				} 
				System.out.println("<<영화 목록>>");
				System.out.println("제목\t장르\t평점");
				for(int i=0;i<n;i++) {
					System.out.println(mov[i].getName()+"\t"+mov[i].getGenre()+"\t"+mov[i].getRating());	
				}
				break;

			case 3:
				System.out.println("<<영화 검색(제목으로 검색해주세요)>>");
				System.out.print("영화 제목 : ");
				String fname= sc.nextLine();
				for(int i=0;i<n;i++) {
					if(fname.equals(mov[i].getName())) {
						System.out.println(mov[i].getName()+"\t"+mov[i].getGenre()+"\t"+mov[i].getRating());
						continue abc;
					}
				}	
				System.out.println("입력하신 "+fname+"과 일치하는 결과가 없습니다.");
				break ;

			case 4: 
				System.out.println("프로그램을 종료합니다.");
				System.exit(0);
			default:
				System.out.println("메뉴를 선택해주세요");
			}
		}
	}
}
