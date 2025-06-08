package com.bankinfo;

import java.util.Random;

public class GlobalFunction {

	public static int[] RandomizeArray(int a, int b){ //0-9
		Random rgen = new Random();  // Random number generator		
		int size = b-a+1;
		int[] array = new int[size];
 
		for(int i=0; i< size; i++){
			array[i] = a+i;
		}
 
		for (int i=0; i<array.length; i++) {
		    int randomPosition = rgen.nextInt(array.length);
		    int temp = array[i];
		    array[i] = array[randomPosition];
		    array[randomPosition] = temp;
		}
 
		
		return array;
	}
	
	
	public String authenticationOtp() 
	{
		char[] chars = "1234567890".toCharArray();
		StringBuilder sb = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 4; i++) 
		{
		    char c = chars[random.nextInt(chars.length)];
		    sb.append(c);
		}
		String output = sb.toString();
		return output;
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
