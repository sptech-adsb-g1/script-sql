CREATE DATABASE LifeSaver;
USE LifeSaver; 

CREATE TABLE Hospital (
	id_Hospital INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    razaoSocial_Hospital VARCHAR(100) NOT NULL,
    endereco_Hospital VARCHAR(100) NOT NULL,
    email_Hospital VARCHAR(50) UNIQUE NOT NULL,
    senha_Hospital VARCHAR(20) NOT NULL,
    qtdPulseira_Hospital INT NOT NULL
);

INSERT INTO Hospital (razaoSocial_Hospital, endereco_Hospital, email_Hospital, senha_Hospital, qtdPulseira_Hospital) VALUES
('Hospital Santa Aurora', 'Av. Central, 1500', 'contato@santaaurora.com.br', 'senha321', 55),
('Hospital Vida Plena', 'Rua das Palmeiras, 890', 'info@vidaplena.com.br', 'senha654', 28),
('Hospital Universitário Central', 'Av. Universitária, 410', 'suporte@hucentral.com.br', 'senha987', 42),
('Hospital Regional Norte', 'Av. Independência, 300', 'contato@regionalnorte.com.br', 'senhaabc', 22),
('Hospital Oncológico Esperança', 'Rua das Acácias, 670', 'info@oncoesperanca.com.br', 'senhaxyz', 65);

SELECT * FROM Hospital;

SELECT razaoSocial_Hospital, email_Hospital FROM Hospital;

SELECT * FROM Hospital WHERE qtdPulseira_Hospital > 40;


CREATE TABLE Enfermeiro (
	id_Enfermeiro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_Enfermeiro VARCHAR(50) NOT NULL,
    numeroCracha_Enfermeiro INT NOT NULL,
    senha_Enfermeiro VARCHAR(20) NOT NULL,
    cargo_Enfermeiro VARCHAR(50) NOT NULL  
);

INSERT INTO Enfermeiro (nome_Enfermeiro, numeroCracha_Enfermeiro, senha_Enfermeiro, cargo_Enfermeiro) VALUES
('Lucas Andrade', 201, 'senhaLucas', 'Enfermeiro Chefe'),
('Mariana Torres', 202, 'senhaMariana', 'Enfermeira Assistente'),
('Pedro Henrique', 203, 'senhaPedro', 'Enfermeiro de UTI'),
('Renata Carvalho', 204, 'senhaRenata', 'Enfermeira de Pediatria'),
('Thiago Martins', 205, 'senhaThiago', 'Enfermeiro de Cirurgia');

SELECT * FROM Enfermeiro;

SELECT nome_Enfermeiro, cargo_Enfermeiro FROM Enfermeiro;

SELECT * FROM Enfermeiro WHERE cargo_Enfermeiro = 'Enfermeiro de UTI';


CREATE TABLE Paciente (
	id_Paciente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome_Paciente VARCHAR(50) NOT NULL,
    nomeEnfermeiro_Paciente VARCHAR(50) NOT NULL,
    dataNascimento_Paciente DATE NOT NULL,
    cpf_Paciente VARCHAR(11) NOT NULL,
    numeroQuarto_Paciente INT NOT NULL,
    idPulseira_Paciente INT NOT NULL
);

INSERT INTO Paciente (nome_Paciente, nomeEnfermeiro_Paciente, dataNascimento_Paciente, cpf_Paciente, numeroQuarto_Paciente, idPulseira_Paciente) VALUES
('Rafael Gomes', 'Lucas Andrade', '1984-04-12', '32145678901', 103, 1),
('Patricia Nunes', 'Mariana Torres', '1992-09-18', '43256789012', 104, 2),
('Eduardo Barros', 'Pedro Henrique', '1975-03-11', '54367890123', 203, 3),
('Camila Duarte', 'Renata Carvalho', '1981-12-22', '65478901234', 204, 4),
('Julio Cesar', 'Thiago Martins', '1996-06-30', '76589012345', 305, 5);

SELECT * FROM Paciente;

SELECT nome_Paciente, nomeEnfermeiro_Paciente FROM Paciente;

SELECT * FROM Paciente WHERE dataNascimento_Paciente < '1985-01-01';


CREATE TABLE Pulseira (
	numero_Pulseira INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    intervaloMedicao_Pulseira INT NOT NULL
);

INSERT INTO Pulseira (intervaloMedicao_Pulseira) VALUES
(6),
(12),
(18),
(25),
(50);

SELECT * FROM Pulseira;

SELECT numero_Pulseira, intervaloMedicao_Pulseira FROM Pulseira;

SELECT * FROM Pulseira WHERE intervaloMedicao_Pulseira < 15;


CREATE TABLE RegistroTemperatura (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    temperatura_RegistroTemperatura INT NOT NULL,
    data_RegistroTemperatura DATE NOT NULL,
    hora_RegistroTemperatura TIME NOT NULL,
    nome_Paciente VARCHAR(50) NOT NULL,
    numero_Pulseira INT NOT NULL
);

INSERT INTO RegistroTemperatura (temperatura_RegistroTemperatura, data_RegistroTemperatura, hora_RegistroTemperatura, nome_Paciente, numero_Pulseira) VALUES
(36, '2024-03-01', '07:45:00', 'Rafael Gomes', 1),
(37, '2024-03-01', '08:20:00', 'Patricia Nunes', 2),
(38, '2024-03-01', '09:10:00', 'Eduardo Barros', 3),
(36, '2024-03-01', '07:30:00', 'Camila Duarte', 4),
(37, '2024-03-01', '08:50:00', 'Julio Cesar', 5);

SELECT * FROM RegistroTemperatura;

SELECT temperatura_RegistroTemperatura, data_RegistroTemperatura, hora_RegistroTemperatura 
FROM RegistroTemperatura 
WHERE nome_Paciente = 'Rafael Gomes';

SELECT * FROM RegistroTemperatura WHERE temperatura_RegistroTemperatura > 37;


CREATE TABLE EntradaSaidaPaciente (
	id_EntradaSaidaPaciente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    dataEntrada_EntradaSaidaPaciente DATE NOT NULL,
    horaEntrada_EntradaSaidaPaciente TIME NOT NULL,
    dataSaida_EntradaSaidaPaciente DATE NOT NULL,
	horaSaida_EntradaSaidaPaciente TIME NOT NULL
);

INSERT INTO EntradaSaidaPaciente (dataEntrada_EntradaSaidaPaciente, horaEntrada_EntradaSaidaPaciente, dataSaida_EntradaSaidaPaciente, horaSaida_EntradaSaidaPaciente) VALUES
('2024-03-01', '07:40:00', '2024-03-05', '08:10:00'),
('2024-03-02', '08:50:00', '2024-03-06', '09:40:00'),
('2024-03-01', '09:15:00', '2024-03-08', '10:20:00'),
('2024-03-03', '07:25:00', '2024-03-07', '08:35:00'),
('2024-03-01', '06:55:00', '2024-03-05', '07:45:00');

SELECT * FROM EntradaSaidaPaciente;

SELECT * FROM EntradaSaidaPaciente 
WHERE MONTH(dataSaida_EntradaSaidaPaciente) = 3;

SELECT dataEntrada_EntradaSaidaPaciente, horaSaida_EntradaSaidaPaciente 
FROM EntradaSaidaPaciente 
WHERE horaSaida_EntradaSaidaPaciente = '08:10:00';


CREATE TABLE Cama (
	id_Cama INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    numeroQuarto_Cama INT NOT NULL,
    cama_Quarto VARCHAR(50) NOT NULL
);

INSERT INTO Cama (numeroQuarto_Cama, cama_Quarto) VALUES
('103', 'Cama A'),
('103', 'Cama B'),
('104', 'Cama A'),
('203', 'Cama A'),
('204', 'Cama A');

SELECT * FROM Cama;

SELECT cama_Quarto FROM Cama WHERE numeroQuarto_Cama = 103;

SELECT numeroQuarto_Cama AS totalCamas 
FROM Cama 
ORDER BY numeroQuarto_Cama DESC;