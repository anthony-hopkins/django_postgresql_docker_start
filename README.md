# Django PostgreSQL Docker Starter

A production-ready Django project template with PostgreSQL database and Docker containerization. This starter kit provides a solid foundation for building Django applications with modern development practices.

## 🚀 Features

- **Django 3.2+** - Latest stable Django framework
- **PostgreSQL 13** - Robust, production-ready database
- **Docker & Docker Compose** - Containerized development environment
- **Automatic Database Waiting** - Custom management command to handle database startup
- **Production-Ready Configuration** - Optimized settings for development and production
- **Alpine Linux Base** - Lightweight container images
- **REST API Ready** - Django REST Framework included

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/downloads)

## 🛠️ Quick Start

### 1. Clone the Repository

```bash
git clone <your-repo-url>
cd django_postgresql_docker_start
```

### 2. Run the Setup Script

The setup script will create a new Django project with your desired name:

```bash
chmod +x dpds-setup.sh
./dpds-setup.sh your_project_name
```

**Note**: Replace `your_project_name` with your actual project name. The name must be unique and cannot conflict with built-in Python modules.

### 3. Navigate to Your Project

```bash
cd your_project_name
```

### 4. Start the Services

```bash
docker-compose up --build
```

### 5. Access Your Application

- **Django App**: http://localhost:8000
- **Admin Interface**: http://localhost:8000/admin

## 🏗️ Project Structure

After running the setup script, your project will have this structure:

```
your_project_name/
├── your_project_name/          # Django project directory
│   ├── __init__.py
│   ├── settings.py            # Configured for PostgreSQL
│   ├── urls.py
│   ├── wsgi.py
│   └── asgi.py
├── core/                       # Core app with utilities
│   ├── __init__.py
│   └── management/
│       └── commands/
│           └── wait_for_db.py  # Database connection handler
├── docker-compose.yml          # Service orchestration
├── Dockerfile                  # Container definition
└── requirements.txt            # Python dependencies
```

## 🔧 Configuration

### Environment Variables

The following environment variables are configured in `docker-compose.yml`:

- `DB_HOST`: Database host (default: `db`)
- `DB_NAME`: Database name (default: `dev_db`)
- `DB_USER`: Database user (default: `devuser`)
- `DB_PASS`: Database password (default: `changeme`)

### Database Settings

PostgreSQL configuration in `docker-compose.yml`:

```yaml
db:
  image: postgres:13-alpine
  environment:
    - POSTGRES_DB=dev_db
    - POSTGRES_USER=devuser
    - POSTGRES_PASSWORD=changeme
```

## 📦 Dependencies

The project includes these key Python packages:

- **Django** ≥3.2.4, <3.3 - Web framework
- **Django REST Framework** ≥3.12.4, <3.13 - API toolkit
- **psycopg2** ≥2.8.6, <2.9 - PostgreSQL adapter

## 🐳 Docker Details

### Container Features

- **Base Image**: Python 3.9 Alpine Linux
- **Security**: Non-root user (`django-user`)
- **Optimization**: Multi-stage build with dependency cleanup
- **Port**: Exposes port 8000

### Volume Mounts

- Application code is mounted for live development
- PostgreSQL data is persisted in named volumes

## 🚀 Development Workflow

### Starting Development

```bash
# Start all services
docker-compose up

# Start in background
docker-compose up -d

# View logs
docker-compose logs -f
```

### Stopping Services

```bash
# Stop all services
docker-compose down

# Stop and remove volumes
docker-compose down -v
```

### Database Operations

```bash
# Run migrations
docker-compose exec web python manage.py migrate

# Create superuser
docker-compose exec web python manage.py createsuperuser

# Access PostgreSQL shell
docker-compose exec db psql -U devuser -d dev_db
```

## 🔍 Custom Management Commands

### wait_for_db

A custom Django management command that waits for the PostgreSQL database to become available before starting the application. This prevents startup failures during container orchestration.

```python
python manage.py wait_for_db
```

## 🚨 Security Notes

- **Development Only**: This configuration is for development purposes
- **Secret Key**: Change the Django secret key in production
- **Debug Mode**: Disable DEBUG in production
- **Database Credentials**: Use strong passwords in production
- **Allowed Hosts**: Configure ALLOWED_HOSTS for production

## 🚀 Production Deployment

For production deployment, consider:

1. **Environment Variables**: Use proper secret management
2. **Static Files**: Configure static file serving
3. **Media Files**: Set up media file storage
4. **SSL/TLS**: Enable HTTPS
5. **Monitoring**: Add health checks and logging
6. **Backup**: Implement database backup strategies

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues:

1. Check the [Issues](https://github.com/your-username/your-repo/issues) page
2. Search existing discussions
3. Create a new issue with detailed information

## 🙏 Acknowledgments

- Django community for the excellent framework
- PostgreSQL team for the robust database
- Docker team for containerization tools

---

**Happy Coding! 🎉**

