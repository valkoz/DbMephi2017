-- Запрос 1
-- Получить информацию о датах,
-- когда пользователи просматривали свои избранные документы
-- Количество просмотров на каждую дату!

SELECT
  date(date),
  count(date)
FROM history
  JOIN (SELECT document_id
        FROM favourites
        GROUP BY document_id) AS t1 USING (document_id)
GROUP BY date(date);

-- Запрос 2
-- Для документов, которые просматривались более 2 раз,
-- но менее, чем тремя пользователями, вывести авторов и информацию о документе
SELECT
  count(*),
  document_id
FROM history
GROUP BY document_id;

SELECT
  count(*),
  user_id,
  document_id
FROM history
GROUP BY user_id, document_id;

WITH t1 AS (
    SELECT
      SUM(a.count) AS show_count,
      document_id,
      count(*)     AS user_count
    FROM (
           SELECT
             count(*),
             user_id,
             document_id
           FROM history
           GROUP BY user_id, document_id) AS a
    GROUP BY a.document_id
)
SELECT *
FROM t1
  JOIN docs USING (document_id)
  JOIN authors USING (author_id)
WHERE show_count > 2 AND user_count < 3;

-- Запрос 3
-- Вывести наиболее популярных информаторов
-- (максимальное количество просмотров для history).
-- Если одинаковое максимальное число просмотров, то выводить несколько

SELECT author_id
FROM history
  JOIN docs USING (document_id);

SELECT
  author_id,
  Informer_ID
FROM history
  JOIN docs USING (document_id)
  INNER JOIN info USING (author_id);

SELECT
  count(Informer_ID),
  Informer_ID
FROM history
  JOIN docs USING (document_id)
  INNER JOIN info USING (author_id)
GROUP BY Informer_ID;

--Сделать сравнение планов запросов, ссылку на объяснения давал Артем.А. в pgAdmin-e
--PLAN
WITH t1 AS (
    SELECT
      count(Informer_ID) AS popularity,
      Informer_ID
    FROM history
      JOIN docs USING (document_id)
      JOIN info USING (author_id)
    GROUP BY Informer_ID
)
SELECT informers.*
FROM t1
  JOIN informers USING (Informer_ID)
WHERE popularity = (SELECT MAX(popularity)
                       FROM t1);

--HAVING
SELECT informers.*
FROM (SELECT
      count(Informer_ID) AS popularity,
      Informer_ID
    FROM history
      JOIN docs USING (document_id)
      JOIN info USING (author_id)
    GROUP BY Informer_ID
    HAVING count(Informer_ID) = (SELECT count(Informer_ID) AS popularity
                                 FROM history
                                   JOIN docs USING (document_id)
                                   JOIN info USING (author_id)
                                 GROUP BY Informer_ID
                                 ORDER BY count(Informer_ID) DESC
                                 LIMIT 1)) as I
JOIN informers USING (Informer_ID);


--Этот не нужно
--Еще вариант
WITH t1 AS (
    SELECT
      count(Informer_ID) AS popularity,
      Informer_ID
    FROM history
      JOIN docs USING (document_id)
      JOIN info USING (author_id)
    GROUP BY Informer_ID
    HAVING count(Informer_ID) = (SELECT count(Informer_ID) AS popularity
                                 FROM history
                                   JOIN docs USING (document_id)
                                   JOIN info USING (author_id)
                                 GROUP BY Informer_ID
                                 ORDER BY count(Informer_ID) DESC
                                 LIMIT 1)
)
SELECT informers.*
FROM t1
  JOIN informers USING (Informer_ID);


-- Запрос 4
-- Документы авторов, которые выходили более чем с двух ip.
SELECT docs.*
FROM (
       SELECT
         count(*) AS c,
         author_id
       FROM authors_base
       GROUP BY author_id
     ) AS t1
  INNER JOIN docs USING (author_id)
WHERE t1.c > 2;
-- Запрос 5
-- Информаторы, которые не представили никакой информации.
(
  SELECT *
  FROM informers
)
EXCEPT
(
  SELECT informers.*
  FROM informers
    INNER JOIN info USING (informer_id)
);

  SET enable_nestloop TO TRUE;
    EXPLAIN ANALYZE SELECT informers.*
                FROM (SELECT
                        count(Informer_ID) AS popularity,
                        Informer_ID
                      FROM history
                        JOIN docs USING (document_id)
                        JOIN info USING (author_id)
                      GROUP BY Informer_ID
                      HAVING count(Informer_ID) = (SELECT count(Informer_ID) AS popularity
                                                   FROM history
                                                     JOIN docs USING (document_id)
                                                     JOIN info USING (author_id)
                                                   GROUP BY Informer_ID
                                                   ORDER BY count(Informer_ID) DESC
                                                   LIMIT 1)) AS I
                  JOIN informers USING (Informer_ID);