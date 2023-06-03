-- Criando tabelas

CREATE TABLE credor (
id SERIAL PRIMARY KEY,
cpf_cnpj VARCHAR(20) NOT NULL UNIQUE,
nome VARCHAR(255) NOT NULL
);

CREATE TABLE unidade_gestora (
id SERIAL PRIMARY KEY,
nome VARCHAR(255) NOT NULL
);

CREATE TABLE tipo_despesa (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE programa_trabalho (
id SERIAL PRIMARY KEY,
codigo VARCHAR(20) NOT NULL
);

CREATE TABLE funcao (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE subfuncao (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL,
funcao_id INTEGER REFERENCES funcao(id)
);

CREATE TABLE categoria_economica (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE grupo_natureza_despesa (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE modalidade_aplicacao (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE elemento_despesa (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

CREATE TABLE fonte_recursos (
id SERIAL PRIMARY KEY,
descricao VARCHAR(255) NOT NULL
);

-- Tabela principal

CREATE TABLE despesa_publica (
id SERIAL PRIMARY KEY,
credor_id INTEGER REFERENCES credor(id),
acao VARCHAR(20) NOT NULL,
unidade_gestora_id INTEGER REFERENCES unidade_gestora(id),
gestao INTEGER NOT NULL,
tipo_despesa_id INTEGER REFERENCES tipo_despesa(id),
programa_trabalho_id INTEGER REFERENCES programa_trabalho(id),
funcao_id INTEGER REFERENCES funcao(id),
subfuncao_id INTEGER REFERENCES subfuncao(id),
subtitulo VARCHAR(20) NOT NULL,
programa VARCHAR(20) NOT NULL,
categoria_economica_id INTEGER REFERENCES categoria_economica(id),
grupo_natureza_despesa_id INTEGER REFERENCES grupo_natureza_despesa(id),
modalidade_aplicacao_id INTEGER REFERENCES modalidade_aplicacao(id),
elemento_despesa_id INTEGER REFERENCES elemento_despesa(id),
fonte_recursos_id INTEGER REFERENCES fonte_recursos(id),
num_processo VARCHAR(50) NOT NULL,
empenhado DECIMAL(15, 2) NOT NULL,
liquidado DECIMAL(15, 2) NOT NULL,
pago DECIMAL(15, 2) NOT NULL,
total_pago DECIMAL(15, 2) NOT NULL
);
