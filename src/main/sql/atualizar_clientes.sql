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

insert into cliente_preferencias
  (cliente_id, contato_preferencial, endereco_preferencial)
  WITH summary AS (select
    cliente_contatos.cliente_id as cliente_id,
    cliente_contatos.id as contato_preferencial,
    cliente_enderecos.id as endereco_preferencial,
    ROW_NUMBER() OVER(PARTITION BY cliente_contatos.cliente_id ) AS rk
  from cliente_contatos
  join cliente_enderecos
  on cliente_enderecos.cliente_id = cliente_contatos.cliente_id)
  SELECT s.cliente_id, s.contato_preferencial, s.endereco_preferencial
  FROM summary s
  WHERE s.rk = 1
  ;
