package com.rental.utils;


import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.stereotype.Component;
 
public class PasswordUtil {
 
    // Hash a password using SHA-256
	public String hashPassword(String password, int shift) {
        StringBuilder encryptedPassword = new StringBuilder();
 
        for (int i = 0; i < password.length(); i++) {
            char ch = password.charAt(i);
            
            int shiftedChar = ch + (shift + i % 5);
            
            int xorKey = 123;
            shiftedChar ^= xorKey;
 
            encryptedPassword.append((char) shiftedChar);
        }
 
        return encryptedPassword.toString();
    }
 
	public String decryptPassword(String encryptedPassword, int shift) {
			StringBuilder decryptedPassword = new StringBuilder();
 
			for (int i = 0; i < encryptedPassword.length(); i++) {
				char ch = encryptedPassword.charAt(i);
 
         
				int xorKey = 123;
				int decryptedChar = ch ^ xorKey;
 
				decryptedChar -= (shift + i % 5);
 
				decryptedPassword.append((char) decryptedChar);
			}
			return decryptedPassword.toString();
        
	}
	public boolean verifyPassword(String enteredPassword, String storedEncryptedPassword, int shift) {
        String encryptedEnteredPassword = hashPassword(enteredPassword, shift);
 
        return encryptedEnteredPassword.equals(storedEncryptedPassword);
    }
 
}