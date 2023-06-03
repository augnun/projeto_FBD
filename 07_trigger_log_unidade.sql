CREATE OR REPLACE FUNCTION unidade_log_unidade()
RETURNS trigger AS $BODY$
BEGIN

IF (TG_OP = 'INSERT') THEN
INSERT INTO unidade_gestora_auditoria (log_id, data_criacao, operacao_realizada)
VALUES (new.id, new.unidade, ' Operação de inserção.
A linha de código ' || NEW.unidade || 'foi inserido');
RETURN NEW;

ELSIF (TG_OP = 'UPDATE') THEN
INSERT INTO unidade_gestora_auditoria (log_id, data_criacao, operacao_realizada)
VALUES (NEW.id, new.unidade, 'Operação de UPDATE.
A linha de código ' || NEW.id || ' teve os valores atualizados '
|| OLD || ' com ' || NEW.* || '.');
RETURN NEW;

ELSIF (TG_OP = 'DELETE') THEN
INSERT INTO unidade_gestora_auditoria (log_id, data_criacao, operacao_realizada)
VALUES (OLD.id, new.unidade, 'Operação DELETE. A linha de código '
|| OLD.id || ' foi excluída ');
RETURN OLD;
END IF;

RETURN NULL;
END;
$BODY