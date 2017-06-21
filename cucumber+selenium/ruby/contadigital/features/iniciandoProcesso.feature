# language: pt

Funcionalidade: Iniciar processo de abertura de conta com novo CPF

	Cenário: Inserindo CPF pela primeira vez
	Dado que tenho acesso ao Abertura de Conta Digital em "http://localhost:9001"
	Quando eu acessar a pagina, clicar "Continuar" e inserir o CPF "84263222717"
	Então vou clicar "Continuar"
	E serei redirecionado ao início do processo de abertura de contas

