SELECT COUNT(*) from despesa d
JOIN credor c
ON d.credor_id = c.id
WHERE length(c.cnpj_cpf) = 11;