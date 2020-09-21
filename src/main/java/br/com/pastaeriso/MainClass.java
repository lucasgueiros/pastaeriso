package br.com.pastaeriso;
import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.pedidos.PedidoMapper;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;
import java.math.BigDecimal;
import java.util.List;
import java.util.LinkedList;
import java.time.LocalDate;

public class MainClass {
  public static void main (String [] args) {
    List<LocalDate> datas = new LinkedList<>();
    datas.add(LocalDate.of(2020,9,20));
    datas.add(LocalDate.of(2020,9,19));
    datas.add(LocalDate.of(2020,9,18));
    datas.add(LocalDate.of(2020,9,17));
    BigDecimal total = new BigDecimal(0);
    for(LocalDate data : datas) {
      List<Pedido> pedidos;
      try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
  			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
  			pedidos = pedidoMapper.selectPedidosPorData(data);
  		}
      for(Pedido pedido : pedidos) {
        total = total.add(pedido.getTotal());
      }
    }
    System.out.println(total);

  }
}
