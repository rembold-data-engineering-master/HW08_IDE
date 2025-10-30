DROP SCHEMA IF EXISTS hw8 CASCADE;
CREATE SCHEMA hw8;

CREATE TABLE hw8.users (
  user_id bigint,
  first_name varchar(50),
  last_name varchar(50),
  street_address text,
  city varchar(50),
  state varchar(50),
  country char(2),
  birthdate date,
  local_timezone varchar(50)
);
-- Copy in data from CSV

CREATE TABLE hw8.appointments (
  appointment_id bigint,
  start_time timestamp,
  duration interval,
  apt_timezone varchar(50),
  apt_topic text
);
-- Copy data in from CSV

CREATE TABLE hw8.participants (
  appointment_id bigint,
  user_id bigint,
  is_attending varchar(5)
);
-- Copy data in from CSV



/* SETTING UP CONSTRAINTS */
ALTER TABLE hw8.users ADD PRIMARY KEY (user_id);
ALTER TABLE hw8.appointments ADD PRIMARY KEY (appointment_id);
ALTER TABLE hw8.participants ADD PRIMARY KEY (appointment_id, user_id);
ALTER TABLE hw8.participants ADD FOREIGN KEY (user_id) REFERENCES hw8.users (user_id);
ALTER TABLE hw8.participants ADD FOREIGN KEY (appointment_id) REFERENCES hw8.appointments (appointment_id);
