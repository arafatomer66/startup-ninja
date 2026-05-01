# Fastlane — Android release automation

Automates Play Console uploads for Startup Ninja.

## One-time setup

You only do this once per developer machine.

### 1. Create a Play Console service account

1. Open https://play.google.com/console → **Setup → API access**
2. If no Google Cloud project is linked, click **Create new project** (use the existing Google Cloud project if you have one for this app)
3. Under **Service accounts**, click **Create new service account** → it opens Google Cloud Console in a new tab
4. In Google Cloud Console:
   - **Service account name:** `startup-ninja-fastlane`
   - **Service account ID:** auto-fills, leave it
   - Click **Create and continue**
   - Role: **Service Account User** → **Done**
5. Back on the service accounts list, click the new account → **Keys → Add key → Create new key → JSON**
6. A JSON file downloads. **This is your secret. Don't commit it.**
7. Back in Play Console **API access**, click **Refresh service accounts**, find your new one, click **Grant access**
   - Under **App permissions**: add Startup Ninja
   - Under **Account permissions**: tick at least:
     - View app information and download bulk reports
     - Manage production releases
     - Manage testing track releases
     - Create, edit, and delete draft apps
   - Click **Invite user** → **Send invitation**

### 2. Drop the JSON into the project

```bash
mv ~/Downloads/<the-json-you-downloaded>.json \
   ~/Desktop/startup_ninja/android/fastlane/play-store-service-account.json
```

The path is gitignored. Don't rename it — the Appfile points at exactly that filename.

### 3. Verify wiring

```bash
cd ~/Desktop/startup_ninja/android
fastlane internal_dryrun
```

Expected output ends with `Dry-run OK — service account + Play Console wiring verified.`

If it fails with `403 Forbidden` or `App not found`, the service account permissions in Play Console are wrong — go back to step 1.7.

## Day-to-day usage

```bash
cd ~/Desktop/startup_ninja/android

# Build + upload as a DRAFT to Internal testing (recommended — lets you review before rollout)
fastlane internal

# Build + upload + immediately roll out to Internal testing
fastlane internal_rollout

# Promote the latest Internal build → Alpha
fastlane promote_internal_to_alpha

# Promote the latest Alpha build → Production (10% staged rollout)
fastlane promote_alpha_to_production
```

Each `internal` / `internal_rollout` run:
1. Bumps the build number in `pubspec.yaml` (e.g. `1.1.0+2 → 1.1.0+3`)
2. Runs `flutter clean` + `pub get` + `flutter build appbundle --release`
3. Uploads the signed `.aab` to Play Console

## Files

| File | What it does | Committed? |
|---|---|---|
| `Appfile` | Hardcodes package name + JSON path | ✅ yes |
| `Fastfile` | Defines all the lanes | ✅ yes |
| `play-store-service-account.json` | Auth for Play Console API | ❌ gitignored |
| `../key.properties` | Keystore passwords for signing | ❌ gitignored |
| `/Users/mdomerarafat/startupninja.jks` | Upload signing keystore | ❌ outside repo, never commit |

## Troubleshooting

**"Package com.startupninja.startup_ninja was not found"**
The service account doesn't have access to this app. Go to Play Console → Setup → API access → your service account → Grant access → add Startup Ninja.

**"Version code N has already been used. Try another version code"**
The build number on Play Console is already higher than your local. Edit `pubspec.yaml`, bump `+N` past the highest existing code, retry.

**Fastlane hangs at "Loading..."**
First-time gem install is downloading dependencies into `~/.local/share/fastlane/4.0.0`. Let it finish.

**Need to ship without a version bump**
Comment out the `bump_pubspec_build_number` call in the relevant lane in `Fastfile`, then run.
