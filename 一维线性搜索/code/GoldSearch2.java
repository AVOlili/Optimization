/**
 * @author AVOli
 * @version 2.0
 */
public class GoldSearch2 {
	public static void GoldSearch(double a, double b, double e){
		//1>>已经确定f(t)的初始搜多区间[a,b]
		double B = ((3-Math.sqrt(5))/2);//beta的值
		double t1,t2,f1,f2;
		t2 = a + B*(b-a);//2>>计算t2,f2
		f2 = fun(t2);
		t1 = a+b-t2;	//3>>计算t1,f1
		f1 = fun(f2);
		int count = 0;
		while(true){
			if(Math.abs(t1-t2)<e){
				double t = (t1+t2)/2;
				System.out.println("最优点 t*="+t);
				System.out.println("此点对应的函数值："+fun(t));
				System.out.println("迭代步数"+count);
				break;
			}else if(f1<f2){
				a=t2;t2=t1;f2=f1;
				t1 = a+b-t2;	//3>>计算t1,f1
				f1 = fun(f2);
				count++;
			}else{
				b=t1;t1=t2;f1=f2;
				t2=a+B*(b-a);f2=fun(t2);
				count++;
			}
		}
	}
	private static double fun(double t) {
		return (double) (3*Math.pow(t,4)-4*Math.pow(t, 3)-12*Math.pow(t, 2));
	}
	public static void main(String[] args){
		GoldSearch(2,3,0.0001);
	}
}