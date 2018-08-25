package com.rxprism.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

public class PasswordEncryptor {
	public static String encrypt(String password){
		try{
			byte[] salt = getSalt();
			String securePassword = getSecurePassword(password, salt);
			return securePassword;
		}catch(Exception ex){
			System.out.println("Exception occurred while encrypting password");
			return null;
		}
	}
	private static String getSecurePassword(String passwordToHash, byte[] salt){
		String generatedPassword = null;
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(salt);
			byte[] bytes = md.digest(passwordToHash.getBytes());
			StringBuilder sb = new StringBuilder();
			for(int i=0; i< bytes.length ;i++){
				sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
			}
			generatedPassword = sb.toString();
		} 
		catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return generatedPassword;
	}
	private static byte[] getSalt() throws NoSuchAlgorithmException, NoSuchProviderException{
		String inputSalt = "Rxk!0sk@RxP6!sM12@$@4&#%^$*";
		return inputSalt.getBytes();
	}
}
