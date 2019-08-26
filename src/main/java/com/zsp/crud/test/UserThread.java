package com.zsp.crud.test;

public class UserThread implements Runnable {

	    private HongBao hongBao;
	    public UserThread(HongBao hongBao) {
	        this.hongBao = hongBao;
	    }

	    @Override
	    public void run() {
	        int money = hongBao.getRandomMoney();
	        /*if(money == 0) {
	            System.out.println(Thread.currentThread().getName() + "不好意思，您手慢了！");
	        }else {*/
	            System.out.println(Thread.currentThread().getName() + "抢到 " + money+"分");
	        /*}*/
	        System.out.println("*************************************************");

	    }
	}

