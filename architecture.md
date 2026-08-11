# 🏛️ System Architecture & Security Design

This document outlines the technical architecture, security protocols, and system flows of the **ECE Authentication System - Premium**.

---

## 1. High-Level System Architecture

The application is structured into three main layers: a React Single-Page Application (served via Nginx), a Spring Boot REST API, and a MySQL relational database.

```mermaid
graph TD
    Client[Browser / User Agent]
    
    subgraph Frontend Layer [Docker Container: ece-frontend]
        Nginx[Nginx Reverse Proxy :3000]
        ReactApp[React 18 + Vite Static SPA]
    end

    subgraph Backend Layer [Docker Container: ece-backend]
        SpringBoot[Spring Boot 3 REST API :8080]
        SpringSecurity[Spring Security & OAuth2 Filter Chain]
        JwtUtil[JWT & Session Fingerprint Manager]
    end

    subgraph Storage Layer [Docker Container: eceauth-mysql]
        MySQL[(MySQL 8.0 Database :3306)]
    end

    Client -->|HTTP/HTTPS Request| Nginx
    Nginx -->|Serves Static Files| ReactApp
    Nginx -->|Proxies /api/* Requests| SpringBoot
    SpringBoot --> SpringSecurity
    SpringSecurity --> JwtUtil
    SpringBoot -->|JPA / JDBC| MySQL
```

## 2. OAuth2 & JWT Session Authentication Flow

This diagram illustrates how users authenticate via Google or GitHub, receive an HTTP-Only cookie, and establish a session tracked in the database.

```mermaid
sequenceDiagram
    autonumber
    actor User as User Browser
    participant FE as React Frontend (Nginx)
    participant BE as Spring Boot Backend
    participant OAuth as OAuth Provider (Google/GitHub)
    participant DB as MySQL Database

    User->>FE: Click "Login with Google/GitHub"
    FE->>BE: Redirect to /oauth2/authorization/{provider}
    BE->>OAuth: Redirect to Authorization Endpoint
    OAuth-->>User: Prompt for User Credentials & Consent
    OAuth-->>BE: Redirect to Callback with Auth Code
    
    Note over BE: CustomOAuth2SuccessHandler
    BE->>DB: Fetch or Create User Entity
    BE->>DB: Create Active DeviceSession Record
    BE->>BE: Generate Signed JWT Token & Session Fingerprint
    BE-->>User: Set HTTP-Only Cookie & Redirect to /oauth/callback
    User->>FE: Access Protected Route (/dashboard)
    FE->>BE: API Request with Auth Cookie
    BE->>BE: JwtAuthenticationFilter Validates Token & Fingerprint
    BE-->>FE: Returns Requested Data
``` 
