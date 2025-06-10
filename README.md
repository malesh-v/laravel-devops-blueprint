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
Ensure that the database configuration in laravel-app/.env matches your Docker environment.

## 4. Configure the Laravel environment file for using redis:
```bash
CACHE_DRIVER=redis
SESSION_DRIVER=redis
REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379
```

## 5. Start the Docker containers:
```bash
docker-compose up -d --build
```

## Configure Grafana
1. Open Grafana in your browser at port `3000` (e.g., http://localhost:3000).  
2. Go to **Dashboards** → **New** → **Import**.  
3. Enter the dashboard ID (e.g., `1860`) and click **Load**.  
4. Click **Configure new source** in the data source selection.  
5. Select **Prometheus** from the list.  
6. Enter the Prometheus URL, usually `http://prometheus:9090` (or `http://localhost:9090` if local).  
7. Click **Save and Test** to verify connection.  
8. After success, go to **Dashboards** → **New** → **Import** again.  
9. Enter the dashboard ID, select the newly added Prometheus data source, then click **Import**.

## Configure Mailhog
⚙️ Laravel .env Settings
Update your .env in laravel-app/.env:
```
MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS=example@example.com
MAIL_FROM_NAME="${APP_NAME}"

```

# 🚑 Troubleshooting
## 🔐 Database connection fails after changing .env
If you updated database credentials in .env after initial setup, MySQL will still use old credentials because the data volume persists.

Reset the database volume:
```bash
docker-compose down -v
docker-compose up -d --build
```
> [!CAUTION]
> This will delete all database data! Use only in development.

## 🐘 Can't connect to MySQL from Laravel
Ensure Laravel and MySQL containers share the same Docker network.


# 🐳 Useful Docker commands
```bash
docker-compose up -d --build                  # Build and start containers
docker-compose down -v                        # Stop and remove containers + volumes
docker-compose logs -f                        # Follow container logs
docker-compose exec app bash                  # Open shell inside Laravel container
docker-compose exec app php artisan migrate   # Run migrations
```
