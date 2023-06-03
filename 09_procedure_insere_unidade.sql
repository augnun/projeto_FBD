CREATE OR REPLACE FUNCTION insereUnidadeGestora(
	id INTEGER,
	unidade VARCHAR(255)
)

      RETURNS void AS $$
      BEGIN
	  IF unidade NOT IN (
		  SELECT u.unidade from unidade_gestora u
	  )
	  THEN
	  
        INSERT INTO unidade_gestora
         VALUES (id, unidade);
	  END IF;
	  
      END;
      $$ LANGUAGE 'plpgsql';