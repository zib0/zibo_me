#!/bin/bash

# Retrive Auth Token
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/d7x7t8e7

# Build docker with tag
docker build -t amazonlinux2-ruby3 .

# Tag image
docker tag amazonlinux2-ruby3:latest public.ecr.aws/d7x7t8e7/amazonlinux2-ruby3:latest

# Push to ECR
docker push public.ecr.aws/d7x7t8e7/amazonlinux2-ruby3:latest