# WSDocker Project

This repository contains a Docker-based setup for running a simple PHP website with database initialization, along with developer resources and a Jenkins configuration.

---

## 📂 Project Structure

```
wsdocker/
├── db-init/                 # Database initialization scripts
│   └── init.sql
│
├── developer-area/          # Development workspace (mirrors production setup)
│   ├── db-init/
│   │   └── init.sql
│   ├── docker-compose.yaml
│   ├── Dockerfile
│   └── website/
│       ├── config.php
│       ├── index.php
│       └── index.php.bkp
│
├── website/                 # Website source code (production)
│   ├── config.php
│   ├── index.php
│   └── index.php.bkp
│
├── wsjenkins/               # Jenkins CI/CD setup
│   └── docker-compose.yml
│
├── docker-compose.yaml      # Main compose file for project
└── Dockerfile               # Base image build for web service
```

---

## 🚀 Getting Started

### 1. Clone Repository

```bash
git clone https://github.com/uat-corextech/wsdocker.git
cd wsdocker
```

### 2. Build and Run Services

Using Docker Compose:

```bash
docker-compose up -d --build
```

This will:

* Build the PHP application image from `Dockerfile`.
* Initialize the database with `db-init/init.sql`.
* Start the website service defined in `docker-compose.yaml`.

### 3. Access the Application

* **Website**: [http://localhost:8080](http://localhost:8080) (example port — confirm with your compose file)
* **Database**: available internally via Docker network

---

## 🛠 Development Setup

For development, use the `developer-area/` which mirrors the production environment, developer will change version and push code

Required remote repository configured on developer machine

```bash
git add .
git commit . -m "define version commit"
git push
```

---

## 🔧 Jenkins Integration

The `wsjenkins/` directory contains a Jenkins Docker Compose file. This can be used to set up a Jenkins instance for CI/CD pipelines:

```bash
cd wsjenkins
docker-compose up -d
```

Jenkins will run on the configured port (default: `8080` inside container; check `wsjenkins/docker-compose.yml`).

---

## 📜 Database Initialization

* SQL scripts in `db-init/init.sql` will be executed when the database container is first started.
* You can add more `.sql` files to initialize tables, schema, or seed data.

---

## 📂 Website Source

The website is a simple PHP-based app:

* `index.php` — main entry point
* `config.php` — configuration file (database credentials, etc.)
* `index.php.bkp` — backup copy of the homepage

During development, modify files under `developer-area/website/` and rebuild containers to test changes.

---

## 🧹 Cleanup

To stop and remove containers, networks, and volumes:

```bash
docker-compose down -v
```

---

## 📌 Notes

* Ensure Docker and Docker Compose are installed.
* File permissions under `website/` allow editing by user `tushar`.
* Use separate `.env` file for sensitive environment variables in production.

---

## 🔮 Future Improvements

* Add CI/CD pipeline in Jenkins for automated deployment.
* Use named volumes for database persistence.
* Secure credentials via Docker secrets or environment variables.
* Add Nginx/Apache reverse proxy for production deployment.

