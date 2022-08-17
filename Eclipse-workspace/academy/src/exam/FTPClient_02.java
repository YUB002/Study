import java.io.File;
import java.util.Scanner;
import it.sauronsoftware.ftp4j.FTPClient;
import it.sauronsoftware.ftp4j.FTPFile;

package exam;

public class FTPClient_02 {

	//외부 Library 를 활용한 FTP Client 제작하기 

		public static void main(String[] args) throws Exception{

			Scanner sc= new Scanner(System.in);
			FTPClient client = new FTPClient();

			first: while(true) {
				System.out.println("=== FTP Client Program ===");
				System.out.println("1. Connect FTP Server");
				System.out.println("2. EXit Program");
				System.out.print(">>");
				int menu1=Integer.parseInt(sc.nextLine());

				switch(menu1) {
				case 1:
					while(true) {
						System.out.print("input url \n>>>");
						String url=sc.nextLine();
						System.out.print("input port \n>>>");
						int port=Integer.parseInt(sc.nextLine());
						try {
							client.connect(url, port);
							System.out.println("FTP Server is connected!");
							break;
						}catch(Exception e) {
							System.out.println("FTP Server is unconnected!");
						}
					}
					while(true) {
						System.out.print("input id : ");
						String id=sc.nextLine();
						System.out.print("input password : ");
						String pw=sc.nextLine();
						try{
							client.login(id, pw);
							System.out.println("Login Success!");
							break;
						}catch(Exception e) {
							System.out.println("Login Fail!");
						}
					}

					while(true) {
						System.out.println("1. Upload File");
						System.out.println("2. Download File");
						System.out.println("3. Disconnect FTP Server");
						System.out.println("4. Delete File");
						System.out.print(">>>");
						int menu2=Integer.parseInt(sc.nextLine());

						switch(menu2) {
						case 1: 
							System.out.print("업로드하려는 파일 명 : ");
							try {
								client.upload(new File(sc.nextLine()));
								System.out.println("업로드에 성공하였습니다.");
							}catch(Exception e) {
								System.out.println("파일 업로드에 실패하였습니다.");
							}
							break;

						case 2:
							System.out.println("다음 목록 중에 고르세요.");
							FTPFile[] list = client.list();
							for(int i=0;i< list.length; i++) {
								System.out.println("파일 명 : "+list[i].getName()+"\t사이즈 : "+list[i].getSize());
							}
							System.out.print("다운받을 파일 명 >>>");
							String dw=sc.nextLine();
							System.out.print("다운받을 주소 >>>");
							String dwad=sc.nextLine();
							try {
								client.download(dw, new File(dwad));
								System.out.println("다운로드에 성공하였습니다.");
							}catch(Exception e) {
								System.out.println("파일 다운로드에 실패하였습니다.");
							}
							break;

						case 3:
							client.disconnect(true);
							System.out.println("연결이 끊겼습니다.");
							continue first ;

						case 4:
							try {
								list = client.list();
								for(int i=0;i< list.length; i++) {
									System.out.println("파일 명 : "+list[i].getName()+"\t사이즈 : "+list[i].getSize());
								}
								System.out.print("삭제한 파일 명 : ");
								client.deleteFile(sc.nextLine());
								System.out.println("삭제되었습니다.");
							}catch(Exception e) {
								System.out.println("파일 삭제에 실패하였습니다.");
							}
							break;

						default:
							System.out.println("메뉴를 선택하세요.");

						}
					}

				case 2:
					System.out.println("프로그램을 종료합니다.");
					System.exit(0);
					break;

				default:
					System.out.println("메뉴를 선택하세요.");
				}
			}
		}
	}