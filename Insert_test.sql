INSERT INTO authors (nickname, password_hash, subject, block_status) VALUES
  ('Tolstoi', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655511','venal practice', FALSE ),
  ('Pushkin', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655512','spy', FALSE ),
  ('Lermontov', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655513','murder', FALSE ),
  ('Gogol', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655514','venal practice', FALSE ),
  ('Turgenev', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655515','venal practice', FALSE ),
  ('Esenin', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516','venal practice', FALSE ),
  ('Dostoelskiy', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655517','venal practice', FALSE ),
  ('Bulgakov', 'f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655518','venal practice', FALSE );

INSERT INTO users (login, password_hash, vip_status, block_status) VALUES
  ('Ivanov','a4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', TRUE , FALSE ),
  ('Petrov','b4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', TRUE , FALSE ),
  ('Kekov','c4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', FALSE , FALSE ),
  ('whiteSnake2017','d4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', TRUE , TRUE ),
  ('redIphoneLOL','e4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', FALSE , FALSE ),
  ('IcanDoIt','f4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', FALSE , FALSE ),
  ('RussianHacker','g4636881691070ee8600368efe991d2253b5156a63fd4fbe73c6397d92655516', FALSE , FALSE );

INSERT INTO informers (nickname, specialization) VALUES
  ('Happy_dolphin', 'paparazzi'),
  ('CrazyBear', 'undercover agent'),
  ('SneakySnake', 'freelancer'),
  ('WindyWolf', 'spy'),
  ('_KindKek', 'another');

INSERT INTO docs (name, author_id, coauthor_id, status, type, info) VALUES
  ('The materials of New century', 6, 3, 'rejected','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('ASKDJNKDSNV', 7, 4, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('NDKJFVLKD', 8, 5,'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('KDNFVLKNDE', 9, 6, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('LKSMFVDFVLdE', 10, 7, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dfvnsdfv', 3, 8, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('gtjbdrhovn', 4, 9, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('rlfknbervnsrk', 5, 10, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('fvllmdgbnlkdj', 6, 3, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dclkdsfnvb', 7, 4, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('vkkdfgbhitro', 8, 5, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('fgnbdkjf', 9, 6, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dflkbnkfjgnb', 10, 7, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('vsldfmbjrtn', 3, 8, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('fvmnrtkbjnr', 4, 9, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dfnvktjnb', 5, 10, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('fmnblrdtb', 6, 3, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('gblkjrkb', 7, 4, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('lbmrgbnr', 8, 5, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('vlmsdnfvkjs', 9, 6, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('fgl;bmfdl', 10, 7, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dfmvlksfdn', 3, 8, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dsjkjvsdhf', 4, 9, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dfmngdksfn', 5, 10, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('lkdfvkjbdf', 6, 3, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dlkfvndsf', 7, 4, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dlfvbklnf', 8, 5, 'ready to publish','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dfkjvfghl', 9, 6, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA'),
  ('dkjcvjkdfsi', 10, 7, 'sent for revision','pdf','0B9e8upd0TWbWVDl6QWpkb1JTTTA');

INSERT INTO history (user_id, document_id, date, subject) VALUES
  (3,10, current_date, 'spy')