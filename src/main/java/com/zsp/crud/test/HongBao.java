package com.zsp.crud.test;

public class HongBao {
	int j;
	int d,b;//d为总分数，b为剩余分数。
	int i,k;//i为总人数，k为分发人数。
	int count;//count为当前分数总和。
	int money;//money为当前红包钱数。
	
	public  void init(double d,int i) {
		 this.d = (int)d*100;
		 b = this.d;
		 this.i = i;
		 System.out.println("共"+d+"元，即"+this.d+"分，共"+this.i+"人。"+"\n"+"总分发红包金额为"+count+"分，剩余分数为"+b+"分。"+"\n"+"总分发"+k+"人，还剩"+(this.i-k)+"人。");
		 System.out.println("*******************************************");
		 
	} 
	
	public synchronized int getRandomMoney(){
	       if(count<d&&(k<=i-1)){
	          
	           if(k==i-1) {
	        	   money = d-count;	    	  
		    	   count+=money;
		    	   b=d-count;
		    	   k++;
		    	   System.out.println(money/100+"元"+money%100/10+"角"+money%10+"分");
		    	   System.out.println("总分发红包金额为"+count+"分，剩余分数为"+b+"分。"+"\n"+"总分发"+k+"人，还剩"+(i-k)+"人。这是最终的");
	           }else if(count<d&&(k<i-1)){
	        	   money =(int)(Math.random()*(d-count)*2/(i-k)+1);
		           j=count;
		           count+=money;
	           b=d-count;
	           k++;
	           System.out.println(money/100+"元"+money%100/10+"角"+money%10+"分");
	           System.out.println("总分发红包金额为"+count+"分，剩余分数为"+b+"分。"+"\n"+"总分发"+k+"人，还剩"+(i-k)+"人。这是一般的");
	           }}
	       /*else {} { {	
	    	   money = d-count;
	    	   b=d-count;
	    	   k++;
	    	   System.out.println(money/100+"元"+money%100/10+"角"+money%10+"分");
	    	   System.out.println("总分发红包金额为"+count+"分，剩余分数为"+b+"分。"+"\n"+"总分发"+k+"人，还剩"+(i-k)+"人。");
	       }*/
	       
	       return money;  
	}

	
	/*public void tishi() {
		b=d-count;
		System.out.println("共"+d+"元，即"+this.d+"分，共"+this.i+"人。"+"\n"+"总分发红包金额为"+count+"分，剩余分数为"+b+"分。"+"\n"+"总分发"+k+"人，还剩"+(this.i-k)+"人。");
	}*/
	/*public void run() {
		int[]a = new int [i];
		for (int i = 0; i < this.i; i++) {
			System.out.println(getRandomMoney());
			b+=money;
			a[i]=money;
		}
		System.out.println(b);
	}
	*/
	
	/*public static void main(String[] args) {
		HongBao hongbao = new HongBao();
		hongbao.qiang(100.00, 10);
		hongbao.run();
	}*/

	}
