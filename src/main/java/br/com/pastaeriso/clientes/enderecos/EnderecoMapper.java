package br.com.pastaeriso.clientes.enderecos;

import java.util.List;

public interface EnderecoMapper {

	public Endereco selectEnderecoById(Integer id);
	public TipoDeEndereco selectTipoDeEnderecoById(Integer id);
	public List<Endereco> selectEnderecosByClienteId(Integer cliente_id);

}
