# Runbook: Service Name

**Service:** service-name

**On-call contact:** @github-handle or rotation name

**Last updated:** YYYY-MM-DD

---

## SLO definition

<!-- List at least one numeric SLO target for this service. -->
<!-- Format: [metric] [comparator] [threshold] measured over [window] -->

| SLO | Target | Measurement window |
|---|---|---|
| Availability | >= 99.5% | 30-day rolling |
| p95 response time | <= 500 ms | 1-hour rolling |

---

## Health checks

**Liveness endpoint:** `GET /healthz`

Expected response: `200 OK` with body `{"status": "ok"}`

**Readiness endpoint:** `GET /readyz`

Expected response: `200 OK` with body `{"status": "ready"}`

---

## Common alerts

### Alert: High error rate

**Condition:** Error rate exceeds 1% over a 5-minute window.

**Diagnostic steps:**

1. Check application logs for error patterns.
2. Check upstream dependencies for degradation.
3. Check recent deployments in the CI run history.

**Resolution:** Roll back if a recent deployment correlates with the error spike. Otherwise escalate.

---

### Alert: High latency

**Condition:** p95 response time exceeds 500 ms over a 5-minute window.

**Diagnostic steps:**

1. Check database query performance.
2. Check external API response times.
3. Check resource utilisation (CPU, memory) on the service.

**Resolution:** Scale horizontally if resource-constrained. Investigate slow queries if database is the bottleneck.

---

### Alert: Service unreachable

**Condition:** Liveness or readiness probe fails for 2 consecutive checks.

**Diagnostic steps:**

1. Check the deployment status in the CI/CD pipeline.
2. Check infrastructure logs for restart or crash events.
3. Attempt manual health check.

**Resolution:** Restart the service if in a crash loop. Roll back the last deployment if restart fails.

---

## Rollback procedure

1. Identify the last known good release tag in the CI run history.
2. Trigger a deployment of that release.
3. Verify health checks pass after deployment.
4. Create a post-incident issue in the repository with the timeline and root cause.

---

## Contacts

| Role | Contact |
|---|---|
| Primary on-call | |
| Secondary on-call | |
| Escalation | |
