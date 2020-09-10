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

@WebServlet("/prepareReceitas")
public class ServletPrepareReceitas extends HttpServlet {

	final static Logger logger = LogManager.getLogger(ServletPrepareReceitas.class);

	protected void service (HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    List<String> receitasNomes;

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      MapperReceita mapperReceita = sqlSession.getMapper(MapperReceita.class);
			receitasNomes = mapperReceita.selectReceitasNomes();
    }
    request.setAttribute("receitas",receitasNomes);
    response.setContentType("text/html;chars	et=UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("Receitas.jsp");
		rd.forward(request,response);
  }
}
