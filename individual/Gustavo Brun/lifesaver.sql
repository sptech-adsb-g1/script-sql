CREATE DATABASE LifeSaver;

USE LifeSaver;

CREATE TABLE hospitals (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40),
    cnpj VARCHAR(40),
    whatsappNumber VARCHAR(40),    
    adress VARCHAR(60),
    
	createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO hospitals VALUES 
	(DEFAULT, 'Hospital Santa Aurora', 'contato@santaaurora.com.br', '53193599000193', '11999999999', 'Av. Central, 1500', DEFAULT, DEFAULT),
	(DEFAULT, 'Hospital Vida Plena', 'info@vidaplena.com.br', '81501325000150', '11999999998', 'Rua das Palmeiras, 890', DEFAULT, DEFAULT),
	(DEFAULT, 'Hospital Universitário Central', 'suporte@hucentral.com.br', '09213369000157', '11999999997', 'Av. Universitária, 410', DEFAULT, DEFAULT),
	(DEFAULT, 'Hospital Regional Norte', 'contato@regionalnorte.com.br', '27210805000116', '11999999996', 'Av. Independência, 300', DEFAULT, DEFAULT),
	(DEFAULT, 'Hospital Oncológico Esperança', 'info@oncoesperanca.com.br', '50553669000189', '11999999995', 'Rua das Acácias, 670', DEFAULT, DEFAULT);

SELECT * FROM hospitals;

SELECT email, cnpj FROM hospitals;

SELECT * FROM hospitals 
	WHERE id = 4;

CREATE TABLE bracelets (
	id INT PRIMARY KEY AUTO_INCREMENT,
	batch CHAR(6),
    status VARCHAR(20) DEFAULT 'OPERATING',
	constraint chkStatus
		CHECK(status IN ('OPERATING', 'BROKEN')),
	recordInterval INT DEFAULT 2000,
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO bracelets (batch) VALUES 
	('BRA001'),
	('BRA002'),
	('BRA003'),
	('BRA004'),
	('BRA005');
    
SELECT * FROM bracelets;

SELECT batch FROM bracelets;

SELECT * FROM bracelets 
	WHERE batch LIKE '%03';

CREATE TABLE users (
	id INT PRIMARY KEY AUTO_INCREMENT,
    badge CHAR(6),
    role VARCHAR(20)
    constraint chkRole
		CHECK(role IN ('NURSE', 'ADMINISTRATOR')),
    name VARCHAR(40) NOT NULL,
    email VARCHAR(40),
    password VARCHAR(40),
	whatsappNumber VARCHAR(40),
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users VALUES
	(DEFAULT, null, 'ADMINISTRATOR', 'Maria', 'maria@contato.com', '123456', '11999999989', DEFAULT, DEFAULT),
	(DEFAULT, 'NUR001', 'NURSE', 'Elise', 'elise@contato.com', '123457', '11999999979', DEFAULT, DEFAULT),
	(DEFAULT, 'NUR002', 'NURSE', 'João', 'joao@contato.com', '123458', '11999999969', DEFAULT, DEFAULT),
	(DEFAULT, 'NUR003', 'NURSE', 'Fernanda', 'fernanda@contato.com', '123459', '11999999959', DEFAULT, DEFAULT),
	(DEFAULT, 'NUR004', 'NURSE', 'Pedro', 'pedro@contato.com', '123451', '11999999949', DEFAULT, DEFAULT);
    
SELECT * FROM users;

SELECT badge FROM users;

SELECT email FROM users 
	WHERE id = 1;

CREATE TABLE patients (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    whatsappNumber VARCHAR(40),
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO patients VALUES
	(DEFAULT, 'Laura', '11999999899', DEFAULT, DEFAULT),
	(DEFAULT, 'Matheus', '11999999799', DEFAULT, DEFAULT),
	(DEFAULT, 'Ricardo', '11999999699', DEFAULT, DEFAULT),
	(DEFAULT, 'Patrick', '11999999599', DEFAULT, DEFAULT),
	(DEFAULT, 'Geovani', '11999999499', DEFAULT, DEFAULT);
    
SELECT * FROM patients;

SELECT name FROM patients;

SELECT whatsappNumber FROM patients 
	WHERE id = 4;

CREATE TABLE beds (
	id INT PRIMARY KEY AUTO_INCREMENT,
    room VARCHAR(10) NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO beds (room, available) VALUES
	('A01', DEFAULT),
	('B08', DEFAULT),
	('C03', FALSE),
	('A02', DEFAULT),
	('C05', DEFAULT);
    
SELECT * FROM beds;

SELECT room FROM beds;

SELECT id FROM beds 
	WHERE available = FALSE;

CREATE TABLE sessions (
	id INT PRIMARY KEY AUTO_INCREMENT,
    startTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    endTime DATETIME,
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO sessions (endTime) VALUES
	(null),
	(CURRENT_TIMESTAMP),
	(null),
	(null),
	(CURRENT_TIMESTAMP);

SELECT * FROM sessions;

SELECT startTime FROM sessions;

SELECT endTime FROM sessions
	WHERE endTime IS NOT NULL;

CREATE TABLE temperatures (
	id INT PRIMARY KEY AUTO_INCREMENT,
	record INT,
    
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
	updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO temperatures (record) VALUES 
	(37),
	(36),
	(38),
	(40),
	(39);
    
SELECT * FROM temperatures;

SELECT * FROM temperatures 
	WHERE record >= 39;
        
