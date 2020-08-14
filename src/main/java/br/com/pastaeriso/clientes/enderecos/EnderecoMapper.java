package br.com.pastaeriso.clientes.enderecos;

import java.util.List;
import java.util.HashMap;

public interface EnderecoMapper {

	public Endereco selectEnderecoById(Integer id);
	public TipoDeEndereco selectTipoDeEnderecoById(Integer id);
	public TipoDeEndereco selectTipoDeEnderecoPorTipo(String tipo);
	public List<Endereco> selectEnderecosByClienteId(Integer cliente_id);
	public Integer insertEndereco(HashMap<String,Object> parameters);

}
