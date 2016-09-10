# canivete
Useful stuff

docker run -it --name ubuntutest ubuntu:16.10 bash ==> este comando criou um novo container e deixa o container rodando.
docker run -it --name ubuntutest2 ubuntu:16.10 ==> este tbm
docker run --detach -it --name ubuntutest3 ubuntu:16.10 ==> rodando em background, modo detached. Sem logar
 |_ quando não rodamos com "-d", ele loga, e ao sairmos, o container para. O próximo 'docker start' inicializa e deixa o cont rodando.
 |_ quando usamos '-d', ele starta e deixa rodando em background. Pra logar nele depois, 'docker exec -it <name> <comando>'
 
 No container, se não tiver um processo rodando, o container encerra. Uma possibilidade é passar um comando "sleep" no final, para deixar o container no ar.
 
 ToDo: organizar este repo de acordo com tool/aplicação:
 Docker
 Jenkins
 Git
 Linux
 etc...

Opções de 'docke run' podem limitar memória, CPU, acesso a operações no host....útil em produção

"--link": para um container conhecer o outro pelo hostname. Vai ser deprecado.

"-p" com só uma porta pega uma porta aleatório de número alto no host, e associa à que for passada como parâmetro.



