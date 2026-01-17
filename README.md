# AWS Secure Landing Zone

AWS Secure Landing Zone is a Terraform-based project that transforms a raw AWS account into a minimally secure, audit-ready baseline environment.

It establishes foundational security controls before any workloads are deployed.
This project is designed to be the first security layer for any AWS account.

---

## What This Landing Zone Provides

* Root account protection

  * MFA required (manual enforcement)
  * Root access keys disabled (manual enforcement)

* Role-based access model

  * No IAM users
  * Access via roles only

* IAM hardening

  * Dedicated Admin role
  * Dedicated Security/Audit role
  * Dedicated Automation (Terraform/CI) role
  * Permission boundaries applied to automation roles

* Logging and visibility

  * Multi-region CloudTrail
  * Encrypted S3 log storage
  * Log file integrity validation

* Data exposure prevention

  * Account-wide S3 public access block

* Alerting foundation

  * Central SNS topic for security alerts

This is a **security baseline** for new AWS accounts.

---

## Project Structure

```
├── LICENSE
├── README.md
├── alerts
│   └── sns.tf
├── docs
│   └── remediation.md
├── iam
│   ├── permission_boundary.tf
│   ├── roles.tf
│   └── root_protection.tf
├── logging
│   ├── cloudtrail.tf
│   └── trail_bucket.tf
├── main.tf
├── outputs.tf
├── provider.tf
├── s3
│   └── public_access_block.tf
└── variables.tf
```

---

## How to Deploy

1. Create a fresh AWS account.

2. Login once as the root user and perform:

   * Enable MFA on the root account
   * Delete all root access keys
   * Store MFA recovery codes securely

3. Configure AWS credentials for Terraform.

4. Deploy the landing zone:

```bash
terraform init
terraform apply
```

---

## Security Model

This landing zone uses defense-in-depth:

| Layer                 | Purpose                          |
| --------------------- | -------------------------------- |
| Terraform             | Secure-by-default infrastructure |
| IAM Roles             | Controlled access model          |
| Permission Boundaries | Limit automation blast radius    |
| CloudTrail            | Full account visibility          |
| S3 Guardrails         | Prevent data leaks               |
| SNS                   | Centralized alerting             |

---

## Root Account Policy

Terraform cannot enforce root account security automatically.
AWS restricts automation on the root account by design.

The following must be verified manually:

* Root MFA is enabled
* Root access keys do not exist
* Root is used only for emergency access

See: `docs/remediation.md`

---

## Scope

This project provides a baseline security posture.
It does not replace:

* Full SOC monitoring
* Threat hunting
* Compliance certification

It is intended to be the **foundation layer** on which higher security levels are built.

