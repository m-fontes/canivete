require "./cat.rb"
require "./ls.rb"

# Agora chamando os metodos que foram definidos nos arquivos "cat.rb" e "ls.rb" incluidos acima:

#cat("/tmp/teste.rb")
#ls(".")

#puts "Checando o valor de ARGV: '#{ARGV}'"
#puts "Checando o primeiro valor do ARGV, que eh o ARGV[0]: #{ARGV[0]}"
#puts "Checando o segundo valor do ARGV, que eh o ARGV[1]: #{ARGV[1]}"

if ARGV[0] == "ls"
	# Agora o proximo argumento eh o path
	ls(ARGV[1])
elsif ARGV[1] == "cat"
	cat(ARGV[1])
end

