package br.com.pastaeriso.servicos;

import java.io.InputStream;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DatabaseConnection {
	
	private static DatabaseConnection singleton;
	
	public static DatabaseConnection getInstance(){
		if(singleton==null) {
			singleton = new DatabaseConnection();
		}
		return singleton;
	}
	
	private SqlSessionFactory sqlSessionFactory = null;
	
	private DatabaseConnection(){
		String resource = "mybatis-config.xml";
		ClassLoader classloader = Thread.currentThread().getContextClassLoader();
		InputStream inputStream = classloader.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}
	
	public SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}
	
}