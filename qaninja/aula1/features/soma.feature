#language:pt

Funcionalidade: Somar valores
	Esquema do Cenário: Somar os dois valores passados
	
	Quando somamos <valor1> e <valor2>
	Entao o resultado deve ser <soma>

	Exemplos:
		| valor1 | valor2 | soma |
		| 2      | 2      | 4    |
		| 3      | 14     | 17   |
		| 25     | 50     | 75   |
		| 1024   | 1024   | 2048 |

