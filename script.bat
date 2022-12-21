echo "Criando as imagens......."

docker build -t davidmonte/projeto-backend:2.0 backend/.
docker build -t davidmonte/projeto-database:2.0 database/.

echo "Enviando as imagens para o Docker Hub........."

docker push davidmonte/projeto-backend:2.0
docker push davidmonte/projeto-database:2.0

echo "Adionando senha e banco de dados por meio do secret........."

kubectl apply -f ./secrets.yml

echo "Criando servicos no cluster kubernetes........"

kubectl apply -f ./services.yml

echo "Criando os deployments........."

kubectl apply -f ./deployment.yml