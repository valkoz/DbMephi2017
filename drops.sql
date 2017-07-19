--drop second trigger with function
DROP TRIGGER unpopularAuthor ON docs;
  DROP FUNCTION disableInsertOnDocs();

DROP TRIGGER subnetchecker ON history;
DROP FUNCTION subnetcheckerfunc();

DROP TRIGGER ipCounter ON users_base;
DROP FUNCTION ipCounterFuncUsers();

DROP TRIGGER ipCounter ON authors_base;
DROP FUNCTION ipCounterFuncAuthors();

DROP FUNCTION access_doc();
