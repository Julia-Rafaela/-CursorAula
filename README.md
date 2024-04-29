Criar uma UDF (Function) cuja entrada é o código do curso e, com um cursor, monte uma
tabela de saída com as informações do curso que é parâmetro de entrada.
(Código_Disciplina | Nome_Disciplina | Carga_Horaria_Disciplina | Nome_Curso)
==============================================
Tabela Curso
Codigo Nome Duracao
48 Análise e Desenvolvimento de Sistemas 2880
51 Logistica 2880
67 Polímeros 2880
73 Comércio Exterior 2600
94 Gestão Empresarial 2600
==============================================
Tabela Disciplinas
Codigo Nome Carga_Horaria
ALG001 Algoritmos 80
ADM001 Administração 80
LHW010 Laboratório de Hardware 40
LPO001 Pesquisa Operacional 80
FIS003 Física I 80
FIS007 Físico Química 80
CMX001 Comércio Exterior 80
MKT002 Fundamentos de Marketing 80
INF001 Informática 40
ASI001 Sistemas de Informação 80
==============================================
Tabela Disciplina_Curso
Codigo_Disciplina Codigo_Curso
ALG001 48
ADM001 48
ADM001 51
ADM001 73
ADM001 94
LHW010 48
LPO001 51
FIS003 67
FIS007 67
CMX001 51
CMX001 73
MKT002 51
MKT002 94
INF001 51
INF001 73
ASI001 48
ASI001 94
==============================================
