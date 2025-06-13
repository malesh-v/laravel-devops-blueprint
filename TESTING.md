# 🧪 Manual Testing Scenarios

🧑🏻‍💻 This file contains some manual testing instructions.

---

## 👉🏻 Test: CPU Alert Triggered by `laravel_app`

**🎯 Goal:** Simulate CPU load in the `laravel_app` container to trigger a Prometheus alert.

**Install `stress` tool in the container:**
   ```bash
   docker exec -it laravel_app apt update && apt install -y stress
   ```
**Trigger CPU load:**
   ```bash
   docker exec -it laravel_app stress --cpu 2 --timeout 60
   ```
### ✅ Expected:
Prometheus evaluates the alert rule.
Alert shows in Alertmanager UI at http://localhost:9093.
Email notification appears in MailHog at http://localhost:8025.

---

## 👉🏻 Test: Laravel Sends Email to MailHog

**🎯 Goal:** Manually trigger an email from Laravel and confirm it appears in MailHog.

**Go into container**
```
docker-compose exec app php artisan tinker
```
**In Tinker run**
```
use Illuminate\Support\Facades\Mail;
Mail::raw('This is a test email', function ($message) {
    $message->to('test@example.com')->subject('Test Mail');
});
```
### ✅ Expected:
Email appears in MailHog Web UI at http://localhost:8025.

### 💡 Notes
- MailHog listens on port 1025 for SMTP, and on port 8025 for Web UI.
- The Laravel mail config (MAIL_HOST=mailhog, MAIL_PORT=1025) should be set correctly in your laravel's .env file.
