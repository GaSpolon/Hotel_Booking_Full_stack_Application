#!/bin/bash

echo "Iniciando o Minikube"
minikube start

echo "Habilitando o Ingress"
minikube addons enable ingress

echo "Construindo as imagens Docker"
docker build -t lakeside-db:latest ./Database
docker build -t lakeside-backend:latest "./Backend [Springboot]/lakeside_hotel"
docker build -t lakeside-frontend:latest "./Frontend_React_JS/lakeside_hotel"

echo "Carregando as imagens"
minikube image load lakeside-db:latest
minikube image load lakeside-backend:latest
minikube image load lakeside-frontend:latest

echo "Instalando o Helm Chart"
helm install lakeside-release ./helm-chart

echo "Etapa concluída"