CREATE TYPE doc_result AS (f1 INTEGER, f2 VARCHAR(40), f3 doc_type, f4 doc_status);
DROP TYPE doc_result;

CREATE OR REPLACE FUNCTION access_doc(doc_name VARCHAR(40), log VARCHAR(15)) RETURNS doc_result AS $$
DECLARE
  id doc_result;
BEGIN
  IF NOT exists(SELECT * FROM users WHERE users.login = log) THEN
    RAISE NOTICE 'user does not exists';
    RETURN null;
  END IF;
  IF NOT exists(SELECT * FROM docs WHERE docs.name = doc_name ) THEN
    RAISE NOTICE 'document does not exists';
    RETURN null;
  END IF;
  IF exists(SELECT * FROM docs WHERE docs.name = doc_name and docs.status = 'rejected') THEN
    RAISE NOTICE 'document is rejected';
    RETURN null;
  END IF;

  --SELECT count(*), docs.name, docs.subject INTO id FROM docs INNER JOIN docs USING (document_id) WHERE docs.name = doc_name;
  SELECT count(*), docs.name, docs.type, docs.status INTO id FROM docs
  INNER JOIN history USING (document_id) WHERE docs.name = doc_name GROUP BY docs.name, docs.type, docs.status;

  RETURN id;
END;
$$ LANGUAGE plpgsql;