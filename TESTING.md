# 🧪 Manual Testing Scenarios

This file contains some manual testing instructions.

---

## ✅ Test: CPU Alert Triggered by `laravel_app`

**Goal:** Simulate CPU load in the `laravel_app` container to trigger a Prometheus alert.

**Install `stress` tool in the container:**
   ```bash
   docker exec -it laravel_app apt update && apt install -y stress
   ```
**Trigger CPU load:**
   ```bash
   docker exec -it laravel_app stress --cpu 1 --timeout 60
   ```
### ✅ Expected:
Prometheus evaluates the alert rule.
Alert shows in Alertmanager UI at http://localhost:9093.
Email notification appears in MailHog at http://localhost:8025.

## ✅ Test: Laravel Sends Email to MailHog
```
docker-compose exec app php artisan tinker
```
In Tinker
```
use Illuminate\Support\Facades\Mail;
Mail::raw('This is a test email', function ($message) {
    $message->to('test@example.com')->subject('Test Mail');
});
```
### ✅ Expected:
Email appears in MailHog Web UI at http://localhost:8025.