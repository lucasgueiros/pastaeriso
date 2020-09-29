package br.com.pastaeriso;
import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.pedidos.PedidoMapper;
import org.apache.ibatis.session.SqlSession;
import br.com.pastaeriso.servicos.DatabaseConnection;
import java.math.BigDecimal;
import java.util.List;
import java.util.LinkedList;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class MainClass {
  public static void main (String [] args) {
    List<LocalDate> datas = new LinkedList<>();
    Scanner scanner = new Scanner(System.in);
    System.out.println("Digite a data inicial: ");
    String inics = scanner.next();
    System.out.println("Digite a data final: ");
    String finis = scanner.next();

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    LocalDate inic = LocalDate.parse(inics, formatter);
    LocalDate fini = LocalDate.parse(finis, formatter);

    BigDecimal total = new BigDecimal(0);
    String r = "";
    while(inic.compareTo(fini) <= 0) {
      List<Pedido> pedidos;
      BigDecimal subtotal = new BigDecimal(0);
      try (SqlSession sqlSession = DatabaseConnection.getInstance().getSqlSessionFactory().openSession()) {
  			PedidoMapper pedidoMapper = sqlSession.getMapper(PedidoMapper.class);
  			pedidos = pedidoMapper.selectPedidosPorData(inic);
  		}
      for(Pedido pedido : pedidos) {
        subtotal = subtotal.add(pedido.getTotal());
      }
      r += "Subtotal " + inic + " : " + subtotal +"\n";
      total = total.add(subtotal);
      inic = inic.plusDays(1);
    }
    r += "Total: " + total +"\n";
    System.out.println(r);

  }
}
