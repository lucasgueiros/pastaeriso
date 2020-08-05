select clientes.id,clientes.nome,pedidos.id
from clientes
 join pedidos on pedidos.cliente_id = clientes.id
 where clientes.id <> 2;

update pedidos set
  cliente_id = clientes.id
  from clientes
  join pedidos
  on pedidos.cliente = clientes.nome
where cliente_id = 2;

insert into cliente_contatos
  (cliente_id, forma_de_contato, contato)
  select cliente_id, 2,contato
  from pedidos
  where cliente_id <> 2;

update cliente_contatos
  set forma_de_contato = 4
  where id =
