package br.com.pastaeriso.pedidos;

import org.junit.jupiter.api.Test;
//import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
//import br.com.pastaeriso.pedidos.PedidoMapper;
import java.util.List;
import java.util.ArrayList;
import javax.swing.JOptionPane;
import org.apache.ibatis.session.SqlSession;
import java.time.LocalDate;
import com.google.gson.Gson;

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

  @Test
  public void testeBdConexao2() {
    List<Pedido> pedidos = new ArrayList<>();

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
      pedidos = mapper.selectPedidosPorData(LocalDate.now());
    }
    assertNotNull(pedidos);
    //print(pedidos)
  }

  @Test
  public void testeBdConexao3() {
    Pedido pedido = null;

    try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
      PedidoMapper mapper = sqlSession.getMapper(PedidoMapper.class);
      pedido = mapper.selectPedidoPorId(Integer.decode("21"));
    }
    assertNotNull(pedido);
    if(pedido != null ){
      System.out.println(pedido);
      //System.out.println(new Gson().toJson(pedido));
      //System.out.println(pedido.getTotal());
    }

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
