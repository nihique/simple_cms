CREATE TABLE "admin_users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(25), "last_name" varchar(50), "hashed_password" varchar(40), "created_at" datetime, "updated_at" datetime, "username" varchar(25), "salt" varchar(40), "email" varchar(255) DEFAULT '' NOT NULL, "encrypted_password" varchar(128) DEFAULT '' NOT NULL, "password_salt" varchar(255) DEFAULT '' NOT NULL, "reset_password_token" varchar(255), "remember_token" varchar(255), "remember_created_at" datetime, "sign_in_count" integer DEFAULT 0, "current_sign_in_at" datetime, "last_sign_in_at" datetime, "current_sign_in_ip" varchar(255), "last_sign_in_ip" varchar(255));
CREATE TABLE "admin_users_pages" ("admin_user_id" integer, "page_id" integer);
CREATE TABLE "histories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "message" varchar(255), "username" varchar(255), "item" integer, "table" varchar(255), "month" integer(2), "year" integer(5), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "pages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subject_id" integer, "name" varchar(255), "permalink" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "section_edits" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "admin_user_id" integer, "section_id" integer, "summary" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "sections" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "page_id" integer, "name" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "content_type" varchar(255), "content" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "subjects" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "position" integer, "visible" boolean DEFAULT 'f', "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "index_admin_users_on_email" ON "admin_users" ("email");
CREATE UNIQUE INDEX "index_admin_users_on_reset_password_token" ON "admin_users" ("reset_password_token");
CREATE INDEX "index_admin_users_on_username" ON "admin_users" ("username");
CREATE INDEX "index_admin_users_pages_on_admin_user_id_and_page_id" ON "admin_users_pages" ("admin_user_id", "page_id");
CREATE INDEX "index_histories_on_item_and_table_and_month_and_year" ON "histories" ("item", "table", "month", "year");
CREATE INDEX "index_pages_on_permalink" ON "pages" ("permalink");
CREATE INDEX "index_pages_on_position" ON "pages" ("position");
CREATE INDEX "index_pages_on_subject_id" ON "pages" ("subject_id");
CREATE INDEX "index_section_edits_on_admin_user_id_and_section_id" ON "section_edits" ("admin_user_id", "section_id");
CREATE INDEX "index_sections_on_page_id" ON "sections" ("page_id");
CREATE INDEX "index_subjects_on_position" ON "subjects" ("position");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20101222164402');

INSERT INTO schema_migrations (version) VALUES ('20101222171628');

INSERT INTO schema_migrations (version) VALUES ('20101224103939');

INSERT INTO schema_migrations (version) VALUES ('20101224103953');

INSERT INTO schema_migrations (version) VALUES ('20101224104000');

INSERT INTO schema_migrations (version) VALUES ('20101225182811');

INSERT INTO schema_migrations (version) VALUES ('20101225182812');

INSERT INTO schema_migrations (version) VALUES ('20101225214819');

INSERT INTO schema_migrations (version) VALUES ('20101225220243');