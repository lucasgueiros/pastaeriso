package br.com.pastaeriso.pedidos;

import org.junit.jupiter.api.Test;
//import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
//import br.com.pastaeriso.pedidos.PedidoMapper;
import java.util.List;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import org.apache.ibatis.session.SqlSession;

public class PedidoMapperTest {

  /*@Test
  public void testeBdConexao() {
    List<Pedido> pedidos = new ArrayList<>();
    String user = JOptionPane.showInputDialog("Digite seu usuário");
    String password = JOptionPane.showInputDialog("Digite a senha");
    String url = "jdbc:postgresql://192.168.0.150:5432/pastaeriso";
    String driver = "org.postgresql.Driver";
		try (SqlSession sqlSession = DatabaseConnection.getInstance()
                            .getSqlSession(driver,url,user,password)) {
			PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
			pedidos = mapper.selectPedidos();
		}
    System.out.println(pedidos);
  }*/

}
