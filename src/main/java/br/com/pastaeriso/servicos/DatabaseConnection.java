package br.com.pastaeriso.servicos;

import java.io.InputStream;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.math.BigDecimal;

import java.io.File;
import org.apache.ibatis.migration.JdbcConnectionProvider;
import org.apache.ibatis.migration.operations.VersionOperation;
import org.apache.ibatis.migration.FileMigrationLoader;
import java.util.Collections;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DatabaseConnection {

	private static DatabaseConnection singleton;
	static final Logger logger = LogManager.getLogger(DatabaseConnection.class);

	public static DatabaseConnection getInstance(){
		if(singleton==null) {
			singleton = new DatabaseConnection();
		}
		return singleton;
	}

	private SqlSessionFactory sqlSessionFactory = null;

	private DatabaseConnection(){
		ClassLoader classloader = Thread.currentThread().getContextClassLoader();

		// my batis migrations
		try {
			File scripts = new File(classloader.getResource("migrations/scripts").toURI());
			FileMigrationLoader fileMigrationLoader = new FileMigrationLoader(scripts,null,null);
			BigDecimal version = Collections.max(fileMigrationLoader.getMigrations()).getId();
			new VersionOperation(version).operate(
	  		new JdbcConnectionProvider("org.postgresql.Driver", "jdbc:postgresql://localhost:5432/pastaeriso", "lucasgueiros", "123456"),
				fileMigrationLoader, null, null);
		} catch (java.net.URISyntaxException e) {
			logger.atError().log(e.getMessage());
			logger.atDebug().withThrowable(e).log(e.getMessage());
		} catch (Exception e) {
			logger.atError().log(e.getMessage());
			logger.atDebug().withThrowable(e).log(e.getMessage());
		}


		// set up mybatis connection
		String resource = "mybatis-config.xml";
		InputStream inputStream = classloader.getResourceAsStream(resource);
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
	}

	public SqlSessionFactory getSqlSessionFactory(){
		return sqlSessionFactory;
	}

}
