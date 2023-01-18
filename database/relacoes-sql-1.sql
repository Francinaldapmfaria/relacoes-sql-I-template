-- Active: 1673874131064@@127.0.0.1@3306


-- Práticas 1:m
CREATE TABLE users(
    id TEXT PRIMARY KEY NOT null,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

CREATE TABLE phones (
    id TEXT PRIMARY KEY NOT NULL,
    phone_number TEXT UNIQUE NOT NULL,
    user_id TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)); --chave estrangeira user_id referencia a id de 
    --users que é chave primária.


INSERT INTO users (id, name, email, password)
VALUES
('u001','Camilla','camila@gmail.com', "15151515"),
('u002', 'igor', 'igor@gmail.com','84858888');

INSERT INTO phones (id, phone_number, user_id)
VALUES
('p001','5511995649874','u001'),
('p002','5511995641515','u001'),
('p003','5511995649632','u002');

INSERT into (id, phone_number, user_id)
VALUES
('p004','5511985652416','u003'); --viria um erro

SELECT * FROM users;
SELECT * FROM phones;

SELECT * FROM users
INNER JOIN phones
on phones.user_id = users.id;

--Pratica 3 relação 1:1

CREATE TABLE licenses(
    id TEXT PRIMARY KEY UNIQUE NOT NULL,
    register_number TEXT UNIQUE NOT NULL,
    category TEXT NOT NULL
);


CREATE TABLE drivers (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    license_id  TEXT UNIQUE NOT NULL, --diferença do 1: é que é unico somente para uma pessoa unica
    FOREIGN KEY (license_id) REFERENCES licenses(id)
    );

    SELECT * FROM licenses;
    SELECT* FROM drivers;

    INSERT INTO licenses (id, register_number, category)
    VALUES
    ('l001', '1111111111', 'A'),
    ('l002', '1111122222', 'AB');

    INSERT INTO drivers (id, name, email, password, license_id)
    VALUES
    ('d001', 'Carlos','carlos@hot.com','4545454', 'l001'),
    ('d002', 'Tais','ctais@hot.com','15455477', 'l002');

SELECT * FROM drivers
INNER JOIN licenses
ON drivers.license_id = licenses.id; --cahave estrangeira == chave que referencia



--fixação

CREATE TABLE owners  (
    id TEXT PRIMARY KEY NOT NULL,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE pet (
    id TEXT PRIMARY KEY NOT NULL,
    pet_name TEXT UNIQUE NOT NULL,
    owner_id TEXT NOT NULL,
    FOREIGN KEY (owner_id) REFERENCES owners(id)
    ); 

    DROP TABLE pet;

     SELECT * FROM owners;
    SELECT * FROM pet;

    INSERT INTO owners (id, name, email)
    VALUES
    ('a001', 'joão', 'joao@ihg'),
    ('a002', 'maria', 'maria@hhjjh');

      INSERT INTO pet (id, pet_name, owner_id)
    VALUES
    ('f001', 'pinquinho', 'a001'),
    ('f002', 'nick', 'a001'),
    ('f003', 'role', 'a002');

    SELECT * FROM owners
    INNER JOIN pet
    ON owner_id = owners.id;

    UPDATE purchases
SET delivered_at = DATE ('now')
WHERE id = 'a001';