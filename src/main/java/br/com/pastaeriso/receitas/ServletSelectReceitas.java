package br.com.pastaeriso.receitas;

import java.util.List;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import org.apache.ibatis.session.SqlSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import br.com.pastaeriso.servicos.DatabaseConnection;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.PrintWriter;

@WebServlet("/selectReceitas")
public class ServletSelectReceitas extends HttpServlet {

	final static Logger logger = LogManager.getLogger(ServletPrepareReceitas.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    List<Receita> receitas = null;

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      MapperReceita mapperReceita = sqlSession.getMapper(MapperReceita.class);
			receitas = mapperReceita.selectReceitas();
    }
    if(receitas != null ) {
      Gson gson = new GsonBuilder()
											.serializeNulls()
											.create();
      String string = gson.toJson(receitas.toArray(new Receita[0]));
      response.setContentType("application/json;charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.print(string);
    }

  }
}
