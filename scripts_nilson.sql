CREATE TABLE despesa (
credor_id SERIAL PRIMARY KEY,
acao_id INTEGER,
unidade_gestora_id INTEGER,
tipo_despesa_id INTEGER,
programa_trabalho_id INTEGER,
funcao_id INTEGER,
subfuncao_id INTEGER,
subtitulo_id INTEGER,
programa_id INTEGER,
categoria_economica_id INTEGER,
grupo_natureza_despesa_id INTEGER,
modalidade_aplicacao_id INTEGER,
elemento_despesa_id INTEGER,
fonte_recursos_id INTEGER,
num_processo VARCHAR(255),
empenhado MONEY,
	
liquidado MONEY,
pago MONEY,
total_pago MONEY);



INSERT INTO despesa (
credor_id,
acao_id,
unidade_gestora_id,
tipo_despesa_id,
programa_trabalho_id,
funcao_id,
subfuncao_id,
subtitulo_id,
programa_id,
categoria_economica_id,
grupo_natureza_despesa_id,
modalidade_aplicacao_id,
elemento_despesa_id,
fonte_recursos_id,
num_processo,
empenhado,
liquidado,
--pago,
total_pago
)
SELECT
credor.id,
acao.id,
unidade_gestora.id,
tipo_despesa.id,
programa_trabalho.id,
funcao.id,
subfuncao.id,
subtitulo.id,
programa.id,
categoria_economica.id,
grupo_natureza_despesa.id,
modalidade_aplicacao.id,
elemento_despesa.id,
fonte_recursos.id,
n_do_processo,
empenhado,
liquidado,
--Pago,
total_pago
FROM
despesas_brutas d
JOIN credor ON d.cpf_cnpj_credor = credor.cnpj_cpf
JOIN acao ON d.acao = acao.acao
JOIN unidade_gestora ON d.unidade_gestora = unidade_gestora.unidade
JOIN tipo_despesa ON d.tipo_de_despesa = tipo_despesa.tipo
JOIN programa_trabalho ON d.programa_de_trabalho = programa_trabalho.programa_trabalho
JOIN funcao ON d.funcao = funcao.funcao
JOIN subfuncao ON d.subfuncao = subfuncao.subfuncao
join subtitulo ON d.subtitulo = subtitulo.subtitulo
join programa on d.programa = programa.programa
join categoria_economica on d.categoria_economica = categoria_economica.categoria
join grupo_natureza_despesa on d.grupo_de_natureza_da_despesa = grupo_natureza_despesa.grupo
join modalidade_aplicacao on d.modalidade_de_aplicação = modalidade_aplicacao.modalidade
join elemento_despesa on d.elemento_de_despesa = elemento_despesa.elemento
join fonte_recursos on d.fonte_de_recursos = fonte_recursos.fonte
