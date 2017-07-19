CREATE FUNCTION subnetCheckerFunc() RETURNS trigger AS $emp_stamp$
  DECLARE
    iden INTEGER;
    user_ip inet;
    author_ip inet;

  BEGIN
      --SELECT IP for User
             -- SELECT (ip) INTO user_ip FROM users_base WHERE users_base.user_id = NEW.user_id;
      --SELECT IP for Author
              SELECT (author_id) INTO iden FROM docs WHERE docs.document_id = NEW.document_id;
             -- SELECT (ip) INTO author_ip FROM authors_base WHERE authors_base.author_id = iden;

              FOR user_ip IN SELECT (ip) FROM users_base WHERE users_base.user_id = NEW.user_id
              LOOP
              FOR author_ip IN SELECT (ip) FROM authors_base WHERE  authors_base.author_id = iden
              LOOP
                RAISE NOTICE 'User IP:(%)', user_ip;
                RAISE NOTICE 'Author IP:(%)', author_ip;
                IF masklen(inet_merge(user_ip,author_ip)) >= 24 THEN
                  RAISE NOTICE 'single subnet';
                  RETURN OLD;
                END IF;
              END LOOP;
              END LOOP;


    --TESTED WITH 1 to 1 id <-> ip connection, 1<->n not tested, iPv6 not tested
    RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;


CREATE TRIGGER subnetChecker BEFORE INSERT ON history
    FOR EACH ROW EXECUTE PROCEDURE subnetCheckerFunc();