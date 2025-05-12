# TP1 B3 DevOps

## Summary

- [Description](#description)
- [Start the project](#start-the-project)
  - [1. Clone the project](#1-clone-the-project)
  - [2. Fill the .env file](#2-fill-the-env-file)
  - [3. Build the project](#3-build-the-project)
  - [4. Run the project](#4-run-the-project)
  - [5. Test the project](#5-test-the-project)
  - [6. Stop the project](#6-stop-the-project)
- [Context](#context)

## Description

This project is a simple HTTP server that returns the header of the request in JSON format.

## Start the project

### 1. Clone the project

```bash
git clone https://github.com/Wiibleyde/tp1-b3-devops.git
```
### 3. Build the project

```bash
cargo build --release
```

Alternatively, you can run the project in debug mode:

```bash
export "PING_LISTEN_PORT=8000" && cargo run
```

### 4. Run the project

```bash
export "PING_LISTEN_PORT=8001" && ./target/release/TP1
```

### 5. Test the project

```bash
curl http://localhost:8080
```

This should return the header of your request (in JSON format).

### 6. Stop the project

```bash
# Press Ctrl+C
```

## Context

This project was made for the B3 DevOps course at Ynov Campus.

## Analysis 

```bash
~ trivy image wiibleyde/tp-devops:latest
2025-05-12T09:36:07+02:00	INFO	[vuln] Vulnerability scanning is enabled
2025-05-12T09:36:07+02:00	INFO	[secret] Secret scanning is enabled
2025-05-12T09:36:07+02:00	INFO	[secret] If your scanning is slow, please try '--scanners vuln' to disable secret scanning
2025-05-12T09:36:07+02:00	INFO	[secret] Please see also https://trivy.dev/v0.61/docs/scanner/secret#recommendation for faster secret detection
2025-05-12T09:36:07+02:00	INFO	Number of language-specific files	num=0
2025-05-12T09:36:07+02:00	WARN	[report] Supported files for scanner(s) not found.	scanners=[vuln]
2025-05-12T09:36:07+02:00	INFO	[report] No issues detected with scanner(s).	scanners=[secret]

Report Summary

┌────────┬──────┬─────────────────┬─────────┐
│ Target │ Type │ Vulnerabilities │ Secrets │
├────────┼──────┼─────────────────┼─────────┤
│   -    │  -   │        -        │    -    │
└────────┴──────┴─────────────────┴─────────┘
Legend:
- '-': Not scanned
- '0': Clean (no security findings detected)

```