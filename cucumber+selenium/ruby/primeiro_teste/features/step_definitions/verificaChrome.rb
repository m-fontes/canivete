# encoding: utf-8

Dado(/^que o computador tenha o Google Chrome instalado$/) do
	`ls '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'`
	if $?.to_i == 0
		puts "Google Chrome disponível no sistema"
	else
		puts "*** Erro - Google Chrome nao foi encontrado"
		exit
	end
end
