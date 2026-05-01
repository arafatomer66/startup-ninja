# 🥷 Startup Ninja

> **The operating system for early-stage founders.**
> Stop juggling 17 spreadsheets — run your startup from one place.

[**🌐 Live demo →**](https://arafatomer66.github.io/startup-ninja/)

Startup Ninja turns the seven essential startup playbooks (Formation, HR, SOPs, Product, Procurement, Business, Finance) into **75 interactive trackers** you actually fill in — and then auto-generates a beautiful **Startup Blueprint** PDF you can hand to investors, co-founders, or your own future self.

Built mobile-first, responsive everywhere, fully offline-capable.

---

## ✨ What's inside

### 7 Kits · 75 Trackers · 8 UX patterns
Every operational template a small startup needs, distilled from real Bangladesh-market kits and made fillable.

| Kit | What you get |
|---|---|
| 🏛️ **Formation** | Vision/Mission, Org chart, Licenses, Policies, Team roster, JDs, Skill Matrix, **7 RACI matrices**, **5 department-activity catalogs** |
| 👥 **HR** | Candidate DB, Interview scorecards, Onboarding checklist (14 items), Document tracker, Verification, Confirmation, Resignation, Travel NOC, Release letter, Payroll |
| 📋 **SOPs** | **14 standard operating procedures** spanning 1,288 process steps — HR, Sales, Finance, Engineering, Infra, QA, Compliance, Legal, and more |
| 🚀 **Product** | Product catalog, Quarterly + weekly roadmaps, BRD, Customer surveys, Competitor SWOT, Project tracker, Issue tracker |
| 🛒 **Procurement** | Approval matrix, Vendor scoring, Price comparison, Requisitions, Office supplies, Asset register & tracking |
| 💼 **Business** | Industry analysis, Customer scoring matrix, Partner evaluation, Sales pitch builder (EN+BN), Pitch feedback |
| 💰 **Finance** | Editable monthly **P&L**, Product revenue, OPEX, CAPEX, Ad spend, Revenue plan, Team cost — with **Conservative / Base / Optimistic** scenarios |

### 📄 Startup Blueprint
After you fill things in, hit **Generate Blueprint** and get:
- **Health score** (0–100) across completion, data depth, and financial sanity
- **What's missing** — auto-detected gaps tap straight to the fix
- **Year-1 Financials** snapshot — revenue, OPEX, profit, runway
- **Per-kit narrative** — every filled tracker rendered as a readable summary, not raw tables
- **Investor Pitch mode** — same data condensed to a 6-slide deck (Problem → Solution → Market → Why Us → Traction → Ask)
- **Multi-page PDF export** — share-ready in one tap

### 🎯 Smart guidance
- **"What to do next"** card on the home screen surfaces your highest-impact incomplete tracker
- **Auto-completion** — sections flip to "done" when you write your first record
- **Scenario planning** — Finance grids let you toggle Conservative / Base / Optimistic and see the impact instantly

---

## 🛠️ Built with

- **Flutter 3.38** — single codebase for iOS, Android, web, macOS, Windows, Linux
- **GetX** for routing + state management (no boilerplate, no controllers)
- **GetStorage** for fully offline persistence (your data never leaves your device — yet)
- **`pdf` + `printing`** for the Blueprint PDF export
- **Google Fonts** (Plus Jakarta Sans) + a refined design system (typography scale, layered shadows, kit-tinted glows, hover/press micro-interactions)
- **Responsive layout** — adapts from 320px phone to 1440px desktop with proper grids, max-widths, and hover states

---

## 🚀 Run it locally

```bash
git clone https://github.com/arafatomer66/startup-ninja.git
cd startup-ninja
flutter pub get
flutter run -d chrome    # or -d ios / -d android / -d macos
```

Requires Flutter 3.38+. No backend setup, no API keys, nothing to configure — your data lives in the browser/device.

---

## 🌐 Deploy

Already wired up. Push to `main` and **GitHub Actions** auto-builds the web bundle and deploys to GitHub Pages with the right `base-href`, PWA offline-first strategy, and a 404 fallback for deep links. Configuration lives in `.github/workflows/deploy.yml`.

To set up on your own fork:
1. Repo **Settings → Pages → Source: GitHub Actions**
2. Push to `main`
3. Site goes live at `https://<you>.github.io/<repo>/`

---

## 🗺️ What's next — Phase 2

Single-user offline tool → **multi-tenant SaaS for small Bangladeshi startups**.

- **Multi-user** — invite teammates, assign records, comments, @mentions, activity feed
- **Real-time sync** via Supabase Postgres + Realtime
- **Roles & permissions** — Finance/HR/Payroll gated to Admin+
- **Approval workflows** — the Procurement Approval Matrix becomes a real workflow with notifications
- **Cross-kit dashboards** — cash runway, hiring funnel, sales pipeline
- **BD-localized compliance** — TIN/VAT, RJSC, BERC, AML/CFT, BDT-native payroll
- **Stripe billing** — free up to 3 users, paid above

Currently scoped at **12–14 weeks for MVP**. Roadmap detail in [`/docs/phase-2.md`](./docs/phase-2.md) (coming).

---

## 📐 Architecture, briefly

```
lib/
├── app/                    # routes, theme, design system
├── data/
│   ├── models/             # KitModel, SectionModel, FieldDef, Blueprint types
│   ├── providers/          # ProgressProvider, SectionDataProvider (GetxServices)
│   ├── sections/           # 75 sections defined as data, one file per kit
│   └── services/           # BlueprintAggregator, BlueprintPdf
├── modules/
│   ├── home/               # dashboard
│   ├── modules/            # kit list + detail
│   ├── sections/           # 8 generic pattern screens (record list, RACI, financial grid…)
│   ├── blueprint/          # blueprint screen + investor pitch mode
│   ├── auth/               # (Phase 2)
│   └── …                   # onboarding, splash, profile, quiz
└── widgets/                # responsive helpers, hover cards, premium UI primitives
```

**The trick:** all 75 trackers share **8 generic screens** (one per pattern) driven by schemas. Adding a new tracker is just a new entry in a sections file — zero new screen code. This is what makes the app maintainable at scale.

---

## 🤝 Contributing

This is a personal project right now — but if you're a founder running a small startup in Bangladesh and want to test it / shape it, open an issue and let's talk.

---

## 📄 License

MIT — do whatever you want with it.

---

<sub>Built with ❤️ in Dhaka. Designed for the founder who hasn't slept in 36 hours and still has 6 spreadsheets open.</sub>
