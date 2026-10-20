
CREATE DATABASE DB_ESCOLA_JOIN;
USE DB_ESCOLA_JOIN;

CREATE TABLE Alunos (
    cod INT PRIMARY KEY,
    nome VARCHAR(100),
    cidade VARCHAR(100)
);

-- Exercicio 1
INSERT INTO Alunos (cod, nome, cidade) VALUES
(1, 'Carlos', 'Sorocaba'),
(2, 'Beatriz', 'Sao bento'),
(3, 'Lucas', 'Votorantim'),
(4, 'Rhyan', 'Sorocaba'),
(5, 'Camila', 'Londres'),
(6, 'Livia', 'Vitoria'),
(7, 'Isabela', 'Paineiras'),
(8, 'Marcos', 'Boituva'),
(9, 'Vitor', 'Itu'),
(10, 'Guilherme', 'Sorocaba');

-- Criando a tabela Matriculas
CREATE TABLE Matriculas (
    cod INT PRIMARY KEY,
    valor DECIMAL(10, 2),
    data DATE,
    cod_aluno INT,
    FOREIGN KEY (cod_aluno) REFERENCES Alunos(cod)
);

INSERT INTO Matriculas (cod, valor, data, cod_aluno) VALUES
(1, 180.00, '2023-10-10', 1),
(2, 250.00, '2023-10-11', 2),
(3, 400.00, '2023-10-12', 3),
(4, 500.000, '2024-10-10', 4),
(5, 120.00, '2023-02-09', 5),
(6, 280.00, '2024-09-10', 6),
(7, 279.000, '2020-12-09', 7),
(8, 210.000, '2024-08-02', 8),
(9, 100.000, '2021-02-08', 9),
(10, 200.000, '2021-10-08', 10);

-- Exercicio 2
select
Alu.cod as cod_alu,
Alu.nome as nome_alu,
Alu.cidade as cid_alu,
Matri.valor as valor_matri
from Alunos as Alu
inner join Matriculas Matri
on Alu.cod = Matri.cod_aluno;

-- Exercicio 3
select
Alu.cod as cod_alu,
Alu.nome as nome_alu,
Alu.cidade as cid_alu,
Matri.valor as valor_matri
from Alunos as Alu
left join Matriculas Matri
on Alu.cod = Matri.cod_aluno
where Matri.cod_aluno is null;

-- Exercicio 4
select
Alu.cod as cod_alu,
Alu.nome as nome_alu,
Alu.cidade as cid_alu,
Matri.valor as valor_matri
from Alunos as Alu
right join Matriculas Matri
on Alu.cod = Matri.cod_aluno
order by Alu.cod, matri.cod;

-- Exercicio 5
select
Alu.cod as cod_alu,
Alu.nome as nome_alu,
Alu.cidade as cid_alu,
Matri.valor as valor_matri
from Alunos as Alu
left join Matriculas Matri
on Alu.cod = Matri.cod_aluno
where Matri.cod_aluno is null;

-- Exercicio 6
select
Alu.cod as cod_alu,
Alu.nome as nome_alu,
Alu.cidade as cid_alu,
Matri.valor as valor_matri
from Alunos as Alu
left join Matriculas Matri
on Alu.cod = Matri.cod_aluno
where Matri.valor > 200.000;

-- Exercicio 7
	select
	Alu.cod as cod_alu,
	Alu.nome as nome_alu,
	Alu.cidade as cid_alu,
	Matri.valor as valor_matri,
	Matri.data as data_matri
	from Alunos as Alu
	inner join Matriculas Matri
	on Alu.cod = Matri.cod_aluno
	where Matri.data between  '2023-10-01' and '2023-10-31';