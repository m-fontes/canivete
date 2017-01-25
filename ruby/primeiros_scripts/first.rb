#!/usr/local/bin/ruby

=begin
Varios comentarios aqui...
Distribuidos ao longo de varias linhas
=end

# Tambem podemos usar '#' para comments de uma unica linha.

nome = "Mauricio"

puts "Imprimindo a var 'nome':" + nome

puts "Imprimindo classe e lista de metodos da var 'nome':"
puts nome.class
#puts nome.methods

# Comando 'if':
if nome == "Mauricio"
	puts "Entrou no if"
else
	puts "Entrou no else"
end

def cat(path)
        puts File.read(path)
end

cat("/tmp/teste.rb")

def ls(path)
        puts Dir.entries(path)
end

ls(".")


