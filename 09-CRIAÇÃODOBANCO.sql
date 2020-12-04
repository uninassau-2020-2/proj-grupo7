DROP DATABASE IF EXISTS REIDOCANGACO;

CREATE DATABASE IF NOT EXISTS REIDOCANGACO;

USE REIDOCANGACO;

CREATE TABLE tipo_usuario (
cod_tipo        INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
desc_tipo       VARCHAR(50)	    NOT NULL
);

CREATE TABLE usuario (
cod_usuario		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
desc_usuario		VARCHAR(150)	NOT NULL,
cpf_usuario		    VARCHAR(50)	    NOT NULL,
telefone            VARCHAR(50)	    NOT NULL,
email               VARCHAR(50)	    NOT NULL,
login				VARCHAR(50)		  NOT NULL	UNIQUE,
senha				VARCHAR(50)		  NOT NULL,
cod_tipo		    INTEGER			NOT NULL,
FOREIGN KEY(cod_tipo)		REFERENCES tipo_usuario(cod_tipo)
);

CREATE TABLE fornecedor (
cod_fornecedor		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
cnpj_cpf			VARCHAR(50)		NOT NULL	UNIQUE,
razao_social		VARCHAR(150)	NOT NULL,
nome_fantasia		VARCHAR(150)	NOT NULL,
endereco            VARCHAR(150)	NOT NULL,
telefone            VARCHAR(50)	    NOT NULL,
email               VARCHAR(50)	    NOT NULL
);

CREATE TABLE forma_pagamento (
cod_pagamento			INTEGER		NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
desc_pagamento	        VARCHAR(50)	NOT NULL
);

CREATE TABLE categoria (
cod_categoria	INTEGER		NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
nome_categoria	VARCHAR(50)	NOT NULL
);

CREATE TABLE unidade_medida(
cod_unidade INTEGER		NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
desc_unidade VARCHAR(50)	NOT NULL
);

CREATE TABLE produto (
id_produto		INTEGER			NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
cod_produto		VARCHAR(50)		NOT NULL,
cod_categoria	INTEGER			NOT NULL,
cod_unidade     INTEGER	        NOT NULL,
cod_fornecedor	INTEGER			NOT NULL,
desc_produto	VARCHAR(150)	NOT NULL,
preco_produto	FLOAT			NOT NULL,
qtd_estoque		VARCHAR(50)		NOT NULL,

FOREIGN KEY(cod_categoria)		REFERENCES categoria(cod_categoria),
FOREIGN KEY(cod_unidade)		REFERENCES unidade_medida(cod_unidade),
FOREIGN KEY(cod_fornecedor)		REFERENCES fornecedor(cod_fornecedor)
);

CREATE TABLE pedido (
cod_pedido				INTEGER		NOT NULL	AUTO_INCREMENT	PRIMARY KEY,
cod_usuario			INTEGER		NOT NULL,
cod_pagamento		INTEGER		NOT NULL,
data_pedido				VARCHAR(10)	NOT NULL,
valor_pedido			FLOAT		NOT NULL,
status					VARCHAR(50)	NOT NULL,
FOREIGN KEY(cod_usuario)			REFERENCES usuario(cod_usuario),
FOREIGN KEY(cod_pagamento)		   REFERENCES forma_pagamento(cod_pagamento)
);

CREATE TABLE item_pedido (
cod_pedido		INTEGER		NOT NULL,
id_produto		INTEGER		NOT NULL,
cod_produto		VARCHAR(50)	NOT NULL,
qtd_produto		INTEGER		NOT NULL,
preco_produto 	FLOAT		NOT NULL,
FOREIGN KEY(cod_pedido)		REFERENCES pedido(cod_pedido),
FOREIGN KEY(id_produto) 	REFERENCES produto(id_produto)
);