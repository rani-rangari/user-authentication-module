# 🛠️ Project Setup & Installation Guide

Welcome to the project! Follow the steps below to get your development environment up and running either using **Docker Compose** (recommended) or as a **Local Manual Setup**.

---

## 🚀 Quick Start

Choose your preferred setup method:

<details>
<summary>🐳 <b>Option 1: Run with Docker Compose (Recommended & Fastest)</b></summary>

<br>

### Prerequisites
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running.

### Step 1: Copy Environment Variables
Create your local environment file by copying the template:
```bash
cp .env.example .env
```

### Step 2: Start all Containers
Build and launch MySQL, Spring Boot Backend, and Nginx Frontend in detached mode:

```bash
docker compose up --build -d
```

### Step 3: Access the Application

- Frontend Application: `http://localhost:3000`
- Backend API Health Check: `http://localhost:8080/api/health` (or root context)
- MySQL Database: Accessible externally at `localhost:3309`

To stop all services:

```bash
docker compose down
```

## Prerequisites

- Java 21 JDK installed (java -version)
- Node.js 22+ and npm installed (node -v)
- MySQL 8.0 server running locally on `localhost:3306`
- Maven 3.9+ (or use the included ./mvnw wrapper)

### Step 1: Database Setup  
Ensure MySQL is running and create the local database:

```bash
CREATE DATABASE `ece-auth-premium`;
```

### Step 2: Backend Setup (Spring Boot)  
Navigate to the backend directory:

```bash
cd backend
```

Run the application using the local profile:

```bash
mvn clean spring-boot:run -Dspring-boot.run.profiles=local
```

The backend will start on `http://localhost:8080`.

### Step 3: Frontend Setup (React / Vite)
Open a new terminal tab and navigate to the frontend directory:

```bash
cd frontend
```

Install npm dependencies:

```bash
npm install
```

Start the Vite development server:

```bash
npm run dev
```

The frontend dev server will start on `http://localhost:5173`

## 📄 Project Structure & Environment Details

- `.env.example`: Template containing all environment variable keys.

- `application-local.properties`: Default Spring Boot profile for local machine execution (`localhost:5173`).

- `application-docker.properties`: Spring Boot profile executed automatically inside Docker (`http://localhost:3000`).