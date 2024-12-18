CREATE TABLE ASSUNTOS
(IDASSUNTO NUMBER(8) NOT NULL PRIMARY KEY,
NOME NVARCHAR2(80) NOT NULL UNIQUE );

CREATE TABLE LIVROS 
( IDLIVROS NVARCHAR2(15) NOT NULL ,
TITULO NVARCHAR2(80) NOT NULL,
EDITORA NVARCHAR2(20) NOT NULL,
TOTPAG NUMBER(4)CHECK(TOTPAG > 0),
DIASPRAZO NUMBER(3) CHECK(DIASPRAZO >=0),
IDASSUNTO NUMBER(8) NOT NULL,
CONSTRAINT PK_LIVRO PRIMARY KEY(IDLIVROS),
CONSTRAINT FK_LIVRO_ASSUNTOS FOREIGN KEY(IDASSUNTO) REFERENCES ASSUNTOS(IDASSUNTO));


CREATE TABLE EMPRESTIMOS 
(IDLIVROS NVARCHAR2(15) ,
CODSOCIO NUMBER(8),
DTRETIRADA DATE NOT NULL ,
DTDEVPREV DATE NOT NULL,
DTDEVREAL DATE,
VRMULTA FLOAT(2) CHECK(VRMULTA >=0),
CONSTRAINT PK_LIVRO_EMPRESTIMO PRIMARY KEY(IDLIVROS,CODSOCIO,DTRETIRADA),
CONSTRAINT FK_LIVRO_EMPRESTIMO FOREIGN KEY(IDLIVROS) REFERENCES LIVROS(IDLIVROS),
CONSTRAINT FK_SOCIOS_EMPRESTIMO FOREIGN KEY(CODSOCIO)REFERENCES SOCIOS(CODSOCIO));

CREATE TABLE SOCIOS 
(CODSOCIO NUMBER(8),
NOME NVARCHAR2(40) NOT NULL,
TELEFONE NVARCHAR2(20) NOT NULL,
LOGRADOURO NVARCHAR2(30) NOT NULL,
COMPLEM NVARCHAR2(15),
BAIRRO NVARCHAR2(15),
CIDADE NVARCHAR2(20),
UF NVARCHAR2(2),
CEP NVARCHAR2(8),
CONSTRAINT PK_SOCIOS PRIMARY KEY(CODSOCIO));


CREATE TABLE AUTORIAS
(IDLIVROS NVARCHAR2(15),
CODSOCIO NUMBER(8),
CONSTRAINT FK_LIVROS_AUTORAIS FOREIGN KEY(IDLIVROS) REFERENCES LIVROS(IDLIVROS),
CONSTRAINT FK_SOCIOS_AUTORAIS FOREIGN KEY(CODSOCIO)REFERENCES SOCIOS(CODSOCIO),
CONSTRAINT PK_AUTORAIS PRIMARY KEY(IDLIVROS,CODSOCIO));


CREATE TABLE AUTORES 
(CODIGOAUTORES NUMBER(8),
NOME NVARCHAR2(40) NOT NULL,
ORIGEM NVARCHAR2(20) NOT NULL,
CONSTRAINT PK_AUTORES PRIMARY KEY(CODIGOAUTORES));


INSERT INTO SOCIOS VALUES(1, 'CRISTIANE',NULL, NULL,NULL);


INSERT INTO ASSUNTOS VALUES(1,'MICROBIOLOGIA');
INSERT INTO ASSUNTOS VALUES(2,'PROGRAMA��O');
INSERT INTO ASSUNTOS VALUES(3,'MATERIAIS');
INSERT INTO ASSUNTOS VALUES(4,'FISIOLOGIA');
INSERT INTO ASSUNTOS VALUES(5,'USINAGEM');
INSERT INTO ASSUNTOS VALUES(6,'BANCO DE DADOS');
INSERT INTO ASSUNTOS VALUES(7,'CALCULO');

INSERT INTO AUTORES VALUES(1,'JOS� DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(2,'VANDERLEI DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(3,'JO�O DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(4,'PEDRO DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(5,'JOAQUIM DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(6,'MARIA DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(7,'TEOBALDO DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(8,'ARLETE DA SILVA','BRASIL');
INSERT INTO AUTORES VALUES(9,'ANA DA SILVA','BRASIL');

INSERT INTO SOCIOS VALUES(1,'MATHEUS ALVES', '15 991018392', 'RUA NESTOR', 'BLABLABLA', 'VITORIA REGIA', 'SOROCABA', 'SP', '18078343');
INSERT INTO SOCIOS VALUES(2,'lEONARDO', '15 991018392', 'RUA NESTOR', 'BLABLABLA', 'VITORIA REGIA', 'SOROCABA', 'SP', '18078343');
INSERT INTO SOCIOS VALUES(3,'MURILO', '15 991018392', 'RUA NESTOR', 'BLABLABLA', 'VITORIA REGIA', 'SOROCABA', 'SP', '18078343');
INSERT INTO SOCIOS VALUES(4,'NICOLAS', '15 991018392', 'RUA NESTOR', 'BLABLABLA', 'VITORIA REGIA', 'SOROCABA', 'SP', '18078343');
INSERT INTO SOCIOS VALUES(5,'LEONARDO', '15 991018392', 'RUA NESTOR', 'BLABLABLA', 'VITORIA REGIA', 'SOROCABA', 'SP', '18078343');

INSERT INTO LIVROS VALUES('737.4.202 S2002','Os bichos s�o assim', 'LTC', 300,7,1);
INSERT INTO LIVROS VALUES('681.5.203 S442','T�cnicas de programa��o estruturada', 'Campus', 253,7,2);
INSERT INTO LIVROS VALUES('588.9.949 S3003','Ensaios de dureza e de moleza', 'LTC', 330,7,3);
INSERT INTO LIVROS VALUES('737.4.234 S2323','O funcionamento do intestino', 'Globo', 300,7,4);
INSERT INTO LIVROS VALUES('588.3.342 S4343','Torno radial: Como funciona a coisa', 'LTC', 505,7,5);
INSERT INTO LIVROS VALUES('737.4.180 S2023','Bact�rias, micr�bios e coisas parecidas', 'ERIKA', 300,7,1);
INSERT INTO LIVROS VALUES('683.2.343 S334','Teoria de bancos de dados', 'Campus', 450,7,6);
INSERT INTO LIVROS VALUES('333.5.656 S1849','Calculo diferencial e integral', 'LTC', 300,7,7);

INSERT INTO EMPRESTIMOS VALUES('737.4.202 S2002',1,'10/10/2024','17/10/2024','14/10/2024',0);
INSERT INTO EMPRESTIMOS VALUES('681.5.203 S442',2,'10/10/2024','17/10/2024',NULL,0);
INSERT INTO EMPRESTIMOS VALUES('588.9.949 S3003',2,'05/10/2024','12/10/2024','14/10/2024',10);
INSERT INTO EMPRESTIMOS VALUES('737.4.234 S2323',3,'01/10/2024','08/10/2024','11/10/2024',15);
INSERT INTO EMPRESTIMOS VALUES('588.3.342 S4343',4,'09/09/2024','16/09/2024','16/09/2024',0);
INSERT INTO EMPRESTIMOS VALUES('737.4.180 S2023',5,'14/09/2024','21/09/2024',NULL,0);
INSERT INTO EMPRESTIMOS VALUES('683.2.343 S334',5,'14/09/2024','21/09/2024',NULL,0);
INSERT INTO EMPRESTIMOS VALUES('333.5.656 S1849',1,'09/09/2022','16/09/2022','16/09/2022',0);
INSERT INTO EMPRESTIMOS VALUES('333.5.656 S1849',2,'09/09/2023','16/09/2023','16/09/2023',0);
INSERT INTO EMPRESTIMOS VALUES('333.5.656 S1849',3,'09/09/2021','16/09/2021','16/09/2021',0);
INSERT INTO EMPRESTIMOS VALUES('333.5.656 S1849',4,'09/09/2020','16/09/2020','16/09/2020',0);
INSERT INTO EMPRESTIMOS VALUES('588.3.342 S4343',3,'09/09/2023','16/09/2023','16/09/2023',0);
INSERT INTO EMPRESTIMOS VALUES('588.3.342 S4343',2,'09/09/2022','16/09/2022','16/09/2022',0);
INSERT INTO EMPRESTIMOS VALUES('588.3.342 S4343',1,'09/09/2021','16/09/2021','16/09/2021',0);
INSERT INTO EMPRESTIMOS VALUES('588.3.342 S4343',5,'09/09/2020','16/09/2020','16/09/2020',0);

CREATE TABLE EDITORA
(IDEDITORA NVARCHAR2(8), NOME NVARCHAR2(30) NOT NULL UNIQUE, 
CIDADEESTADO NVARCHAR2(30)NOT NULL);

CREATE SEQUENCE SEQ_EDITORA; 

INSERT INTO EDITORA VALUES(SEQ_EDITORA.NEXTVAL,'LTC','SOROCABA-SP');
INSERT INTO EDITORA VALUES(SEQ_EDITORA.NEXTVAL,'CAMPUS','SOROCABA-SP');
INSERT INTO EDITORA VALUES(SEQ_EDITORA.NEXTVAL,'ERIKA','SOROCABA-SP');
INSERT INTO EDITORA VALUES(SEQ_EDITORA.NEXTVAL,'GLOBO','SOROCABA-SP');

SELECT * FROM EDITORA; 

ALTER TABLE LIVROS ADD IDEDITORA NUMBER(8);

ALTER TABLE LIVROS ADD CONSTRAINT FK_EDIT_LIVRO FOREIGN KEY(IDEDITORA) REFERENCES EDITORA (IDEDITORA);

UPDATE LIVROS SET IDEDITORA = 123  WHERE EDITORA = 'LTC';
UPDATE LIVROS SET IDEDITORA = 123 WHERE EDITORA = 'CAMPUS';
UPDATE LIVROS SET IDEDITORA = 124 WHERE EDITORA = 'ERIKA';
UPDATE LIVROS SET IDEDITORA = 125 WHERE EDITORA = 'GLOBO';



