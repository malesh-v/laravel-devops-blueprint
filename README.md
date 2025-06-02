# Laravel DevOps Blueprint

> Transition from Magento Developer to DevOps Engineer through a real pet project.

## Stack
- Laravel
- Docker
- GitHub Actions
- AWS (EC2)
- Terraform
- Ansible
- Prometheus + Grafana

# 🚀 Setup / Installation
## 1. Clone the repository:
```bash
git clone https://github.com/yourusername/laravel-devops-blueprint.git
cd laravel-devops-blueprint
```

## 2. Create your Docker environment file:
```bash
cp .env.example .env
```
Edit .env to set your database credentials. Replace the placeholder values with secure ones.

## 3. Create the Laravel environment file:
```bash
cp laravel-app/.env.example laravel-app/.env
```
Ensure that the database configuration in laravel-app/.env matches your Docker environment:

## 4. Start the Docker containers:
```bash
docker-compose up -d --build
```
