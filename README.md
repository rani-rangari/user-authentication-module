<div align="center">

# 🔒 ECE Authentication System - Premium

Made by **[Rani Rangari](https://linkedin.com/in/rani-rangari)** • **[EdgeCaseExchange](https://edgecaseexchange.com)**

An full-stack authentication kit featuring **OAuth2 (Google & GitHub)**, **Tokenized Magic Links**, **Security Auditing**, and a **Device Session Control Center**.

<br/>

[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)](https://spring.io/projects/spring-boot)
[![React](https://img.shields.io/badge/React-18%2B-61DAFB?style=for-the-badge&logo=react&logoColor=black)](https://react.dev/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=for-the-badge&logo=mysql&logoColor=white)](https://www.mysql.com/)

</div>

---

## 📌 Overview

The **ECE Authentication System** provides pre-configured session management, strict cookie defense routing, and real-time device session control. It seamlessly syncs social identities, issues single-use tokenized magic links, and logs granular application security audits.

---

## ✨ Key Specifications & Features

- 🔑 **OAuth2 Identity Sync:** One-click social login via Google and GitHub with account collision detection and profile synchronization.
- ✉️ **Magic Links:** Expiration-managed, single-use passwordless login sent directly to user inboxes.
- 🛡️ **Cookie Defense & Security:** Cross-origin `SameSite=Strict` HTTP-only cookie layers, JWT authentication, and fingerprint mismatch defenses.
- 📊 **Security Audit Logging:** Comprehensive application-level event history tracking logins, token requests, and privilege escalation.
- 📱 **Device Control Center:** Real-time active session management with atomic session revocation and a database kill-switch.

---

## 📁 Repository Structure

For a full breakdown of frontend and backend component directories, check out [folder-setup.md](./folder-setup.md).

```text
premium-authentication-system/
├── 📄 .env.example          # Template for required environment variables
├── 📄 architecture.md       # Technical architectural design & flow diagrams
├── 🐳 docker-compose.yml    # Multi-container orchestrator (MySQL, Backend, Frontend)
├── 📄 folder-setup.md       # Full interactive file tree breakdown
├── 📄 openapi.json          # OpenAPI / Swagger API specification
├── 🗄️ schema.sql            # Database initialization script
├── 🚀 setup.md              # Detailed local & Docker setup guide
```

## 📖 Documentation & Setup Options

- 🛠️ **Detailed Installation Guide**: For running the Spring Boot backend and Vite frontend manually outside of Docker, follow the step-by-step instructions in `setup.md`.

- 📂 **Component Architecture**: See `folder-setup.md` for a clickable layout of every Java class, React component, and endpoint controller.

- 🏛️ **System Design**: Read `architecture.md` for session lifetime details and security flowcharts.

-🔌 **API Reference**: Import `openapi.json` into Postman or Insomnia to explore the REST API schema.

## 🛡️ License & Credits

Designed & Maintained by **Rani Rangari** • Powered by **EdgeCaseExchange**.
