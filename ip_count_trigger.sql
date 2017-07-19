CREATE FUNCTION ipCounterFuncUsers() RETURNS trigger AS $emp_stamp$
  BEGIN
    IF  (SELECT COUNT (ip) FROM users_base WHERE user_id = NEW.user_id) > 2 THEN
      RETURN OLD;
    END IF;
    RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;


CREATE TRIGGER ipCounter BEFORE INSERT ON users_base
    FOR EACH ROW EXECUTE PROCEDURE IpCounterFuncUsers();

CREATE FUNCTION ipCounterFuncAuthors() RETURNS trigger AS $emp_stamp$
  BEGIN
    IF  (SELECT COUNT (ip) FROM authors_base WHERE author_id = NEW.author_id) > 2 THEN
      RETURN OLD;
    END IF;
    RETURN NEW;
    END;
$emp_stamp$ LANGUAGE plpgsql;


CREATE TRIGGER ipCounter BEFORE INSERT ON authors_base
    FOR EACH ROW EXECUTE PROCEDURE ipCounterFuncAuthors();