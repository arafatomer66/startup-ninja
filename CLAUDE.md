# Startup Ninja — Engineering Notes

This file is read by Claude Code on every session. Keep it short, factual, and load-bearing — anything obvious from `pubspec.yaml` or directory structure doesn't belong here.

## What this is

**Startup Ninja** is an operations toolkit for early-stage founders, especially BD SMBs.
- 75 interactive trackers across 7 startup kits
- Blueprint document with health score + investor pitch + multi-page PDF export
- Currently single-user offline (GetStorage). Phase 2 turns it into multi-tenant SaaS via Supabase.

Repo: https://github.com/arafatomer66/startup-ninja
Live: https://arafatomer66.github.io/startup-ninja/
Default branch: `main`. Auto-deploys to GitHub Pages via `.github/workflows/deploy.yml`.

## Stack

- Flutter 3.38.5, Dart SDK ^3.10.4
- **GetX** for routing + state management. **Pattern: GetxService providers, no controllers, no bindings.** Reactivity via a `_refreshTrigger.obs` that providers bump on every write.
- **GetStorage** for persistence. Single box, namespaced keys.
- `pdf` + `printing` for Blueprint export.
- `google_fonts` (Plus Jakarta Sans).
- Light mode only (locked preference).

## Architecture rules

1. **Trackers are data, not code.** Each of the 75 trackers is a `SectionModel` defined in `lib/data/sections/<kit>_sections.dart`. Adding a new tracker = new entry in a sections file. Do not write a new screen for each tracker.

2. **Eight pattern screens drive everything:**
   - `recordList` → `record_list_screen.dart` (table of records, add/edit/delete)
   - `checklist` → `checklist_screen.dart` (fixed list of Y/N items via `seedRows`)
   - `raciMatrix` → `raci_matrix_screen.dart` (activities × roles, R/A/C/I)
   - `sopProcess` → `sop_process_screen.dart` (ordered steps with time + output)
   - `financialGrid` → `financial_grid_screen.dart` (rows × periods, with `formula:'sum'` totals + Conservative/Base/Optimistic scenarios)
   - `catalog` → reuses `record_list_screen.dart` (reference tables)
   - `singleForm` → `single_form_screen.dart` (one record per company)
   - `roadmap` → `roadmap_screen.dart` (items × time periods, Gantt-style)

3. **One dispatcher route** (`Routes.section`). `SectionDispatcher` switches on `section.pattern` and returns the right pattern screen. Don't add per-section routes.

4. **Storage is namespaced** inside one GetStorage box:
   - `section.<id>.records` → `List<Map>` (recordList, catalog, roadmap)
   - `section.<id>.cells` → `Map<String,dynamic>` keyed `"row|col"` (RACI, financialGrid, checklist)
   - `section.<id>.cells.cons` / `.opt` for non-base finance scenarios
   - `section.<id>.form` → `Map` (singleForm)
   - `section.<id>.completed` → `bool`

5. **Blueprint reads from providers, never from sections directly.** `BlueprintAggregator.build(kits)` returns a fully-formed `Blueprint` with HealthScore, NextActions, FinancialSummary, InvestorPitch, Gaps. The Blueprint screen + PDF generator both consume this.

## Conventions

- **File naming:** snake_case for files, PascalCase for classes, camelCase for fields. Pattern screens are `<pattern>_screen.dart`.
- **Folders:** `lib/modules/<feature>/<feature>_screen.dart` + `widgets/` subfolder for sub-widgets.
- **No comments unless they explain WHY** (a constraint, a workaround, a non-obvious choice). Don't restate what the code does.
- **Theme:** all colors/spacing/radius/shadows from `app/theme.dart` (`AppColors`, `AppSpacing`, `AppRadius`, `AppShadows`, `AppGradients`). Do not hand-roll these inline.
- **Responsive:** wrap full-screen content in `ResponsiveContent` or `ResponsiveSliverBody` (from `lib/widgets/responsive.dart`). Use `Breakpoints.gridColumns(context)` for adaptive grids.
- **Hover/press feedback:** wrap tap targets in `HoverCard` for premium UX.

## Adding a new tracker (15-minute walkthrough)

1. Open `lib/data/sections/<kit>_sections.dart`
2. Append a `SectionModel`:
   ```dart
   SectionModel(
     id: 'hr.exit_interview',
     kitId: 'hr',
     title: 'Exit Interview',
     subGroup: 'Lifecycle',
     pattern: SectionPattern.recordList,
     fields: [
       FieldDef(key: 'name', label: 'Employee Name', type: FieldType.text, required: true),
       FieldDef(key: 'date', label: 'Interview Date', type: FieldType.date),
       FieldDef(key: 'feedback', label: 'Feedback', type: FieldType.longText),
     ],
   ),
   ```
3. Hot reload. The tracker appears in HR kit's "Lifecycle" group, fully functional. Blueprint picks it up automatically.

## Deploy

GitHub Actions workflow on every push to `main`:
- Builds `--release` web with `--base-href` derived from the repo name
- Adds `404.html` fallback for GetX deep links
- PWA offline-first strategy
- Deploys to GitHub Pages (Settings → Pages → Source: GitHub Actions)

To re-trigger manually: Actions tab → "Deploy to GitHub Pages" → Run workflow.

## Phase 2 — Multi-tenant SaaS (planned, not yet started)

Roadmap detail in `~/.claude/plans/screens-modules-for-the-startup-ninja-immutable-lovelace.md`.

Key strategy: layer cloud capabilities behind a `SectionDataSource` interface so the 75 trackers + Blueprint keep working unchanged. Local mode stays as the offline cache; Remote mode talks to Supabase.

| Phase | Weeks | Deliverable |
|---|---|---|
| P1 Foundation | 3 | Supabase project, auth, schema + RLS, org/invite flow |
| P2 Sync | 2 | RemoteDataProvider mirroring local API |
| P3 Collaboration | 2 | Comments, @mentions, activity feed, presence |
| P4 Permissions | 1 | Role-gated kits (Finance/HR = Admin+), audit log |
| P5 Tasks & approvals | 2 | Real Approval Matrix workflow + notifications |
| P6 Reports | 1 | Cross-kit dashboards, scheduled PDF email |
| P7 Mobile | 1 | iOS/Android, push notifications |
| P8 Billing | 2 | Stripe, free up to 3 users, paid above |

Locked decisions: BD SMB niche, Supabase backend, free up to 3 users / paid above.

## Things to avoid

- ❌ Adding per-tracker screens or per-tracker routes — extend the schema instead
- ❌ Hand-rolling `BoxShadow` lists — use `AppShadows`
- ❌ Computing kit progress with magic prefix matching — use `getKitProgressFor(kit)` / `getKitCompletedCount(kit)` / `getKitTotalCount(kit)`
- ❌ Storing finance scenarios in the same cells — use the `scenario:` parameter on `setCell`/`getCells`
- ❌ Adding GetxControllers — keep the GetxService + GetStorage pattern
- ❌ Reading `SectionDataProvider` directly from feature widgets in the Blueprint flow — go through `BlueprintAggregator`

## Critical files

| File | Purpose |
|---|---|
| `lib/data/models/section_model.dart` | SectionModel, FieldDef, enums |
| `lib/data/providers/section_data_provider.dart` | Storage layer, scenario-aware cells |
| `lib/data/providers/progress_provider.dart` | Kit progress aggregation |
| `lib/data/services/blueprint_aggregator.dart` | Blueprint object builder |
| `lib/data/services/blueprint_pdf.dart` | Blueprint → PDF |
| `lib/modules/sections/section_dispatcher.dart` | Pattern → screen routing |
| `lib/modules/blueprint/blueprint_screen.dart` | Blueprint UI + Pitch toggle + PDF export trigger |
| `lib/widgets/responsive.dart` | Breakpoints, ResponsiveContent, HoverCard |
| `lib/app/theme.dart` | All design tokens |
