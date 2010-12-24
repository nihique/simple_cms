CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(25), "last_name" varchar(50), "email" varchar(100) DEFAULT '' NOT NULL, "hashed_password" varchar(40), "created_at" datetime, "updated_at" datetime, "username" varchar(25), "salt" varchar(40));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE INDEX "index_admin_users_on_username" ON "admin_users" ("username");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20101222152849');

INSERT INTO schema_migrations (version) VALUES ('20101222164402');

INSERT INTO schema_migrations (version) VALUES ('20101222171628');