/**
 *Copyright：Copyright (c)  2014
 *Company：南京爱有趣科技有限公司
 *@author：杜博智
 * 2014-06-26
 *@version  1.0
**/
package com.dyyt.common;
import java.util.Random;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
/**
 *<pre>Spring加载接口类</pre>
 *<b>功能描述：</b>
 *		对Spring配置文件重新进行加载
**/
public class Context {
	public static ApplicationContext  getContext()
	{
		ApplicationContext context=new ClassPathXmlApplicationContext(Constant.SPRING_XML);  
		return context;
	}
	public static int[] randomArray(int min,int max,int n){  
	    int len = max-min+1;  
	      
	    if(max < min || n > len){  
	        return null;  
	    }  
	      
	    //初始化给定范围的待选数组  
	    int[] source = new int[len];  
	       for (int i = min; i < min+len; i++){  
	        source[i-min] = i;  
	       }  
	         
	       int[] result = new int[n];  
	       Random rd = new Random();  
	       int index = 0;  
	       for (int i = 0; i < result.length; i++) {  
	        //待选数组0到(len-2)随机一个下标  
	           index = Math.abs(rd.nextInt() % len--);  
	           //将随机到的数放入结果集  
	           result[i] = source[index];  
	           //将待选数组中被随机到的数，用待选数组(len-1)下标对应的数替换  
	           source[index] = source[len];  
	       }  
	       return result;  
	} 
}
