create database omm;
create table users(
    user_id SERIAL PRIMARY KEY,
    user_type VARCHAR(100) NOT NULL,
    parent_id int NOT NULL,
    username varchar(100) NOT NULL,
    user_email varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    last_name varchar(100) NOT NULL,
    phone int NOT NULL,
    street_address varchar(100) NOT NULL,
    unit_number varchar(100) NOT NULL,
    city varchar(100) NOT NULL,
    state varchar(100) NOT NULL,
    zip int NOT NULL
);

create table b_info(
    b_id SERIAL PRIMARY KEY,
    user_id SERIAL NOT NULL,
    b_name varchar(100) NOT NULL,
    b_logo varchar NOT NULL,
    b_slogan varchar(500) NOT NULL,
    b_type varchar(100) NOT NULL,
    b_phone int NOT NULL,
    b_email varchar(100),
    b_street_address varchar(100) NOT NULL,
    b_unit_number varchar(100) NOT NULL,
    b_city varchar(100) NOT NULL,
    b_state varchar(100) NOT NULL,
    b_zip int NOT NULL,
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL
);
create table services(
  service_id SERIAL PRIMARY KEY,
  b_id SERIAL NOT NULL,
  service_name varchar(100) NOT NULL,
  service_desc text NOT NULL,
  CONSTRAINT fk_b
        FOREIGN KEY(b_id)
        REFERENCES b_info(b_id)
        ON DELETE CASCADE
);
create table reviews(
    review_id SERIAL PRIMARY KEY,
    service_id SERIAL NOT NULL,
    review_city varchar(100) NOT NULL,
    review_state varchar(100) NOT NULL,
    review_lat float8 NOT NULL,
    review_lon float8 NOT NULL,
    author_name varchar(100) NOT NULL,
    review_title varchar(50) NOT NULL,
    review_summary text NOT NULL,
    review_rating int NOT NULL,
    CONSTRAINT fk_service
        FOREIGN KEY(service_id)
        REFERENCES services(service_id)
);
create table checkins(
  checkin_id SERIAL PRIMARY KEY,
  user_id SERIAL NOT NULL,
  service_id SERIAL NOT NULL,
  checkin_date TIMESTAMP,
  checkin_desc text NOT NULL,
  checkin_img varchar(100) NOT NULL,
  checkin_lat float8 NOT NULL,
  checkin_lon float8 NOT NULL,
  CONSTRAINT fk_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE SET NULL,
  CONSTRAINT fk_service
        FOREIGN KEY(service_id)
        REFERENCES services(service_id)
        ON DELETE CASCADE
);
create table clients(
    client_id SERIAL PRIMARY KEY,
    b_id SERIAL NOT NULL,
    client_fname varchar(100) NOT NULL,
    client_lname varchar(100) NOT NULL,
    client_phone int NOT NULL,
    client_email varchar(100) NOT NULL,
    client_street_address varchar(100) NOT NULL,
    client_city varchar(100) NOT NULL,
    client_state varchar(100) NOT NULL,
    client_zip int NOT NULL,
    CONSTRAINT fk_b
        FOREIGN KEY(b_id)
        REFERENCES b_info(b_id)
        ON DELETE SET NULL
);
create table projects(
    project_id SERIAL PRIMARY KEY,
    client_id SERIAL NOT NULL,
    service_id SERIAL NOT NULL,
    CONSTRAINT fk_clients
        FOREIGN KEY(client_id)
        REFERENCES clients(client_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_service
        FOREIGN KEY(service_id)
        REFERENCES services(service_id)
        ON DELETE SET NULL
);
create table galleries(
    gallery_id SERIAL PRIMARY KEY,
    project_id SERIAL NOT NULL,
    service_id SERIAL NOT NULL,
    CONSTRAINT fk_projects
        FOREIGN KEY(project_id)
        REFERENCES projects(project_id)
        ON DELETE SET NULL,
    CONSTRAINT fk_service
        FOREIGN KEY(service_id)
        REFERENCES services(service_id)
        ON DELETE SET NULL

);
create table pics(
    pic_id SERIAL PRIMARY KEY,
    gallery_id SERIAL NOT NULL,
    pic_url varchar(100) NOT NULL,
    pic_caption text NOT NULL
)