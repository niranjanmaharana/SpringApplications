/**
 * 
 */
package com.niranjan.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @author Niranjan
 *
 */
public class HashUtil {

	/**
	 * @param args
	 * @throws NoSuchAlgorithmException 
	 */
	
	public static void main(String[] args) throws NoSuchAlgorithmException {
		System.out.println(hashValue("456"));
	}
	
	public static String hashValue(String value)throws NoSuchAlgorithmException{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		byte[] result = digest.digest(value.getBytes());
		StringBuffer buffer = new StringBuffer();
		for(int i = 0; i < result.length; i++){
			buffer.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
		}
		return buffer.toString();
	}
}