USE master
--DROP  DATABASE CursorCurso
CREATE DATABASE CursorCurso
GO
USE CursorCurso

CREATE TABLE curso(
codigo          INT         NOT NULL,
nome            VARCHAR(50) NOT NULL,
duracao         INT         NOT NULL
PRIMARY KEY (codigo)
)
GO
CREATE TABLE disciplina(
codigo          VARCHAR(10)         NOT NULL,
nome            VARCHAR(30) NOT NULL,
carga_horaria   INT         NOT NULL
PRIMARY KEY (codigo)
)
GO
CREATE TABLE disciplina_curso(
codigo_disciplina    VARCHAR(10) NOT NULL,  
codigo_curso         INT         NOT NULL
PRIMARY KEY(codigo_disciplina,codigo_curso),
FOREIGN KEY (codigo_curso ) REFERENCES curso(codigo),
FOREIGN KEY (codigo_disciplina) REFERENCES disciplina(codigo)
)

INSERT INTO curso VALUES 
    (48, 'Análise e Desenvolvimento de Sistemas', 2880),
    (51, 'Logística', 2880),
    (67, 'Polímeros', 2880),
    (73, 'Comércio Exterior', 2600),
    (94, 'Gestão Empresarial', 2600)
GO
INSERT INTO disciplina VALUES 
    ('ALG001', 'Algoritmos', 80),
    ('ADM001', 'Administração', 80),
    ('LHW010', 'Laboratório de Hardware', 40),
    ('LPO001', 'Pesquisa Operacional', 80),
    ('FIS003', 'Física I', 80),
    ('FIS007', 'Físico Química', 80),
    ('CMX001', 'Comércio Exterior', 80),
    ('MKT002', 'Fundamentos de Marketing', 80),
    ('INF001', 'Informática', 40),
    ('ASI001', 'Sistemas de Informação', 80)
GO
INSERT INTO disciplina_curso VALUES 
    ('ALG001', 48),
    ('ADM001', 48),
    ('ADM001', 51),
    ('ADM001', 73),
    ('ADM001', 94),
    ('LHW010', 48),
    ('LPO001', 51),
    ('FIS003', 67),
    ('FIS007', 67),
    ('CMX001', 51),
    ('CMX001', 73),
    ('MKT002', 51),
    ('MKT002', 94),
    ('INF001', 51),
    ('INF001', 73),
    ('ASI001', 48),
    ('ASI001', 94)

CREATE FUNCTION ObterInformacoesCurso (@CodigoCurso INT)
RETURNS @TabelaSaida TABLE (
    Codigo_Disciplina NVARCHAR(50),
    Nome_Disciplina NVARCHAR(100),
    Carga_Horaria_Disciplina INT,
    Nome_Curso NVARCHAR(100)
)
AS
BEGIN
    DECLARE @NomeCurso NVARCHAR(100)

    
    SELECT @NomeCurso = nome FROM curso WHERE codigo = @CodigoCurso

   
    DECLARE curso_cursor CURSOR FOR
        SELECT DC.codigo_disciplina, D.nome AS Nome_Disciplina, D.Carga_Horaria
        FROM disciplina_curso DC
        INNER JOIN disciplina D ON DC.codigo_disciplina = D.Codigo
        WHERE DC.codigo_curso = @CodigoCurso

    
    DECLARE @CodigoDisciplina NVARCHAR(50)
    DECLARE @NomeDisciplina NVARCHAR(100)
    DECLARE @CargaHoraria INT

    
    OPEN curso_cursor

  
    FETCH NEXT FROM curso_cursor INTO @CodigoDisciplina, @NomeDisciplina, @CargaHoraria
    WHILE @@FETCH_STATUS = 0
    BEGIN
        INSERT INTO @TabelaSaida (Codigo_Disciplina, Nome_Disciplina, Carga_Horaria_Disciplina, Nome_Curso)
        VALUES (@CodigoDisciplina, @NomeDisciplina, @CargaHoraria, @NomeCurso)

        FETCH NEXT FROM curso_cursor INTO @CodigoDisciplina, @NomeDisciplina, @CargaHoraria
    END

   
    CLOSE curso_cursor
    DEALLOCATE curso_cursor

    RETURN
END

SELECT * FROM ObterInformacoesCurso(48)