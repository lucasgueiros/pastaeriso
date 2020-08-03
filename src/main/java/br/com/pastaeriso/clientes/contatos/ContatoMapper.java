package br.com.pastaeriso.clientes.contatos;

import java.util.List;

public interface ContatoMapper {
  public FormaDeContato selectFormaDeContatoById(Integer id);
  public List<Contato> selectContatosByClienteId(Integer cliente_id);
}
