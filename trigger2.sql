
CREATE FUNCTION disableInsertOnDocs() RETURNS trigger AS $emp_stamp$
    BEGIN

      IF exists (SELECT docs.author_id, count(docs.author_id) AS books_count,
          count(history.document_id) + count(favourites.document_id) AS popular FROM docs
          LEFT JOIN history USING (document_id) LEFT JOIN favourites USING (document_id)
          WHERE docs.author_id = NEW.author_id
          GROUP BY DOCS.author_id HAVING count(history.document_id) + count(favourites.document_id) > 0 or count(docs.author_id) < 5) THEN
        RETURN NEW;
      END IF;
      RAISE NOTICE 'unpopular author';
    RETURN OLD;


    END;
$emp_stamp$ LANGUAGE plpgsql;

CREATE TRIGGER unpopularAuthor BEFORE INSERT ON docs
    FOR EACH ROW EXECUTE PROCEDURE disableInsertOnDocs();