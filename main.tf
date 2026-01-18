# AWS Secure Landing Zone
#
# This root module initializes the security baseline of an AWS account.
# It wires together:
# - IAM foundation
# - Permission boundaries
# - CloudTrail logging
# - S3 guardrails
# - Security alerting (SNS)
#
# All security logic lives inside subdirectories.
