package academy;

public class Method_02 {
	public static void main(String[] args) {
		
			String str ="Hello World";
			int length = str.length();
			System.out.println(length);

			char test = str.charAt(6);
			System.out.println(test);

			boolean bool = str.startsWith("He");
			System.out.println(bool);

			boolean end = str.endsWith("d");
			System.out.println(end);

			System.out.println(str.contains("or"));

			System.out.println(str.equals("Hello World"));

			//W라는 알파벳이 있는지 있다면 몇번째 자리에 위치해있는지
			int index = str.indexOf("W");
			System.out.println("W의 위치 : " +index);
		
			String []str3 = str.split(" ");
			System.out.println(str3[0]+" + "+str3[1]);
		}
}