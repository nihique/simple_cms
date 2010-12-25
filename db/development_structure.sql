CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(25), "last_name" varchar(50), "email" varchar(100) DEFAULT '' NOT NULL, "hashed_password" varchar(40), "created_at" datetime, "updated_at" datetime, "username" varchar(25), "salt" varchar(40));
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject_id" integer, "name" varchar(255), "permalink" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sections" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_id" integer, "name" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "content_type" varchar(255), "content" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "subjects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE INDEX "index_admin_users_on_username" ON "admin_users" ("username");
CREATE INDEX "index_pages_on_permalink" ON "pages" ("permalink");
CREATE INDEX "index_pages_on_position" ON "pages" ("position");
CREATE INDEX "index_pages_on_subject_id" ON "pages" ("subject_id");
CREATE INDEX "index_sections_on_page_id" ON "sections" ("page_id");
CREATE INDEX "index_subjects_on_position" ON "subjects" ("position");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20101222164402');

INSERT INTO schema_migrations (version) VALUES ('20101222171628');

INSERT INTO schema_migrations (version) VALUES ('20101224103939');

INSERT INTO schema_migrations (version) VALUES ('20101224103953');

INSERT INTO schema_migrations (version) VALUES ('20101224104000');