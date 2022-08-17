import java.io.File;

import it.sauronsoftware.ftp4j.FTPClient;

package exam;

public class FTPClient {

	public static void main(String[] args) throws Exception{

		FTPClient client = new FTPClient();

		client.connect("ip주소", port);
		client.login("id", "password");
		client.download("파일명.txt", new File("d:/다운로드폴더/파일명.txt"));
		client.disconnect(true);
	}
}
//throws Exception 하는 이유: client.connect를 실행할 경우 문제가 생길 수 있다는 경고가 떠서