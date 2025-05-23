echo "Criando as imagens........"

docker build -t rdgquaresmadev/projeto-backend:1.0 backend/.
docker build -t rdgquaresmadev/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push rdgquaresmadev/projeto-backend:1.0
docker push rdgquaresmadev/projeto-database:1.0 

echo "Criando serviços no cluster kurbetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments......"

kubectl apply -f ./deployment.yml