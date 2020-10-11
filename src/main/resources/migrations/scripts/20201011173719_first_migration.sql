-- // First migration.
-- Migration SQL that makes the change goes here.

alter table dia_de_producao_movimentacoes_estoque rename to consumo_estoque;

-- //@UNDO
-- SQL to undo the change goes here.

alter table consumo_estoque rename to dia_de_producao_movimentacoes_estoque;
