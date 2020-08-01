package br.com.pastaeriso.servicos;

import java.io.InputStream;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Properties;

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

	private SqlSessionFactoryBuilder sqlSessionFactoryBuilder = null;
	private InputStream inputStream = null;

	private DatabaseConnection(){
		String resource = "mybatis-config.xml";
		ClassLoader classloader = Thread.currentThread().getContextClassLoader();
		InputStream inputStream = classloader.getResourceAsStream(resource);
		this.sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
	}

	// default password
	public SqlSession getSqlSession(String username, String password){
		return getSqlSession("jdbc:postgresql://localhost:5432/pastaeriso"
			,username,password);
	}

	public SqlSession getSqlSession
			(String url, String username, String password){
		Properties properties = new Properties();
		properties.setProperty("username", username);
		properties.setProperty("password", password);
		properties.setProperty("url", url);

		SqlSessionFactory sqlSessionFactory =
			sqlSessionFactoryBuilder.build(inputStream, properties);
		try(SqlSession sqlSession = sqlSessionFactory.openSession()){
			return sqlSession;
		}
	}

}
