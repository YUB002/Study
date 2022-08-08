package academy;

public class Array_05 {
	public static void main(String[] args) {
		//배열 교환

		int[] arr = new int[] {10,20};

		//				arr[0]=20; 교환이 아니라 대입
		//				arr[2]=10;

		System.out.println(arr[0]+":"+arr[1]);

		int tmp=arr[0];
		arr[0]=arr[1];
		arr[1]=tmp;

		System.out.println(arr[0]+":"+arr[1]);

	}
}
