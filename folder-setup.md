# 📂 Project File Tree

<details>
<summary>📁 <b>frontend/src</b></summary>
<br>

* 📄 `App.tsx`
* 📄 `index.css`
* 📄 `main.tsx`

<details>
<summary>📁 <b>api</b></summary>

  * 📄 `auditService.ts`
  * 📄 `authService.ts`
  * 📄 `axiosConfig.ts`
  * 📄 `config.ts`
</details>

<details>
<summary>📁 <b>assets</b></summary>

  * 📄 `hero.png`
  * 📄 `react.svg`
  * 📄 `vite.svg`
</details>

<details>
<summary>📁 <b>components</b></summary>

  <details>
  <summary>📁 <b>audit</b></summary>

    * 📄 `AuditLogViewer.tsx`
  </details>

  <details>
  <summary>📁 <b>auth</b></summary>

    * 📄 `AuthCard.tsx`
    * 📄 `DeviceManager.tsx`
    * 📄 `ForgotPasswordForm.tsx`
    * 📄 `MagicLinkForm.tsx`
    * 📄 `OAuthButtons.tsx`
    * 📄 `PasswordForm.tsx`
    * 📄 `SecurityErrorBoundary.tsx`
    * 📄 `ThemeToggle.tsx`
  </details>

  <details>
  <summary>📁 <b>common</b></summary>

    * 📄 `Footer.tsx`
    * 📄 `Navbar.tsx`
  </details>

  <details>
  <summary>📁 <b>layout</b></summary>

    * 📄 `MainLayout.tsx`
  </details>
</details>

<details>
<summary>📁 <b>context</b></summary>

  * 📄 `AuthContext.tsx`
</details>

<details>
<summary>📁 <b>hooks</b></summary>

  * 📄 `useAuth.ts`
</details>

<details>
<summary>📁 <b>pages</b></summary>

  * 📄 `Dashboard.tsx`
  * 📄 `HomePage.tsx`
  * 📄 `LoginPage.tsx`
  * 📄 `OAuthRedirectHandler.tsx`
  * 📄 `ResetPassword.tsx`

  <details>
  <summary>📁 <b>auth</b></summary>

    * 📄 `MagicLinkRequest.tsx`
    * 📄 `MagicLinkVerify.tsx`
  </details>
</details>

<details>
<summary>📁 <b>routes</b></summary>

  * 📄 `AppRoutes.tsx`
  * 📄 `ProtectedRoute.tsx`
</details>

<details>
<summary>📁 <b>utils</b></summary>

  * 📄 `validation.ts`
</details>

</details>

<br>

<details>
<summary>📁 <b>backend/src/main/java/com/edgecaseexchange/backend/auth</b></summary>
<br>

<details>
<summary>📁 <b>config</b></summary>

  * ☕ `AppConfig.java`
  * ☕ `CustomOAuth2SuccessHandler.java`
  * ☕ `SecurityConfig.java`
</details>

<details>
<summary>📁 <b>controller</b></summary>

  * ☕ `AuthController.java`
  * ☕ `MagicLinkController.java`
</details>

<details>
<summary>📁 <b>dto</b></summary>

  * ☕ `AuthResponse.java`
  * ☕ `DeviceSessionResponse.java`
  * ☕ `ForgotPasswordRequest.java`
  * ☕ `LoginRequest.java`
  * ☕ `MagicLinkRequest.java`
  * ☕ `ResetPasswordRequest.java`
  * ☕ `SignupRequest.java`
  * ☕ `UserProfileResponse.java`
</details>

<details>
<summary>📁 <b>exception</b></summary>

  * ☕ `AccountCollisionException.java`
  * ☕ `AuthException.java`
  * ☕ `FingerprintMismatchException.java`
  * ☕ `GlobalExceptionHandler.java`
  * ☕ `MagicLinkAlreadyConsumedException.java`
  * ☕ `MaxSessionsExceededException.java`
  * ☕ `OAuth2SyncException.java`
  * ☕ `SessionRevokedException.java`
  * ☕ `TokenExpiredException.java`
  * ☕ `UserNotFoundException.java`
</details>

<details>
<summary>📁 <b>model</b></summary>

  * ☕ `AuditLog.java`
  * ☕ `AuthProvider.java`
  * ☕ `DeviceSession.java`
  * ☕ `User.java`
</details>

<details>
<summary>📁 <b>repository</b></summary>

  * ☕ `AuditLogRepository.java`
  * ☕ `DeviceSessionRepository.java`
  * ☕ `UserRepository.java`
</details>

<details>
<summary>📁 <b>security</b></summary>

  * ☕ `JwtAuthenticationFilter.java`
  * ☕ `JwtUtil.java`
  * ☕ `SecurityUtils.java`
  * ☕ `SessionFingerprintFilter.java`
</details>

<details>
<summary>📁 <b>service</b></summary>

  * ☕ `AuditLogService.java`
  * ☕ `AuthService.java`
  * ☕ `EmailService.java`
</details>

</details>