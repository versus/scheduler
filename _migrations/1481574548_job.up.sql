CREATE TABLE "job" (
  id SERIAL PRIMARY KEY,
  name varchar(256) NOT NULL,
  description TEXT NULL,
  is_enabled bool DEFAULT true,
  params TEXT NULL,
  remote_trigger_token varchar(256) NULL,
  periodical_schedule varchar(256) NULL,
  build_path varchar(1024) NULL,
  steps TEXT NULL,
  created_at timestamp without time zone,
  updated_at timestamp without time zone,
  deleted_at timestamp without time zone
);

CREATE TYPE "job_action" AS ENUM ('run', 'edit', 'delete', 'create');

CREATE TABLE job_history (
  id SERIAL PRIMARY KEY,
  "action" job_action DEFAULT 'run',
  user_id int,
  log TEXT null,
  created_at timestamp without time zone
);

ALTER TABLE job_history ADD CONSTRAINT fk_history_user FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE CASCADE;

CREATE TABLE tab (
  id SERIAL PRIMARY KEY,
  name VARCHAR (256) NOT NULL
);

CREATE TABLE tab_job (
  tab_id int,
  job_id int,
  "position" int
);

ALTER TABLE tab_job ADD CONSTRAINT fk_tab_job_tab_id FOREIGN KEY (tab_id) REFERENCES "tab" (id) ON DELETE CASCADE;
ALTER TABLE tab_job ADD CONSTRAINT fk_tab_job_job_id FOREIGN KEY (job_id) REFERENCES "job" (id) ON DELETE CASCADE;