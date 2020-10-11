--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-10-08 00:03:14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 34102)
-- Name: cardapio_produtos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.cardapio_produtos (
    cardapio_id integer NOT NULL,
    produto_id integer NOT NULL,
    preco numeric(15,3) NOT NULL,
    cardapio_produtos_id integer NOT NULL
);


ALTER TABLE public.cardapio_produtos OWNER TO lucasgueiros;

--
-- TOC entry 255 (class 1259 OID 43243)
-- Name: cardapio_produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.cardapio_produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapio_produtos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3289 (class 0 OID 0)
-- Dependencies: 255
-- Name: cardapio_produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.cardapio_produtos_id_seq OWNED BY public.cardapio_produtos.cardapio_produtos_id;


--
-- TOC entry 218 (class 1259 OID 34091)
-- Name: cardapios; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.cardapios (
    cardapios_id integer NOT NULL,
    nome character varying(100) NOT NULL,
    comentarios text
);


ALTER TABLE public.cardapios OWNER TO lucasgueiros;

--
-- TOC entry 217 (class 1259 OID 34089)
-- Name: cardapios_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.cardapios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cardapios_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3292 (class 0 OID 0)
-- Dependencies: 217
-- Name: cardapios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.cardapios_id_seq OWNED BY public.cardapios.cardapios_id;


--
-- TOC entry 265 (class 1259 OID 84323)
-- Name: categorias_de_produtos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.categorias_de_produtos (
    id integer NOT NULL,
    categoria character varying(100) NOT NULL
);


ALTER TABLE public.categorias_de_produtos OWNER TO lucasgueiros;

--
-- TOC entry 264 (class 1259 OID 84321)
-- Name: categorias_de_produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.categorias_de_produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categorias_de_produtos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3295 (class 0 OID 0)
-- Dependencies: 264
-- Name: categorias_de_produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.categorias_de_produtos_id_seq OWNED BY public.categorias_de_produtos.id;


--
-- TOC entry 232 (class 1259 OID 42889)
-- Name: cliente_contatos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.cliente_contatos (
    id integer NOT NULL,
    cliente_id integer,
    forma_de_contato integer NOT NULL,
    contato character varying(150) NOT NULL,
    nome character varying(30) DEFAULT 'principal'::character varying NOT NULL
);


ALTER TABLE public.cliente_contatos OWNER TO lucasgueiros;

--
-- TOC entry 231 (class 1259 OID 42887)
-- Name: cliente_contatos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.cliente_contatos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_contatos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3298 (class 0 OID 0)
-- Dependencies: 231
-- Name: cliente_contatos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.cliente_contatos_id_seq OWNED BY public.cliente_contatos.id;


--
-- TOC entry 234 (class 1259 OID 42907)
-- Name: cliente_enderecos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.cliente_enderecos (
    id integer NOT NULL,
    cliente_id integer,
    rua character varying(200) NOT NULL,
    numero character varying(50),
    bairro character varying(100) NOT NULL,
    complemento character varying(100),
    ponto_de_referencia character varying(300),
    comentarios text,
    tipo_de_endereco integer DEFAULT 1 NOT NULL,
    nome character varying(150) DEFAULT 'Casa'::character varying NOT NULL,
    municipio character varying(50) DEFAULT 'Garanhuns'::character varying NOT NULL,
    uf character varying(2) DEFAULT 'PE'::character varying NOT NULL,
    pais numeric(5,0) DEFAULT '1058'::numeric NOT NULL,
    cep character varying(10)
);


ALTER TABLE public.cliente_enderecos OWNER TO lucasgueiros;

--
-- TOC entry 233 (class 1259 OID 42905)
-- Name: cliente_enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.cliente_enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_enderecos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 233
-- Name: cliente_enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.cliente_enderecos_id_seq OWNED BY public.cliente_enderecos.id;


--
-- TOC entry 235 (class 1259 OID 42921)
-- Name: cliente_preferencias; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.cliente_preferencias (
    cliente_id integer NOT NULL,
    endereco_preferencial integer,
    contato_preferencial integer
);


ALTER TABLE public.cliente_preferencias OWNER TO lucasgueiros;

--
-- TOC entry 268 (class 1259 OID 92547)
-- Name: clientecontatos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.clientecontatos (
    cliente integer NOT NULL,
    contato integer NOT NULL
);


ALTER TABLE public.clientecontatos OWNER TO lucasgueiros;

--
-- TOC entry 269 (class 1259 OID 92562)
-- Name: clienteenderecos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.clienteenderecos (
    cliente integer NOT NULL,
    endereco integer NOT NULL
);


ALTER TABLE public.clienteenderecos OWNER TO lucasgueiros;

--
-- TOC entry 230 (class 1259 OID 42879)
-- Name: clientes; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(50) NOT NULL
);


ALTER TABLE public.clientes OWNER TO lucasgueiros;

--
-- TOC entry 229 (class 1259 OID 42877)
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 229
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- TOC entry 248 (class 1259 OID 43080)
-- Name: compra_itens; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.compra_itens (
    id integer NOT NULL,
    compra_id integer NOT NULL,
    marca character varying(100),
    movimentacao_estoque_id integer NOT NULL,
    valor numeric(10,4) NOT NULL,
    descricao character varying(200),
    codigoproduto numeric(10,0),
    nomeproduto character varying(200)
);


ALTER TABLE public.compra_itens OWNER TO lucasgueiros;

--
-- TOC entry 247 (class 1259 OID 43078)
-- Name: compra_itens_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.compra_itens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compra_itens_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 247
-- Name: compra_itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.compra_itens_id_seq OWNED BY public.compra_itens.id;


--
-- TOC entry 246 (class 1259 OID 43048)
-- Name: compras; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.compras (
    id integer NOT NULL,
    fornecedor_id integer,
    datahora timestamp without time zone NOT NULL,
    danfes integer,
    valor_extra numeric DEFAULT 0.0 NOT NULL,
    transacao integer,
    totaltributos numeric(10,4) DEFAULT 0 NOT NULL,
    totalfrete numeric(10,4) DEFAULT 0 NOT NULL,
    totalseguro numeric(10,4) DEFAULT 0 NOT NULL,
    totaldesconto numeric(10,4) DEFAULT 0 NOT NULL,
    total numeric(10,4) NOT NULL
);


ALTER TABLE public.compras OWNER TO lucasgueiros;

--
-- TOC entry 244 (class 1259 OID 43037)
-- Name: compras_danfes; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.compras_danfes (
    id integer NOT NULL,
    danfe bytea NOT NULL,
    codigodeacesso numeric(50,0) NOT NULL,
    codigouf numeric(2,0) DEFAULT 26 NOT NULL,
    datahoraemissao timestamp without time zone NOT NULL
);


ALTER TABLE public.compras_danfes OWNER TO lucasgueiros;

--
-- TOC entry 245 (class 1259 OID 43046)
-- Name: compras_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.compras_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 245
-- Name: compras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.compras_id_seq OWNED BY public.compras.id;


--
-- TOC entry 243 (class 1259 OID 43035)
-- Name: danfes_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.danfes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.danfes_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 243
-- Name: danfes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.danfes_id_seq OWNED BY public.compras_danfes.id;


--
-- TOC entry 253 (class 1259 OID 43153)
-- Name: dia_de_producao_movimentacoes_estoque; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.dia_de_producao_movimentacoes_estoque (
    dia_de_producao_id integer NOT NULL,
    movimentacao_estoque_id integer NOT NULL
);


ALTER TABLE public.dia_de_producao_movimentacoes_estoque OWNER TO lucasgueiros;

--
-- TOC entry 250 (class 1259 OID 43103)
-- Name: dias_de_producao; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.dias_de_producao (
    id integer NOT NULL,
    data date NOT NULL,
    comentario text
);


ALTER TABLE public.dias_de_producao OWNER TO lucasgueiros;

--
-- TOC entry 249 (class 1259 OID 43101)
-- Name: dias_de_producao_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.dias_de_producao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dias_de_producao_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3320 (class 0 OID 0)
-- Dependencies: 249
-- Name: dias_de_producao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.dias_de_producao_id_seq OWNED BY public.dias_de_producao.id;


--
-- TOC entry 226 (class 1259 OID 42787)
-- Name: formas_de_contato; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.formas_de_contato (
    id integer NOT NULL,
    forma character varying(20) NOT NULL
);


ALTER TABLE public.formas_de_contato OWNER TO lucasgueiros;

--
-- TOC entry 225 (class 1259 OID 42785)
-- Name: formas_de_contato_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.formas_de_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formas_de_contato_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3323 (class 0 OID 0)
-- Dependencies: 225
-- Name: formas_de_contato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.formas_de_contato_id_seq OWNED BY public.formas_de_contato.id;


--
-- TOC entry 228 (class 1259 OID 42841)
-- Name: formas_de_pagamento; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.formas_de_pagamento (
    id integer NOT NULL,
    forma character varying(20) NOT NULL
);


ALTER TABLE public.formas_de_pagamento OWNER TO lucasgueiros;

--
-- TOC entry 227 (class 1259 OID 42839)
-- Name: formas_de_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.formas_de_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.formas_de_pagamento_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3326 (class 0 OID 0)
-- Dependencies: 227
-- Name: formas_de_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.formas_de_pagamento_id_seq OWNED BY public.formas_de_pagamento.id;


--
-- TOC entry 271 (class 1259 OID 92606)
-- Name: fornecedorcontato; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.fornecedorcontato (
    fornecedor integer NOT NULL,
    contato integer NOT NULL
);


ALTER TABLE public.fornecedorcontato OWNER TO lucasgueiros;

--
-- TOC entry 270 (class 1259 OID 92577)
-- Name: fornecedorendereco; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.fornecedorendereco (
    fornecedor integer NOT NULL,
    endereco integer NOT NULL
);


ALTER TABLE public.fornecedorendereco OWNER TO lucasgueiros;

--
-- TOC entry 242 (class 1259 OID 43024)
-- Name: fornecedores; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.fornecedores (
    id integer NOT NULL,
    fornecedor character varying(100) NOT NULL,
    comentario text,
    cnpj character varying(30)
);


ALTER TABLE public.fornecedores OWNER TO lucasgueiros;

--
-- TOC entry 241 (class 1259 OID 43022)
-- Name: fornecedores_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.fornecedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fornecedores_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3331 (class 0 OID 0)
-- Dependencies: 241
-- Name: fornecedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.fornecedores_id_seq OWNED BY public.fornecedores.id;


--
-- TOC entry 206 (class 1259 OID 33744)
-- Name: insumos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.insumos (
    id integer NOT NULL,
    insumo character varying(100) NOT NULL,
    unidade integer NOT NULL,
    comentario text,
    preco numeric(15,5),
    CONSTRAINT insumos_preco_check CHECK ((preco >= 0.0))
);


ALTER TABLE public.insumos OWNER TO lucasgueiros;

--
-- TOC entry 267 (class 1259 OID 92510)
-- Name: insumos_equi; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.insumos_equi (
    insumo_a integer NOT NULL,
    insumo_b integer NOT NULL,
    unidade_a integer NOT NULL,
    unidade_b integer NOT NULL,
    proporcao numeric(10,4) NOT NULL
);


ALTER TABLE public.insumos_equi OWNER TO lucasgueiros;

--
-- TOC entry 205 (class 1259 OID 33742)
-- Name: insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 205
-- Name: insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.insumos_id_seq OWNED BY public.insumos.id;


--
-- TOC entry 211 (class 1259 OID 33943)
-- Name: insumos_quantidade; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.insumos_quantidade (
    id integer NOT NULL,
    insumo_id integer,
    quantidade numeric(10,4) NOT NULL,
    unidade integer,
    comentario text,
    produto_id integer
);


ALTER TABLE public.insumos_quantidade OWNER TO lucasgueiros;

--
-- TOC entry 240 (class 1259 OID 43003)
-- Name: movimentacoes_estoque; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.movimentacoes_estoque (
    id integer NOT NULL,
    insumo_quantidade_id integer NOT NULL,
    datahora timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.movimentacoes_estoque OWNER TO lucasgueiros;

--
-- TOC entry 239 (class 1259 OID 43001)
-- Name: movimentacoes_estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.movimentacoes_estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimentacoes_estoque_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 239
-- Name: movimentacoes_estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.movimentacoes_estoque_id_seq OWNED BY public.movimentacoes_estoque.id;


--
-- TOC entry 257 (class 1259 OID 43254)
-- Name: pedido_comprovante; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.pedido_comprovante (
    id integer NOT NULL,
    comprovante bytea NOT NULL,
    pedido_id integer NOT NULL
);


ALTER TABLE public.pedido_comprovante OWNER TO lucasgueiros;

--
-- TOC entry 256 (class 1259 OID 43252)
-- Name: pedido_comprovante_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.pedido_comprovante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_comprovante_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3342 (class 0 OID 0)
-- Dependencies: 256
-- Name: pedido_comprovante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.pedido_comprovante_id_seq OWNED BY public.pedido_comprovante.id;


--
-- TOC entry 238 (class 1259 OID 42984)
-- Name: pedido_itens; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.pedido_itens (
    pedido_id integer NOT NULL,
    produto_id integer NOT NULL,
    quantidade numeric(10,4) DEFAULT 1 NOT NULL,
    pedido_itens_id integer NOT NULL,
    comentarios character varying(200),
    CONSTRAINT pedido_itens_quantidade_check CHECK ((quantidade > (0)::numeric))
);


ALTER TABLE public.pedido_itens OWNER TO lucasgueiros;

--
-- TOC entry 254 (class 1259 OID 43234)
-- Name: pedido_itens_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.pedido_itens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_itens_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3345 (class 0 OID 0)
-- Dependencies: 254
-- Name: pedido_itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.pedido_itens_id_seq OWNED BY public.pedido_itens.pedido_itens_id;


--
-- TOC entry 261 (class 1259 OID 43327)
-- Name: produto_precos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produto_precos (
    id integer NOT NULL,
    produto_id integer NOT NULL,
    preco numeric(10,4) NOT NULL,
    data date DEFAULT now() NOT NULL
);


ALTER TABLE public.produto_precos OWNER TO lucasgueiros;

--
-- TOC entry 260 (class 1259 OID 43325)
-- Name: pedido_precos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.pedido_precos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_precos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 260
-- Name: pedido_precos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.pedido_precos_id_seq OWNED BY public.produto_precos.id;


--
-- TOC entry 237 (class 1259 OID 42945)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.pedidos (
    id integer NOT NULL,
    troco_para numeric,
    forma_de_pagamento integer,
    comentarios text,
    cliente_id integer NOT NULL,
    endereco_entrega integer,
    datahora_entrega timestamp without time zone DEFAULT now() NOT NULL,
    datahora_feito timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pedidos OWNER TO lucasgueiros;

--
-- TOC entry 236 (class 1259 OID 42943)
-- Name: pedidos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.pedidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedidos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 236
-- Name: pedidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.pedidos_id_seq OWNED BY public.pedidos.id;


--
-- TOC entry 224 (class 1259 OID 34583)
-- Name: produto_imagem; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produto_imagem (
    produto_id integer NOT NULL,
    imagem bytea NOT NULL
);


ALTER TABLE public.produto_imagem OWNER TO lucasgueiros;

--
-- TOC entry 263 (class 1259 OID 76148)
-- Name: produto_insumos_quantidade; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produto_insumos_quantidade (
    produto_id integer NOT NULL,
    insumo_quantidade_id integer NOT NULL,
    is_receita boolean DEFAULT false NOT NULL
);


ALTER TABLE public.produto_insumos_quantidade OWNER TO lucasgueiros;

--
-- TOC entry 215 (class 1259 OID 34016)
-- Name: produtos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    data date DEFAULT CURRENT_DATE NOT NULL,
    descricao character varying(500),
    comentarios text
);


ALTER TABLE public.produtos OWNER TO lucasgueiros;

--
-- TOC entry 266 (class 1259 OID 84331)
-- Name: produtos_categorias; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produtos_categorias (
    produto integer NOT NULL,
    categoria integer NOT NULL
);


ALTER TABLE public.produtos_categorias OWNER TO lucasgueiros;

--
-- TOC entry 216 (class 1259 OID 34028)
-- Name: produtos_harmonizacao; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.produtos_harmonizacao (
    produto_a integer NOT NULL,
    produto_b integer NOT NULL
);


ALTER TABLE public.produtos_harmonizacao OWNER TO lucasgueiros;

--
-- TOC entry 214 (class 1259 OID 34014)
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produtos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 214
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- TOC entry 213 (class 1259 OID 33971)
-- Name: receita_etapas; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.receita_etapas (
    id integer NOT NULL,
    receita_id integer,
    ordem integer NOT NULL,
    descricao text NOT NULL,
    CONSTRAINT receita_etapas_ordem_check CHECK ((ordem > 0))
);


ALTER TABLE public.receita_etapas OWNER TO lucasgueiros;

--
-- TOC entry 212 (class 1259 OID 33969)
-- Name: receita_etapas_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.receita_etapas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receita_etapas_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 212
-- Name: receita_etapas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.receita_etapas_id_seq OWNED BY public.receita_etapas.id;


--
-- TOC entry 209 (class 1259 OID 33926)
-- Name: receita_insumo_equi; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.receita_insumo_equi (
    insumo_id integer NOT NULL,
    receita_id integer NOT NULL
);


ALTER TABLE public.receita_insumo_equi OWNER TO lucasgueiros;

--
-- TOC entry 210 (class 1259 OID 33941)
-- Name: receita_insumos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.receita_insumos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receita_insumos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 210
-- Name: receita_insumos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.receita_insumos_id_seq OWNED BY public.insumos_quantidade.id;


--
-- TOC entry 262 (class 1259 OID 76122)
-- Name: receita_insumos_quantidade; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.receita_insumos_quantidade (
    receita_id integer NOT NULL,
    insumo_quantidade_id integer NOT NULL,
    ordem integer DEFAULT 1 NOT NULL,
    is_receita boolean DEFAULT false NOT NULL
);


ALTER TABLE public.receita_insumos_quantidade OWNER TO lucasgueiros;

--
-- TOC entry 208 (class 1259 OID 33894)
-- Name: receitas; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.receitas (
    id integer NOT NULL,
    nome character varying(200) NOT NULL,
    data date DEFAULT CURRENT_DATE NOT NULL,
    tempototal integer,
    tempoativo integer,
    rendimento numeric(10,4) NOT NULL,
    rendimento_uni integer NOT NULL,
    comentarios text,
    tempo_gas integer DEFAULT 0,
    gas_insumo integer DEFAULT 202,
    CONSTRAINT ct_gas_insumo CHECK (((gas_insumo > 200) AND (gas_insumo < 204))),
    CONSTRAINT ct_tempo_total_maior_que_ativo CHECK ((tempototal >= tempoativo)),
    CONSTRAINT receitas_tempoativo_check CHECK ((tempoativo > 0))
);


ALTER TABLE public.receitas OWNER TO lucasgueiros;

--
-- TOC entry 207 (class 1259 OID 33892)
-- Name: receitas_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.receitas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receitas_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 207
-- Name: receitas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.receitas_id_seq OWNED BY public.receitas.id;


--
-- TOC entry 252 (class 1259 OID 43119)
-- Name: receitas_produzidas; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.receitas_produzidas (
    id integer NOT NULL,
    receita_id integer NOT NULL,
    quantidade numeric NOT NULL,
    unidade_id integer NOT NULL,
    comentario text,
    dia_de_producao_id integer
);


ALTER TABLE public.receitas_produzidas OWNER TO lucasgueiros;

--
-- TOC entry 251 (class 1259 OID 43117)
-- Name: receitas_produzidas_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.receitas_produzidas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.receitas_produzidas_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 251
-- Name: receitas_produzidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.receitas_produzidas_id_seq OWNED BY public.receitas_produzidas.id;


--
-- TOC entry 221 (class 1259 OID 34476)
-- Name: tipo_de_transacao; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.tipo_de_transacao (
    id integer NOT NULL,
    tipo character varying(20) NOT NULL
);


ALTER TABLE public.tipo_de_transacao OWNER TO lucasgueiros;

--
-- TOC entry 220 (class 1259 OID 34474)
-- Name: tipo_de_transacao_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.tipo_de_transacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_de_transacao_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 220
-- Name: tipo_de_transacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.tipo_de_transacao_id_seq OWNED BY public.tipo_de_transacao.id;


--
-- TOC entry 259 (class 1259 OID 43302)
-- Name: tipos_de_enderecos; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.tipos_de_enderecos (
    id integer NOT NULL,
    tipo character varying(30) NOT NULL
);


ALTER TABLE public.tipos_de_enderecos OWNER TO lucasgueiros;

--
-- TOC entry 258 (class 1259 OID 43300)
-- Name: tipos_de_enderecos_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.tipos_de_enderecos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_de_enderecos_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3377 (class 0 OID 0)
-- Dependencies: 258
-- Name: tipos_de_enderecos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.tipos_de_enderecos_id_seq OWNED BY public.tipos_de_enderecos.id;


--
-- TOC entry 223 (class 1259 OID 34502)
-- Name: transacoes; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.transacoes (
    id integer NOT NULL,
    valor numeric(15,3) NOT NULL,
    data date DEFAULT CURRENT_DATE NOT NULL,
    tipo integer NOT NULL,
    comentario text
);


ALTER TABLE public.transacoes OWNER TO lucasgueiros;

--
-- TOC entry 222 (class 1259 OID 34500)
-- Name: transacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.transacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transacoes_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3380 (class 0 OID 0)
-- Dependencies: 222
-- Name: transacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.transacoes_id_seq OWNED BY public.transacoes.id;


--
-- TOC entry 203 (class 1259 OID 33714)
-- Name: unidades; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.unidades (
    id integer NOT NULL,
    unidade character varying(10) NOT NULL
);


ALTER TABLE public.unidades OWNER TO lucasgueiros;

--
-- TOC entry 204 (class 1259 OID 33722)
-- Name: unidades_equi; Type: TABLE; Schema: public; Owner: lucasgueiros
--

CREATE TABLE public.unidades_equi (
    unidade_a integer NOT NULL,
    unidade_b integer NOT NULL,
    proporcao numeric NOT NULL,
    CONSTRAINT unidades_equi_check CHECK ((unidade_a <> unidade_b)),
    CONSTRAINT unidades_equi_proporcao_check CHECK ((proporcao > 0.0))
);


ALTER TABLE public.unidades_equi OWNER TO lucasgueiros;

--
-- TOC entry 202 (class 1259 OID 33712)
-- Name: unidades_id_seq; Type: SEQUENCE; Schema: public; Owner: lucasgueiros
--

CREATE SEQUENCE public.unidades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidades_id_seq OWNER TO lucasgueiros;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 202
-- Name: unidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lucasgueiros
--

ALTER SEQUENCE public.unidades_id_seq OWNED BY public.unidades.id;


--
-- TOC entry 2944 (class 2604 OID 43245)
-- Name: cardapio_produtos cardapio_produtos_id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapio_produtos ALTER COLUMN cardapio_produtos_id SET DEFAULT nextval('public.cardapio_produtos_id_seq'::regclass);


--
-- TOC entry 2943 (class 2604 OID 34094)
-- Name: cardapios cardapios_id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapios ALTER COLUMN cardapios_id SET DEFAULT nextval('public.cardapios_id_seq'::regclass);


--
-- TOC entry 2986 (class 2604 OID 84326)
-- Name: categorias_de_produtos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.categorias_de_produtos ALTER COLUMN id SET DEFAULT nextval('public.categorias_de_produtos_id_seq'::regclass);


--
-- TOC entry 2951 (class 2604 OID 42892)
-- Name: cliente_contatos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_contatos ALTER COLUMN id SET DEFAULT nextval('public.cliente_contatos_id_seq'::regclass);


--
-- TOC entry 2953 (class 2604 OID 42910)
-- Name: cliente_enderecos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_enderecos ALTER COLUMN id SET DEFAULT nextval('public.cliente_enderecos_id_seq'::regclass);


--
-- TOC entry 2950 (class 2604 OID 42882)
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- TOC entry 2976 (class 2604 OID 43083)
-- Name: compra_itens id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compra_itens ALTER COLUMN id SET DEFAULT nextval('public.compra_itens_id_seq'::regclass);


--
-- TOC entry 2970 (class 2604 OID 43051)
-- Name: compras id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras ALTER COLUMN id SET DEFAULT nextval('public.compras_id_seq'::regclass);


--
-- TOC entry 2968 (class 2604 OID 43040)
-- Name: compras_danfes id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras_danfes ALTER COLUMN id SET DEFAULT nextval('public.danfes_id_seq'::regclass);


--
-- TOC entry 2977 (class 2604 OID 43106)
-- Name: dias_de_producao id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.dias_de_producao ALTER COLUMN id SET DEFAULT nextval('public.dias_de_producao_id_seq'::regclass);


--
-- TOC entry 2948 (class 2604 OID 42790)
-- Name: formas_de_contato id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_contato ALTER COLUMN id SET DEFAULT nextval('public.formas_de_contato_id_seq'::regclass);


--
-- TOC entry 2949 (class 2604 OID 42844)
-- Name: formas_de_pagamento id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_pagamento ALTER COLUMN id SET DEFAULT nextval('public.formas_de_pagamento_id_seq'::regclass);


--
-- TOC entry 2967 (class 2604 OID 43027)
-- Name: fornecedores id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedores ALTER COLUMN id SET DEFAULT nextval('public.fornecedores_id_seq'::regclass);


--
-- TOC entry 2929 (class 2604 OID 33747)
-- Name: insumos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos ALTER COLUMN id SET DEFAULT nextval('public.insumos_id_seq'::regclass);


--
-- TOC entry 2938 (class 2604 OID 33946)
-- Name: insumos_quantidade id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_quantidade ALTER COLUMN id SET DEFAULT nextval('public.receita_insumos_id_seq'::regclass);


--
-- TOC entry 2965 (class 2604 OID 43006)
-- Name: movimentacoes_estoque id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.movimentacoes_estoque ALTER COLUMN id SET DEFAULT nextval('public.movimentacoes_estoque_id_seq'::regclass);


--
-- TOC entry 2979 (class 2604 OID 43257)
-- Name: pedido_comprovante id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_comprovante ALTER COLUMN id SET DEFAULT nextval('public.pedido_comprovante_id_seq'::regclass);


--
-- TOC entry 2962 (class 2604 OID 43236)
-- Name: pedido_itens pedido_itens_id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_itens ALTER COLUMN pedido_itens_id SET DEFAULT nextval('public.pedido_itens_id_seq'::regclass);


--
-- TOC entry 2959 (class 2604 OID 42948)
-- Name: pedidos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id SET DEFAULT nextval('public.pedidos_id_seq'::regclass);


--
-- TOC entry 2981 (class 2604 OID 43330)
-- Name: produto_precos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_precos ALTER COLUMN id SET DEFAULT nextval('public.pedido_precos_id_seq'::regclass);


--
-- TOC entry 2941 (class 2604 OID 34019)
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- TOC entry 2939 (class 2604 OID 33974)
-- Name: receita_etapas id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_etapas ALTER COLUMN id SET DEFAULT nextval('public.receita_etapas_id_seq'::regclass);


--
-- TOC entry 2931 (class 2604 OID 33897)
-- Name: receitas id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas ALTER COLUMN id SET DEFAULT nextval('public.receitas_id_seq'::regclass);


--
-- TOC entry 2978 (class 2604 OID 43122)
-- Name: receitas_produzidas id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas_produzidas ALTER COLUMN id SET DEFAULT nextval('public.receitas_produzidas_id_seq'::regclass);


--
-- TOC entry 2945 (class 2604 OID 34479)
-- Name: tipo_de_transacao id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipo_de_transacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_de_transacao_id_seq'::regclass);


--
-- TOC entry 2980 (class 2604 OID 43305)
-- Name: tipos_de_enderecos id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipos_de_enderecos ALTER COLUMN id SET DEFAULT nextval('public.tipos_de_enderecos_id_seq'::regclass);


--
-- TOC entry 2946 (class 2604 OID 34505)
-- Name: transacoes id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.transacoes ALTER COLUMN id SET DEFAULT nextval('public.transacoes_id_seq'::regclass);


--
-- TOC entry 2926 (class 2604 OID 33717)
-- Name: unidades id; Type: DEFAULT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades ALTER COLUMN id SET DEFAULT nextval('public.unidades_id_seq'::regclass);


--
-- TOC entry 3018 (class 2606 OID 43247)
-- Name: cardapio_produtos cardapio_produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapio_produtos
    ADD CONSTRAINT cardapio_produtos_pkey PRIMARY KEY (cardapio_produtos_id);


--
-- TOC entry 3014 (class 2606 OID 34101)
-- Name: cardapios cardapios_descricao_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapios
    ADD CONSTRAINT cardapios_descricao_key UNIQUE (nome);


--
-- TOC entry 3016 (class 2606 OID 34099)
-- Name: cardapios cardapios_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapios
    ADD CONSTRAINT cardapios_pkey PRIMARY KEY (cardapios_id);


--
-- TOC entry 3084 (class 2606 OID 84330)
-- Name: categorias_de_produtos categorias_de_produtos_categoria_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.categorias_de_produtos
    ADD CONSTRAINT categorias_de_produtos_categoria_key UNIQUE (categoria);


--
-- TOC entry 3086 (class 2606 OID 84328)
-- Name: categorias_de_produtos categorias_de_produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.categorias_de_produtos
    ADD CONSTRAINT categorias_de_produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3040 (class 2606 OID 43358)
-- Name: cliente_contatos cliente_contatos_cliente_id_nome_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_contatos
    ADD CONSTRAINT cliente_contatos_cliente_id_nome_key UNIQUE (cliente_id, nome);


--
-- TOC entry 3042 (class 2606 OID 42894)
-- Name: cliente_contatos cliente_contatos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_contatos
    ADD CONSTRAINT cliente_contatos_pkey PRIMARY KEY (id);


--
-- TOC entry 3044 (class 2606 OID 43356)
-- Name: cliente_enderecos cliente_enderecos_cliente_id_nome_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT cliente_enderecos_cliente_id_nome_key UNIQUE (cliente_id, nome);


--
-- TOC entry 3046 (class 2606 OID 42915)
-- Name: cliente_enderecos cliente_enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT cliente_enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3048 (class 2606 OID 42925)
-- Name: cliente_preferencias cliente_preferencias_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_preferencias
    ADD CONSTRAINT cliente_preferencias_pkey PRIMARY KEY (cliente_id);


--
-- TOC entry 3090 (class 2606 OID 92551)
-- Name: clientecontatos clientecontatos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientecontatos
    ADD CONSTRAINT clientecontatos_pkey PRIMARY KEY (cliente, contato);


--
-- TOC entry 3092 (class 2606 OID 92566)
-- Name: clienteenderecos clienteenderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clienteenderecos
    ADD CONSTRAINT clienteenderecos_pkey PRIMARY KEY (cliente, endereco);


--
-- TOC entry 3036 (class 2606 OID 43364)
-- Name: clientes clientes_nome_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_nome_key UNIQUE (nome);


--
-- TOC entry 3038 (class 2606 OID 42884)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- TOC entry 3064 (class 2606 OID 43085)
-- Name: compra_itens compra_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compra_itens
    ADD CONSTRAINT compra_itens_pkey PRIMARY KEY (id);


--
-- TOC entry 3062 (class 2606 OID 43057)
-- Name: compras compras_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (id);


--
-- TOC entry 3060 (class 2606 OID 43045)
-- Name: compras_danfes danfes_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras_danfes
    ADD CONSTRAINT danfes_pkey PRIMARY KEY (id);


--
-- TOC entry 3066 (class 2606 OID 43111)
-- Name: dias_de_producao dias_de_producao_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.dias_de_producao
    ADD CONSTRAINT dias_de_producao_pkey PRIMARY KEY (id);


--
-- TOC entry 3028 (class 2606 OID 42794)
-- Name: formas_de_contato formas_de_contato_forma_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_contato
    ADD CONSTRAINT formas_de_contato_forma_key UNIQUE (forma);


--
-- TOC entry 3030 (class 2606 OID 42792)
-- Name: formas_de_contato formas_de_contato_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_contato
    ADD CONSTRAINT formas_de_contato_pkey PRIMARY KEY (id);


--
-- TOC entry 3032 (class 2606 OID 42848)
-- Name: formas_de_pagamento formas_de_pagamento_forma_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_pagamento
    ADD CONSTRAINT formas_de_pagamento_forma_key UNIQUE (forma);


--
-- TOC entry 3034 (class 2606 OID 42846)
-- Name: formas_de_pagamento formas_de_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.formas_de_pagamento
    ADD CONSTRAINT formas_de_pagamento_pkey PRIMARY KEY (id);


--
-- TOC entry 3096 (class 2606 OID 92610)
-- Name: fornecedorcontato fornecedorcontato_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorcontato
    ADD CONSTRAINT fornecedorcontato_pkey PRIMARY KEY (fornecedor, contato);


--
-- TOC entry 3094 (class 2606 OID 92581)
-- Name: fornecedorendereco fornecedorendereco_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorendereco
    ADD CONSTRAINT fornecedorendereco_pkey PRIMARY KEY (fornecedor, endereco);


--
-- TOC entry 3056 (class 2606 OID 43034)
-- Name: fornecedores fornecedores_fornecedor_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_fornecedor_key UNIQUE (fornecedor);


--
-- TOC entry 3058 (class 2606 OID 43032)
-- Name: fornecedores fornecedores_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedores
    ADD CONSTRAINT fornecedores_pkey PRIMARY KEY (id);


--
-- TOC entry 2994 (class 2606 OID 33755)
-- Name: insumos insumos_insumo_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT insumos_insumo_key UNIQUE (insumo);


--
-- TOC entry 2996 (class 2606 OID 33753)
-- Name: insumos insumos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT insumos_pkey PRIMARY KEY (id);


--
-- TOC entry 3054 (class 2606 OID 43011)
-- Name: movimentacoes_estoque movimentacoes_estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.movimentacoes_estoque
    ADD CONSTRAINT movimentacoes_estoque_pkey PRIMARY KEY (id);


--
-- TOC entry 3072 (class 2606 OID 43262)
-- Name: pedido_comprovante pedido_comprovante_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_comprovante
    ADD CONSTRAINT pedido_comprovante_pkey PRIMARY KEY (id);


--
-- TOC entry 3052 (class 2606 OID 43238)
-- Name: pedido_itens pedido_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_itens
    ADD CONSTRAINT pedido_itens_pkey PRIMARY KEY (pedido_itens_id);


--
-- TOC entry 3078 (class 2606 OID 43333)
-- Name: produto_precos pedido_precos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_precos
    ADD CONSTRAINT pedido_precos_pkey PRIMARY KEY (id);


--
-- TOC entry 3050 (class 2606 OID 42955)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id);


--
-- TOC entry 3070 (class 2606 OID 43157)
-- Name: dia_de_producao_movimentacoes_estoque pk_dia_de_producao_movimentacoes_estoque; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.dia_de_producao_movimentacoes_estoque
    ADD CONSTRAINT pk_dia_de_producao_movimentacoes_estoque PRIMARY KEY (dia_de_producao_id, movimentacao_estoque_id);


--
-- TOC entry 3002 (class 2606 OID 33930)
-- Name: receita_insumo_equi pk_receita_insumo_equi; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumo_equi
    ADD CONSTRAINT pk_receita_insumo_equi PRIMARY KEY (insumo_id, receita_id);


--
-- TOC entry 2992 (class 2606 OID 33731)
-- Name: unidades_equi pk_unidades_equi; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades_equi
    ADD CONSTRAINT pk_unidades_equi PRIMARY KEY (unidade_a, unidade_b);


--
-- TOC entry 3026 (class 2606 OID 42776)
-- Name: produto_imagem produto_imagem_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_imagem
    ADD CONSTRAINT produto_imagem_pkey PRIMARY KEY (produto_id);


--
-- TOC entry 3082 (class 2606 OID 76152)
-- Name: produto_insumos_quantidade produto_insumos_quantidade_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_insumos_quantidade
    ADD CONSTRAINT produto_insumos_quantidade_pkey PRIMARY KEY (produto_id, insumo_quantidade_id);


--
-- TOC entry 3088 (class 2606 OID 84335)
-- Name: produtos_categorias produtos_categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_categorias
    ADD CONSTRAINT produtos_categorias_pkey PRIMARY KEY (produto, categoria);


--
-- TOC entry 3012 (class 2606 OID 34032)
-- Name: produtos_harmonizacao produtos_harmonizacao_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_harmonizacao
    ADD CONSTRAINT produtos_harmonizacao_pkey PRIMARY KEY (produto_a, produto_b);


--
-- TOC entry 3008 (class 2606 OID 34027)
-- Name: produtos produtos_nome_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_nome_key UNIQUE (nome);


--
-- TOC entry 3010 (class 2606 OID 34025)
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- TOC entry 3006 (class 2606 OID 33980)
-- Name: receita_etapas receita_etapas_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_etapas
    ADD CONSTRAINT receita_etapas_pkey PRIMARY KEY (id);


--
-- TOC entry 3004 (class 2606 OID 33953)
-- Name: insumos_quantidade receita_insumos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_quantidade
    ADD CONSTRAINT receita_insumos_pkey PRIMARY KEY (id);


--
-- TOC entry 3080 (class 2606 OID 76126)
-- Name: receita_insumos_quantidade receita_insumos_quantidade_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumos_quantidade
    ADD CONSTRAINT receita_insumos_quantidade_pkey PRIMARY KEY (receita_id, insumo_quantidade_id);


--
-- TOC entry 2998 (class 2606 OID 33905)
-- Name: receitas receitas_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT receitas_pkey PRIMARY KEY (id);


--
-- TOC entry 3000 (class 2606 OID 33907)
-- Name: receitas receitas_produto_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT receitas_produto_key UNIQUE (nome);


--
-- TOC entry 3068 (class 2606 OID 43127)
-- Name: receitas_produzidas receitas_produzidas_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas_produzidas
    ADD CONSTRAINT receitas_produzidas_pkey PRIMARY KEY (id);


--
-- TOC entry 3020 (class 2606 OID 34481)
-- Name: tipo_de_transacao tipo_de_transacao_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipo_de_transacao
    ADD CONSTRAINT tipo_de_transacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3022 (class 2606 OID 34483)
-- Name: tipo_de_transacao tipo_de_transacao_tipo_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipo_de_transacao
    ADD CONSTRAINT tipo_de_transacao_tipo_key UNIQUE (tipo);


--
-- TOC entry 3074 (class 2606 OID 43307)
-- Name: tipos_de_enderecos tipos_de_enderecos_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipos_de_enderecos
    ADD CONSTRAINT tipos_de_enderecos_pkey PRIMARY KEY (id);


--
-- TOC entry 3076 (class 2606 OID 43311)
-- Name: tipos_de_enderecos tipos_de_enderecos_tipo_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.tipos_de_enderecos
    ADD CONSTRAINT tipos_de_enderecos_tipo_key UNIQUE (tipo);


--
-- TOC entry 3024 (class 2606 OID 34510)
-- Name: transacoes transacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.transacoes
    ADD CONSTRAINT transacoes_pkey PRIMARY KEY (id);


--
-- TOC entry 2988 (class 2606 OID 33719)
-- Name: unidades unidades_pkey; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_pkey PRIMARY KEY (id);


--
-- TOC entry 2990 (class 2606 OID 33721)
-- Name: unidades unidades_unidade_key; Type: CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades
    ADD CONSTRAINT unidades_unidade_key UNIQUE (unidade);


--
-- TOC entry 3110 (class 2606 OID 34111)
-- Name: cardapio_produtos cardapio_produtos_cardapio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapio_produtos
    ADD CONSTRAINT cardapio_produtos_cardapio_id_fkey FOREIGN KEY (cardapio_id) REFERENCES public.cardapios(cardapios_id) ON DELETE CASCADE;


--
-- TOC entry 3111 (class 2606 OID 34116)
-- Name: cardapio_produtos cardapio_produtos_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cardapio_produtos
    ADD CONSTRAINT cardapio_produtos_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3114 (class 2606 OID 42895)
-- Name: cliente_contatos cliente_contatos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_contatos
    ADD CONSTRAINT cliente_contatos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 3115 (class 2606 OID 42900)
-- Name: cliente_contatos cliente_contatos_forma_de_contato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_contatos
    ADD CONSTRAINT cliente_contatos_forma_de_contato_fkey FOREIGN KEY (forma_de_contato) REFERENCES public.formas_de_contato(id) ON DELETE CASCADE;


--
-- TOC entry 3116 (class 2606 OID 42916)
-- Name: cliente_enderecos cliente_enderecos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT cliente_enderecos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 3117 (class 2606 OID 43313)
-- Name: cliente_enderecos cliente_enderecos_tipo_de_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_enderecos
    ADD CONSTRAINT cliente_enderecos_tipo_de_endereco_fkey FOREIGN KEY (tipo_de_endereco) REFERENCES public.tipos_de_enderecos(id);


--
-- TOC entry 3118 (class 2606 OID 42926)
-- Name: cliente_preferencias cliente_preferencias_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_preferencias
    ADD CONSTRAINT cliente_preferencias_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 3120 (class 2606 OID 42936)
-- Name: cliente_preferencias cliente_preferencias_contato_preferencial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_preferencias
    ADD CONSTRAINT cliente_preferencias_contato_preferencial_fkey FOREIGN KEY (contato_preferencial) REFERENCES public.cliente_contatos(id);


--
-- TOC entry 3119 (class 2606 OID 42931)
-- Name: cliente_preferencias cliente_preferencias_endereco_preferencial_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.cliente_preferencias
    ADD CONSTRAINT cliente_preferencias_endereco_preferencial_fkey FOREIGN KEY (endereco_preferencial) REFERENCES public.cliente_enderecos(id);


--
-- TOC entry 3149 (class 2606 OID 92552)
-- Name: clientecontatos clientecontatos_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientecontatos
    ADD CONSTRAINT clientecontatos_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3150 (class 2606 OID 92557)
-- Name: clientecontatos clientecontatos_contato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clientecontatos
    ADD CONSTRAINT clientecontatos_contato_fkey FOREIGN KEY (contato) REFERENCES public.cliente_contatos(id);


--
-- TOC entry 3151 (class 2606 OID 92567)
-- Name: clienteenderecos clienteenderecos_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clienteenderecos
    ADD CONSTRAINT clienteenderecos_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.clientes(id);


--
-- TOC entry 3152 (class 2606 OID 92572)
-- Name: clienteenderecos clienteenderecos_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.clienteenderecos
    ADD CONSTRAINT clienteenderecos_endereco_fkey FOREIGN KEY (endereco) REFERENCES public.cliente_enderecos(id);


--
-- TOC entry 3130 (class 2606 OID 43086)
-- Name: compra_itens compra_itens_compra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compra_itens
    ADD CONSTRAINT compra_itens_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES public.compras(id) ON DELETE CASCADE;


--
-- TOC entry 3131 (class 2606 OID 76174)
-- Name: compra_itens compra_itens_movimentacao_estoque_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compra_itens
    ADD CONSTRAINT compra_itens_movimentacao_estoque_id_fkey FOREIGN KEY (movimentacao_estoque_id) REFERENCES public.movimentacoes_estoque(id);


--
-- TOC entry 3128 (class 2606 OID 43063)
-- Name: compras compras_danfes_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_danfes_fkey FOREIGN KEY (danfes) REFERENCES public.compras_danfes(id) ON DELETE RESTRICT;


--
-- TOC entry 3127 (class 2606 OID 43058)
-- Name: compras compras_fornecedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_fornecedor_id_fkey FOREIGN KEY (fornecedor_id) REFERENCES public.fornecedores(id) ON DELETE RESTRICT;


--
-- TOC entry 3129 (class 2606 OID 43068)
-- Name: compras compras_transacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.compras
    ADD CONSTRAINT compras_transacao_fkey FOREIGN KEY (transacao) REFERENCES public.transacoes(id);


--
-- TOC entry 3136 (class 2606 OID 43163)
-- Name: dia_de_producao_movimentacoes_estoque dia_de_producao_movimentacoes_esto_movimentacao_estoque_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.dia_de_producao_movimentacoes_estoque
    ADD CONSTRAINT dia_de_producao_movimentacoes_esto_movimentacao_estoque_id_fkey FOREIGN KEY (movimentacao_estoque_id) REFERENCES public.movimentacoes_estoque(id) ON DELETE CASCADE;


--
-- TOC entry 3135 (class 2606 OID 43158)
-- Name: dia_de_producao_movimentacoes_estoque dia_de_producao_movimentacoes_estoque_dia_de_producao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.dia_de_producao_movimentacoes_estoque
    ADD CONSTRAINT dia_de_producao_movimentacoes_estoque_dia_de_producao_id_fkey FOREIGN KEY (dia_de_producao_id) REFERENCES public.dias_de_producao(id) ON DELETE CASCADE;


--
-- TOC entry 3155 (class 2606 OID 92616)
-- Name: fornecedorcontato fornecedorcontato_contato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorcontato
    ADD CONSTRAINT fornecedorcontato_contato_fkey FOREIGN KEY (contato) REFERENCES public.cliente_contatos(id);


--
-- TOC entry 3156 (class 2606 OID 92611)
-- Name: fornecedorcontato fornecedorcontato_fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorcontato
    ADD CONSTRAINT fornecedorcontato_fornecedor_fkey FOREIGN KEY (fornecedor) REFERENCES public.fornecedores(id);


--
-- TOC entry 3153 (class 2606 OID 92587)
-- Name: fornecedorendereco fornecedorendereco_endereco_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorendereco
    ADD CONSTRAINT fornecedorendereco_endereco_fkey FOREIGN KEY (endereco) REFERENCES public.cliente_enderecos(id);


--
-- TOC entry 3154 (class 2606 OID 92582)
-- Name: fornecedorendereco fornecedorendereco_fornecedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.fornecedorendereco
    ADD CONSTRAINT fornecedorendereco_fornecedor_fkey FOREIGN KEY (fornecedor) REFERENCES public.fornecedores(id);


--
-- TOC entry 3106 (class 2606 OID 76184)
-- Name: insumos_quantidade insumos_quantidade_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_quantidade
    ADD CONSTRAINT insumos_quantidade_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id);


--
-- TOC entry 3099 (class 2606 OID 33756)
-- Name: insumos insumos_unidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT insumos_unidade_fkey FOREIGN KEY (unidade) REFERENCES public.unidades(id) ON DELETE CASCADE;


--
-- TOC entry 3145 (class 2606 OID 92513)
-- Name: insumos_equi insumos_unidades_equi_insumo_a_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_equi
    ADD CONSTRAINT insumos_unidades_equi_insumo_a_fkey FOREIGN KEY (insumo_a) REFERENCES public.insumos(id);


--
-- TOC entry 3146 (class 2606 OID 92518)
-- Name: insumos_equi insumos_unidades_equi_insumo_b_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_equi
    ADD CONSTRAINT insumos_unidades_equi_insumo_b_fkey FOREIGN KEY (insumo_b) REFERENCES public.insumos(id);


--
-- TOC entry 3147 (class 2606 OID 92523)
-- Name: insumos_equi insumos_unidades_equi_unidade_a_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_equi
    ADD CONSTRAINT insumos_unidades_equi_unidade_a_fkey FOREIGN KEY (unidade_a) REFERENCES public.unidades(id);


--
-- TOC entry 3148 (class 2606 OID 92528)
-- Name: insumos_equi insumos_unidades_equi_unidade_b_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_equi
    ADD CONSTRAINT insumos_unidades_equi_unidade_b_fkey FOREIGN KEY (unidade_b) REFERENCES public.unidades(id);


--
-- TOC entry 3126 (class 2606 OID 76169)
-- Name: movimentacoes_estoque movimentacoes_estoque_insumo_quantidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.movimentacoes_estoque
    ADD CONSTRAINT movimentacoes_estoque_insumo_quantidade_id_fkey FOREIGN KEY (insumo_quantidade_id) REFERENCES public.insumos_quantidade(id);


--
-- TOC entry 3137 (class 2606 OID 43268)
-- Name: pedido_comprovante pedido_comprovante_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_comprovante
    ADD CONSTRAINT pedido_comprovante_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- TOC entry 3124 (class 2606 OID 42991)
-- Name: pedido_itens pedido_itens_pedido_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_itens
    ADD CONSTRAINT pedido_itens_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES public.pedidos(id) ON DELETE CASCADE;


--
-- TOC entry 3125 (class 2606 OID 42996)
-- Name: pedido_itens pedido_itens_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedido_itens
    ADD CONSTRAINT pedido_itens_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3122 (class 2606 OID 43284)
-- Name: pedidos pedidos_cliente_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES public.clientes(id) ON DELETE CASCADE;


--
-- TOC entry 3123 (class 2606 OID 43295)
-- Name: pedidos pedidos_endereco_entrega_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_endereco_entrega_fkey FOREIGN KEY (endereco_entrega) REFERENCES public.cliente_enderecos(id) ON DELETE CASCADE;


--
-- TOC entry 3121 (class 2606 OID 42966)
-- Name: pedidos pedidos_forma_de_pagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_forma_de_pagamento_fkey FOREIGN KEY (forma_de_pagamento) REFERENCES public.formas_de_pagamento(id) ON DELETE CASCADE;


--
-- TOC entry 3113 (class 2606 OID 34589)
-- Name: produto_imagem produto_imagem_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_imagem
    ADD CONSTRAINT produto_imagem_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3141 (class 2606 OID 76158)
-- Name: produto_insumos_quantidade produto_insumos_quantidade_insumo_quantidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_insumos_quantidade
    ADD CONSTRAINT produto_insumos_quantidade_insumo_quantidade_id_fkey FOREIGN KEY (insumo_quantidade_id) REFERENCES public.insumos_quantidade(id);


--
-- TOC entry 3142 (class 2606 OID 76153)
-- Name: produto_insumos_quantidade produto_insumos_quantidade_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_insumos_quantidade
    ADD CONSTRAINT produto_insumos_quantidade_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id);


--
-- TOC entry 3138 (class 2606 OID 43347)
-- Name: produto_precos produto_precos_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produto_precos
    ADD CONSTRAINT produto_precos_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3143 (class 2606 OID 84341)
-- Name: produtos_categorias produtos_categorias_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_categorias
    ADD CONSTRAINT produtos_categorias_categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categorias_de_produtos(id);


--
-- TOC entry 3144 (class 2606 OID 84336)
-- Name: produtos_categorias produtos_categorias_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_categorias
    ADD CONSTRAINT produtos_categorias_produto_fkey FOREIGN KEY (produto) REFERENCES public.produtos(id);


--
-- TOC entry 3108 (class 2606 OID 34033)
-- Name: produtos_harmonizacao produtos_harmonizacao_produto_a_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_harmonizacao
    ADD CONSTRAINT produtos_harmonizacao_produto_a_fkey FOREIGN KEY (produto_a) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3109 (class 2606 OID 34038)
-- Name: produtos_harmonizacao produtos_harmonizacao_produto_b_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.produtos_harmonizacao
    ADD CONSTRAINT produtos_harmonizacao_produto_b_fkey FOREIGN KEY (produto_b) REFERENCES public.produtos(id) ON DELETE CASCADE;


--
-- TOC entry 3107 (class 2606 OID 33981)
-- Name: receita_etapas receita_etapas_receita_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_etapas
    ADD CONSTRAINT receita_etapas_receita_id_fkey FOREIGN KEY (receita_id) REFERENCES public.receitas(id) ON DELETE CASCADE;


--
-- TOC entry 3102 (class 2606 OID 33931)
-- Name: receita_insumo_equi receita_insumo_equi_insumo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumo_equi
    ADD CONSTRAINT receita_insumo_equi_insumo_id_fkey FOREIGN KEY (insumo_id) REFERENCES public.insumos(id) ON DELETE CASCADE;


--
-- TOC entry 3103 (class 2606 OID 33936)
-- Name: receita_insumo_equi receita_insumo_equi_receita_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumo_equi
    ADD CONSTRAINT receita_insumo_equi_receita_id_fkey FOREIGN KEY (receita_id) REFERENCES public.receitas(id) ON DELETE CASCADE;


--
-- TOC entry 3104 (class 2606 OID 33954)
-- Name: insumos_quantidade receita_insumos_insumo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_quantidade
    ADD CONSTRAINT receita_insumos_insumo_id_fkey FOREIGN KEY (insumo_id) REFERENCES public.insumos(id) ON DELETE CASCADE;


--
-- TOC entry 3139 (class 2606 OID 76132)
-- Name: receita_insumos_quantidade receita_insumos_quantidade_insumo_quantidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumos_quantidade
    ADD CONSTRAINT receita_insumos_quantidade_insumo_quantidade_id_fkey FOREIGN KEY (insumo_quantidade_id) REFERENCES public.insumos_quantidade(id);


--
-- TOC entry 3140 (class 2606 OID 76127)
-- Name: receita_insumos_quantidade receita_insumos_quantidade_receita_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receita_insumos_quantidade
    ADD CONSTRAINT receita_insumos_quantidade_receita_id_fkey FOREIGN KEY (receita_id) REFERENCES public.receitas(id);


--
-- TOC entry 3105 (class 2606 OID 33964)
-- Name: insumos_quantidade receita_insumos_unidade_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.insumos_quantidade
    ADD CONSTRAINT receita_insumos_unidade_fkey FOREIGN KEY (unidade) REFERENCES public.unidades(id) ON DELETE RESTRICT;


--
-- TOC entry 3100 (class 2606 OID 34533)
-- Name: receitas receitas_gas_insumo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT receitas_gas_insumo_fkey FOREIGN KEY (gas_insumo) REFERENCES public.insumos(id) ON DELETE RESTRICT;


--
-- TOC entry 3134 (class 2606 OID 43169)
-- Name: receitas_produzidas receitas_produzidas_dia_de_producao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas_produzidas
    ADD CONSTRAINT receitas_produzidas_dia_de_producao_id_fkey FOREIGN KEY (dia_de_producao_id) REFERENCES public.dias_de_producao(id) ON DELETE RESTRICT;


--
-- TOC entry 3132 (class 2606 OID 43128)
-- Name: receitas_produzidas receitas_produzidas_receita_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas_produzidas
    ADD CONSTRAINT receitas_produzidas_receita_id_fkey FOREIGN KEY (receita_id) REFERENCES public.receitas(id) ON DELETE RESTRICT;


--
-- TOC entry 3133 (class 2606 OID 43133)
-- Name: receitas_produzidas receitas_produzidas_unidade_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas_produzidas
    ADD CONSTRAINT receitas_produzidas_unidade_id_fkey FOREIGN KEY (unidade_id) REFERENCES public.unidades(id) ON DELETE RESTRICT;


--
-- TOC entry 3101 (class 2606 OID 33908)
-- Name: receitas receitas_rendimento_uni_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.receitas
    ADD CONSTRAINT receitas_rendimento_uni_fkey FOREIGN KEY (rendimento_uni) REFERENCES public.unidades(id) ON DELETE RESTRICT;


--
-- TOC entry 3112 (class 2606 OID 34511)
-- Name: transacoes transacoes_tipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.transacoes
    ADD CONSTRAINT transacoes_tipo_fkey FOREIGN KEY (tipo) REFERENCES public.tipo_de_transacao(id) ON DELETE CASCADE;


--
-- TOC entry 3097 (class 2606 OID 33732)
-- Name: unidades_equi unidades_equi_unidades_a_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades_equi
    ADD CONSTRAINT unidades_equi_unidades_a_id_fkey FOREIGN KEY (unidade_a) REFERENCES public.unidades(id) ON DELETE CASCADE;


--
-- TOC entry 3098 (class 2606 OID 33737)
-- Name: unidades_equi unidades_equi_unidades_b_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lucasgueiros
--

ALTER TABLE ONLY public.unidades_equi
    ADD CONSTRAINT unidades_equi_unidades_b_id_fkey FOREIGN KEY (unidade_b) REFERENCES public.unidades(id) ON DELETE CASCADE;


--
-- TOC entry 3288 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE cardapio_produtos; Type: ACL; Schema: public; Owner: lucasgueiros
--


--
-- TOC entry 3290 (class 0 OID 0)
-- Dependencies: 255
-- Name: SEQUENCE cardapio_produtos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--


--
-- TOC entry 3291 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE cardapios; Type: ACL; Schema: public; Owner: lucasgueiros
--


--
-- TOC entry 3293 (class 0 OID 0)
-- Dependencies: 217
-- Name: SEQUENCE cardapios_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--


--
-- TOC entry 3294 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE categorias_de_produtos; Type: ACL; Schema: public; Owner: lucasgueiros
--


--
-- TOC entry 3296 (class 0 OID 0)
-- Dependencies: 264
-- Name: SEQUENCE categorias_de_produtos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3297 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE cliente_contatos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3299 (class 0 OID 0)
-- Dependencies: 231
-- Name: SEQUENCE cliente_contatos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3300 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE cliente_enderecos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 233
-- Name: SEQUENCE cliente_enderecos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE cliente_preferencias; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE clientecontatos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE clienteenderecos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE clientes; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 229
-- Name: SEQUENCE clientes_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE compra_itens; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 247
-- Name: SEQUENCE compra_itens_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE compras; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE compras_danfes; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 245
-- Name: SEQUENCE compras_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3317 (class 0 OID 0)
-- Dependencies: 243
-- Name: SEQUENCE danfes_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3318 (class 0 OID 0)
-- Dependencies: 253
-- Name: TABLE dia_de_producao_movimentacoes_estoque; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3319 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE dias_de_producao; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3321 (class 0 OID 0)
-- Dependencies: 249
-- Name: SEQUENCE dias_de_producao_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3322 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE formas_de_contato; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3324 (class 0 OID 0)
-- Dependencies: 225
-- Name: SEQUENCE formas_de_contato_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3325 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE formas_de_pagamento; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3327 (class 0 OID 0)
-- Dependencies: 227
-- Name: SEQUENCE formas_de_pagamento_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3328 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE fornecedorcontato; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3329 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE fornecedorendereco; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3330 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE fornecedores; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 241
-- Name: SEQUENCE fornecedores_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE insumos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE insumos_equi; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 205
-- Name: SEQUENCE insumos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE insumos_quantidade; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE movimentacoes_estoque; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 239
-- Name: SEQUENCE movimentacoes_estoque_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3341 (class 0 OID 0)
-- Dependencies: 257
-- Name: TABLE pedido_comprovante; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3343 (class 0 OID 0)
-- Dependencies: 256
-- Name: SEQUENCE pedido_comprovante_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3344 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE pedido_itens; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 254
-- Name: SEQUENCE pedido_itens_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE produto_precos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 260
-- Name: SEQUENCE pedido_precos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE pedidos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 236
-- Name: SEQUENCE pedidos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE produto_imagem; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE produto_insumos_quantidade; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3355 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE produtos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3356 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE produtos_categorias; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE produtos_harmonizacao; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 214
-- Name: SEQUENCE produtos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE receita_etapas; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 212
-- Name: SEQUENCE receita_etapas_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE receita_insumo_equi; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 210
-- Name: SEQUENCE receita_insumos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 262
-- Name: TABLE receita_insumos_quantidade; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE receitas; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 207
-- Name: SEQUENCE receitas_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE receitas_produzidas; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 251
-- Name: SEQUENCE receitas_produzidas_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE tipo_de_transacao; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 220
-- Name: SEQUENCE tipo_de_transacao_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 259
-- Name: TABLE tipos_de_enderecos; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3378 (class 0 OID 0)
-- Dependencies: 258
-- Name: SEQUENCE tipos_de_enderecos_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3379 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE transacoes; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3381 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE transacoes_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3382 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE unidades; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE unidades_equi; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 202
-- Name: SEQUENCE unidades_id_seq; Type: ACL; Schema: public; Owner: lucasgueiros
--



--
-- TOC entry 1927 (class 826 OID 33782)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: lucasgueiros
--

ALTER DEFAULT PRIVILEGES FOR ROLE lucasgueiros IN SCHEMA public REVOKE ALL ON SEQUENCES  FROM lucasgueiros;


--
-- TOC entry 1926 (class 826 OID 33781)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: lucasgueiros
--

ALTER DEFAULT PRIVILEGES FOR ROLE lucasgueiros IN SCHEMA public REVOKE ALL ON TABLES  FROM lucasgueiros;


-- Completed on 2020-10-08 00:03:36

--
-- PostgreSQL database dump complete
--
