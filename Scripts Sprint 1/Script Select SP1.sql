SELECT * FROM Hospital;

SELECT razaoSocial_Hospital, email_Hospital FROM Hospital;

SELECT * FROM Hospital WHERE qtdPulseira_Hospital > 40;

SELECT * FROM Enfermeiro;

SELECT nome_Enfermeiro, cargo_Enfermeiro FROM Enfermeiro;

SELECT * FROM Enfermeiro WHERE cargo_Enfermeiro = 'Enfermeira de UTI';

SELECT * FROM Paciente;

SELECT nome_Paciente, nomeEnfermeiro_Paciente FROM Paciente;

SELECT * FROM Paciente WHERE dataNascimento_Paciente < '1985-01-01';

SELECT * FROM Pulseira;

SELECT numero_Pulseira, intervaloMedicao_Pulseira FROM Pulseira;

SELECT * FROM Pulseira WHERE intervaloMedicao_Pulseira < 15;

SELECT * FROM RegistroTemperatura;

SELECT temperatura_RegistroTemperatura, data_RegistroTemperatura, hora_RegistroTemperatura 
FROM RegistroTemperatura 
WHERE nome_Paciente = 'João Pereira';

SELECT * FROM RegistroTemperatura WHERE temperatura_RegistroTemperatura > 37;

SELECT * FROM EntradaSaidaPaciente;

SELECT * FROM EntradaSaidaPaciente 
WHERE MONTH(dataSaida_EntradaSaidaPaciente) = 10;

SELECT dataEntrada_EntradaSaidaPaciente, horaSaida_EntradaSaidaPaciente 
FROM EntradaSaidaPaciente 
WHERE horaSaida_EntradaSaidaPaciente = '09:00:00';

SELECT * FROM Cama;

SELECT cama_Quarto FROM Cama WHERE numeroQuarto_Cama = 101;

SELECT numeroQuarto_Cama AS totalCamas 
FROM Cama 
ORDER BY numeroQuarto_Cama DESC;