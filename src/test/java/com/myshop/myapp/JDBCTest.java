package com.myshop.myapp;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.jupiter.api.Test;

class JDBCTest {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("드라이버 연결 실패");
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		
		try(Connection con = 
				DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/myshop?serverTimezone=Asia/Seoul",
						"root",
						"a1234")){
			System.out.println(con);
			System.out.println("연결 성공");
		} catch (Exception e) {
			System.out.println("연결 실패");
			fail(e.getMessage());
		}
		
	}

}
