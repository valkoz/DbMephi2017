CREATE OR REPLACE FUNCTION show_doc(doc_name VARCHAR(40)) RETURNS docs AS $$
DECLARE
  doc docs;
BEGIN
    IF NOT exists(SELECT * FROM docs WHERE docs.name = doc_name ) THEN
      RAISE NOTICE 'document does not exists';
      RETURN null;
    END IF;
    IF exists( SELECT * FROM (SELECT document_id, docs.name FROM favourites LEFT JOIN docs USING (document_id)
      GROUP BY document_id, docs.name ORDER BY document_id LIMIT 3) as kekas WHERE name = doc_name) THEN
      RAISE NOTICE 'in top3';
      RETURN null;
    END IF;
    SELECT * INTO doc FROM docs WHERE docs.name = doc_name;
    RETURN doc;
    END;
$$ LANGUAGE plpgsql;