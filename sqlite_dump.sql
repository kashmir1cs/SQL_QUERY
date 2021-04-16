BEGIN TRANSACTION;
CREATE TABLE users(id INTEGER PRIMARY KEY,     username TEXT, email TEXT,     phone TEXT, website TEXT, regdate TEXT);
INSERT INTO "users" VALUES(1,'K','Ki@naver.com','02-0000-0000','Ki.com','21-04-17 00:03:15');
INSERT INTO "users" VALUES(2,'P','Pak@daum.net','031-1111-1111','Pak.com','21-04-17 00:03:15');
INSERT INTO "users" VALUES(3,'L','Le@naver.com','041-2222-2222','Le.com','21-04-17 00:03:15');
INSERT INTO "users" VALUES(4,'C','Co@daum.net','02-3333-3333','Co.com','21-04-17 00:03:15');
INSERT INTO "users" VALUES(5,'Y','Y@le.com','031-4444-4444','Y.net','21-04-17 00:03:15');
COMMIT;

