package br.com.pastaeriso.produtos;

import br.com.pastaeriso.produtos.Produto;
import br.com.pastaeriso.produtos.ProdutoPreco;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;

public class ProdutoTest {
  @Test
  public void getPrecoTest() {
    ProdutoPreco preco1 = new ProdutoPreco();
    ProdutoPreco preco2 = new ProdutoPreco();
    Produto produto = new Produto();
    preco1.setPreco(new BigDecimal(10));
    preco1.setData(LocalDate.of(2020,8,10));
    preco2.setData(LocalDate.of(2020,8,20));
    preco2.setPreco(new BigDecimal(5));
    LocalDate data1 = LocalDate.of(2020,8,10);
    LocalDate data2 = LocalDate.of(2020,8,15);
    LocalDate data3 = LocalDate.of(2020,8,20);
    LocalDate data4 = LocalDate.of(2020,8,25);
    ArrayList<ProdutoPreco> precos = new ArrayList<>();
    precos.add(preco1);
    precos.add(preco2);
    produto.setPrecos(precos);
    assertNotNull(produto);
    assertNotNull(produto.getProdutoPreco(data1));
    assertNotNull(produto.getProdutoPreco(data2));
    assertNotNull(produto.getProdutoPreco(data3));
    assertNotNull(produto.getProdutoPreco(data4));
    assertEquals(new BigDecimal(10),produto.getPreco(data1));
    assertEquals(new BigDecimal(10),produto.getPreco(data2));
    assertEquals(new BigDecimal(5),produto.getPreco(data3));
    assertEquals(new BigDecimal(5),produto.getPreco(data4));
  }
}
