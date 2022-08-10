package academy;

public class Method_03 {
	public static int countChar(String from, char findthis) {

		int count = 0;

		for(int i=0;i<from.length();i++) {
			char ch = from.charAt(i);
			if(ch == findthis) {
				count++;
			}
		}
		return count;
	}

	public static void main(String[] args) {
		// 제시된 문자열 중 대문자 S가 몇 개인지 구하는 함수를 만들어라
		String str = "hgcSiygckkcSkfjfjGSFjhjghjAHn";
		int count = countChar(str , 'h'); 	
		System.out.println("대문자 S의 개수 : " + count);
	}
}