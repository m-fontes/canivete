# canivete
Useful stuff

docker run -it --name ubuntutest ubuntu:16.10 bash ==> este comando criou um novo container e deixa o container rodando.
docker run -it --name ubuntutest2 ubuntu:16.10 ==> este tbm
docker run --detach -it --name ubuntutest3 ubuntu:16.10 ==> rodando em background, modo detached. Sem logar
 |_ quando não rodamos com "-d", ele loga, e ao sairmos, o container para. O próximo 'docker start' inicializa e deixa o cont rodando.
 |_ quando usamos '-d', ele starta e deixa rodando em background. Pra logar nele depois, 'docker exec -it <name> <comando>'


