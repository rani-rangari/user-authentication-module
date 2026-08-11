-- =============================================================================
-- Premium Authentication Starter Kit - Database Schema
-- Package: com.edgecaseexchange.backend.auth.model
-- Database Target: MySQL 8.0+
-- =============================================================================

SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS security_audit_logs;
DROP TABLE IF EXISTS user_device_sessions;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS = 1;

-- =============================================================================
-- Table: users
-- Entity: com.edgecaseexchange.backend.auth.model.User
-- Description: Core identity store for local credentials, OAuth2, & magic links
-- =============================================================================

CREATE TABLE IF NOT EXISTS users (
    id                      BIGINT AUTO_INCREMENT PRIMARY KEY,
    full_name               VARCHAR(255) NOT NULL,
    email                   VARCHAR(255) NOT NULL,
    password                VARCHAR(255) NULL,
    provider                VARCHAR(50)  NOT NULL DEFAULT 'LOCAL',
    provider_id             VARCHAR(255) NULL,
    
    -- Passwordless Magic Link Credentials
    magic_token             VARCHAR(255) NULL,
    magic_token_expiry      DATETIME     NULL,
    magic_token_fingerprint VARCHAR(255) NULL,
    magic_token_consumed    BOOLEAN      NOT NULL DEFAULT FALSE,
    
    -- Password Reset Flow
    reset_token             VARCHAR(255) NULL,
    reset_token_expiry      DATETIME     NULL,
    
    -- Security & Account Lifecycle State
    token_version           INT          NOT NULL DEFAULT 0,
    failed_attempts         INT          NOT NULL DEFAULT 0,
    is_enabled              BOOLEAN      NOT NULL DEFAULT TRUE,
    is_locked               BOOLEAN      NOT NULL DEFAULT FALSE,
    lock_time               DATETIME     NULL,
    
    -- Timestamps
    created_at              DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at              DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Table Constraints
    CONSTRAINT uk_users_email UNIQUE (email),
    CONSTRAINT uk_users_magic_token UNIQUE (magic_token),
    CONSTRAINT uk_users_reset_token UNIQUE (reset_token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Performance Indexes for Authentication Lookups
CREATE INDEX idx_users_provider ON users(provider, provider_id);

-- =============================================================================
-- Table: user_device_sessions
-- Entity: com.edgecaseexchange.backend.auth.model.DeviceSession
-- Description: Tracks active hardware sessions, token hashes, and device fingerprints
-- =============================================================================

CREATE TABLE IF NOT EXISTS user_device_sessions (
    id                    BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id               BIGINT       NOT NULL,
    hashed_refresh_token  VARCHAR(255) NOT NULL,
    refresh_token_hash    VARCHAR(255) NULL,
    ip_address            VARCHAR(45)  NULL,
    user_agent            TEXT         NULL,
    device_type           VARCHAR(50)  NULL,
    os                    VARCHAR(50)  NULL,
    fingerprint_hash      VARCHAR(255) NOT NULL,
    is_revoked            BOOLEAN      NOT NULL DEFAULT FALSE,
    last_active_at        DATETIME     NOT NULL,
    expires_at            DATETIME     NOT NULL,
    created_at            DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign Key Constraints
    CONSTRAINT fk_sessions_user FOREIGN KEY (user_id) 
        REFERENCES users (id) ON DELETE CASCADE,

    -- Unique Constraints
    CONSTRAINT uk_sessions_hashed_refresh_token UNIQUE (hashed_refresh_token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Performance Indexes for Authentication & Hardware Fingerprint Filters
CREATE INDEX idx_sessions_user_revoked ON user_device_sessions(user_id, is_revoked);
CREATE INDEX idx_sessions_fingerprint ON user_device_sessions(fingerprint_hash);
CREATE INDEX idx_sessions_expires_at ON user_device_sessions(expires_at);

-- =============================================================================
-- Table: security_audit_logs
-- Entity: com.edgecaseexchange.backend.auth.model.AuditLog
-- Description: Immutable event trail for security audits, device revocations, and IP tracking
-- =============================================================================

CREATE TABLE IF NOT EXISTS security_audit_logs (
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id            BIGINT        NULL,
    email              VARCHAR(255)  NOT NULL,
    action             VARCHAR(100)  NOT NULL,
    severity           VARCHAR(20)   NOT NULL DEFAULT 'INFO',
    ip_address         VARCHAR(45)   NULL,
    user_agent         TEXT          NULL,
    device_fingerprint VARCHAR(255)  NULL,
    details            VARCHAR(2000) NULL,
    timestamp          DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- Foreign Keys
    CONSTRAINT fk_audit_user FOREIGN KEY (user_id) 
        REFERENCES users (id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE INDEX idx_audit_email_timestamp ON security_audit_logs(email, timestamp);
CREATE INDEX idx_audit_user_id ON security_audit_logs(user_id);