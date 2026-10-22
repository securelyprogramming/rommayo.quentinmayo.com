<p align="center"><img src="public/og.svg" alt="Rommayo — Your library, your devices" width="100%"></p>

# Rommayo · The website

**[Visit rommayo.quentinmayo.com](https://rommayo.quentinmayo.com)** for product details, setup and compatibility notes.

A public, login-free Next.js website for Rommayo. Dark library-inspired design, original fictional cover art, responsive layouts and an interactive preview. No games, BIOS files, server credentials, analytics or visitor accounts are included.

The companion app lives at **[quentinmayo/Rommayo](https://github.com/quentinmayo/Rommayo)**. Android uses native library screens; desktop uses Electron. Browser-based emulation and Full RomM use the upstream web interface.

## Run locally

```sh
npm ci
npm run dev
```

`npm run build` creates a static export in `out/`. The Docker image builds the Next.js source and serves it with unprivileged Nginx on port **8080**. No production Node server or environment secrets are required by the public site.

## Deploy with Coolify

Use a dedicated project and a public Git application, branch `main`, Dockerfile build pack, `/Dockerfile`, exposed port `8080`, health check `/`, and the HTTPS production domain above. The app runs independently of the upstream game service.

The repository's workflow calls the organization's pinned centralized security workflow, runs the production build and dependency audit, and requests a Coolify deployment only after both pass on `main`. Configure repository variable `COOLIFY_APPLICATION_UUID` and secret `COOLIFY_API_TOKEN`; credentials never go into the source or browser bundle. Organization onboarding attaches the shared security configuration and runner access.

## Security & responsibility

Centralized scans include CodeQL plus centralized secret detection, dependency, infrastructure and workflow analysis as provided by `securelyprogramming/security-workflows`. A configured workflow is not proof that a particular scan has passed; inspect the latest Actions results and Security tab.

Use only content you are authorized to access. Downloads and use are at your own risk. This independent companion is not affiliated with upstream projects or Valve. No third-party ROM sourcing is supported. Website code is MIT licensed; upstream applications, runtimes and emulator cores retain their own licenses.
