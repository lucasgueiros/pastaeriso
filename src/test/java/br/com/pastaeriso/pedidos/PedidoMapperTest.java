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

  @Test
  public void testeBdConexao() {
  List<Pedido> pedidos = new ArrayList<>();

  try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
    PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
    pedidos = mapper.selectPedidos();
  }
    System.out.println(pedidos);
  }

}
