package br.com.pastaeriso.pedidos;

import org.junit.jupiter.api.Test;
//import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
//import br.com.pastaeriso.pedidos.PedidoMapper;
import java.util.List;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import org.apache.ibatis.session.SqlSession;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class PedidoMapperTest {

  @Test
  public void testeBdConexao() {
    List<Pedido> pedidos = new ArrayList<>();

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
      pedidos = mapper.selectPedidos();
    }
    assertNotNull(pedidos);
    //print(pedidos)
  }

  private void print(List<?> lista) {
    String r = "";
    if(lista == null)
      r = "null";
    else
      r = lista.toString();
    r = r.replace(",","\n");
    System.out.println(r);
  }

}
