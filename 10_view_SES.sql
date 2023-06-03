CREATE VIEW view_despesas_ses AS 
SELECT d.credor_id, c.cnpj_cpf, c.nome_credor FROM despesa d
JOIN unidade_gestora u
ON u.id = d.unidade_gestora_id
JOIN credor c
ON d.credor_id = c.id
WHERE u.unidade = 'SECRETARIA DE ESTADO DE SAÚDE DO DISTRITO FEDERAL';