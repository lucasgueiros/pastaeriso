package br.com.pastaeriso.pedidos;

import org.junit.jupiter.api.Test;
//import br.com.pastaeriso.pedidos.Pedido;
import br.com.pastaeriso.servicos.DatabaseConnection;
//import br.com.pastaeriso.pedidos.PedidoMapper;
import java.util.List;
import java.util.ArrayList;

public class PedidoMapperTest {

  @Test
  public void testeBdConexao() {
    List<Pedido> pedidos = new ArrayList<>();
		try {
			PedidoMapper mapper = DatabaseConnection.getInstance()
															.getSqlSession("falso","falso")
															.getMapper(PedidoMapper.class);
			pedidos = mapper.selectPedidos();
		} catch(Exception e) {
			e.printStackTrace();
      return;
		}
    System.out.println(pedidos);
  }

}
