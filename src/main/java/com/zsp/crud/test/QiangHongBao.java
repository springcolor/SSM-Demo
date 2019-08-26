package com.zsp.crud.test;

public class QiangHongBao {
	    public static void main(String[] args) {
	    	int a = 100;
	    	double b =100.0;
	        HongBao hongBao =new HongBao();
	        hongBao.init(b,a);
	        UserThread user = new UserThread(hongBao);
	        for(int i=0;i<a;i++) {
	            new Thread(user).start();	            
	        }
	    }
	
}
