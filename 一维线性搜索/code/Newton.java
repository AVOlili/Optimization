public class Newton {
	public static void Newton(double a,double b,double t0,double e){
		double t = t0;
		int count=0;
		do{
			t0=t;//第一次t0就是本身
			count++;
			t=t0-y1(t0)/y2(t0);
		}while(Math.abs(t-t0)>=e);
		System.out.println("最优解t*："+t0+"    对应的最优值y(t*)："+y(t0));
		System.out.println("迭代次数："+count);
	}
	public static double y(double x){
		return 3*Math.pow(x, 4)-4*Math.pow(x, 3)-12*Math.pow(x, 2);
		//y=3x^4-4x^3-12x^2
	}
	public static double y1(double x){
		return 12*Math.pow(x, 3)-12*Math.pow(x, 2)-24;
		//y'=12x^3-12x^2-24x
	}
	public static double y2(double x){
		return 36*Math.pow(x, 2)-24*x-24;
		//y"=36x^2-24x-24
	}
	public static void main(String[] args) {
		Newton(1,3,2.9,0.0001);
	}
}