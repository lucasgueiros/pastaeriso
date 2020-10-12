-- // compras datahora horario
-- Migration SQL that makes the change goes here.

alter table compras rename column datahora to horario;
alter table compras alter column horario type time without time zone;

-- //@UNDO
-- SQL to undo the change goes here.

alter table compras alter column horario type timestamp without time zone;
alter table compras rename column horario to datahora;
