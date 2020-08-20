package br.com.pastaeriso.clientes.contatos;

import java.util.HashMap;
import java.util.List;

public interface ContatoMapper {
  public List<FormaDeContato> selectFormasDeContato();
  public FormaDeContato selectFormaDeContatoById(Integer id);
  public FormaDeContato selectFormaDeContatoPorForma(String forma);
  public List<Contato> selectContatosByClienteId(Integer cliente_id);
  public Contato selectContatoById(Integer id);
  public Integer insertContato(HashMap<String,Object> parameters);
}
