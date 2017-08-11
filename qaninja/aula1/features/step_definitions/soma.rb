# encoding:utf-8

Quando(/^somamos (\d+) e (\d+)$/) do |valor1, valor2|
	# '@result', comecando com '@', para que a variavel persista durante os steps todos!
	@result = valor1.to_i + valor2.to_i
end

Entao(/^o resultado deve ser (\d+)$/) do |soma|
	# expect() eh uma chamada do rspec, uma gem do ruby
	expect(@result).to eql soma.to_i
end

