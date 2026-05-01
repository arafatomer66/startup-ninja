# Fastlane — Android release automation

Automates Play Console **Closed testing** uploads for Startup Ninja.
(Closed testing = `alpha` track in the Play Console API. All lanes target it.)

## One-time setup

Do this once per developer machine.

### 1. Create a Play Console service account

1. Open https://play.google.com/console → click into **StartupNinja** → left sidebar **Setup → API access** (scroll down)
2. If a Google Cloud project banner appears: link existing or create new
3. Under **Service accounts**, click **Create new service account** → opens Google Cloud Console
4. In Google Cloud Console:
   - Service account name: `startup-ninja-fastlane` → **Create and continue**
   - Role: **Service Account User** → **Done**
5. Back on the service accounts list, click the new account → **Keys → Add key → Create new key → JSON**
6. A JSON file downloads. **Don't commit it.**
7. Back in Play Console **API access** → **Refresh service accounts** → find your new one → **Grant access**
   - **App permissions:** add Startup Ninja
   - **Account permissions:** tick at minimum:
     - View app information and download bulk reports
     - Manage testing track releases
     - Create, edit, and delete draft apps
     - (Optional) Manage production releases — only if you'll promote to prod
   - **Invite user → Send invitation**

### 2. Drop the JSON into the project

```bash
mv ~/Downloads/<the-json-you-downloaded>.json \
   ~/Desktop/startup_ninja/android/fastlane/play-store-service-account.json
```

The path is gitignored. Don't rename it — the Appfile points at exactly that filename.

### 3. Verify wiring

```bash
cd ~/Desktop/startup_ninja/android
fastlane closed_dryrun
```

Expected output ends with `Dry-run OK — service account + Play Console wiring verified.`

If it fails with `403 Forbidden` or `App not found`, the service account permissions in Play Console are wrong — repeat step 1.7.

## Day-to-day usage

```bash
cd ~/Desktop/startup_ninja/android

# Build + upload as a DRAFT to Closed testing (recommended — review first, then roll out from Play Console)
fastlane closed

# Build + upload + immediately roll out to Closed testing
fastlane closed_rollout

# Promote the latest Closed testing build → Open testing
fastlane promote_closed_to_open

# Promote the latest Closed testing build → Production (10% staged rollout)
fastlane promote_to_production
```

Each `closed` / `closed_rollout` run:
1. Bumps the build number in `pubspec.yaml` (e.g. `1.1.0+2 → 1.1.0+3`)
2. Runs `flutter clean` + `pub get` + `flutter build appbundle --release`
3. Uploads the signed `.aab` to Play Console

## Lanes

| Lane | What it does |
|---|---|
| `closed` | Bump version → build → upload to Closed testing as draft |
| `closed_rollout` | Bump version → build → upload + roll out immediately |
| `closed_dryrun` | Validate service account + connection, no upload |
| `build_aab` | Just build the signed `.aab`, no upload |
| `promote_closed_to_open` | Promote latest Closed → Open testing |
| `promote_to_production` | Promote latest Closed → Production (10% rollout) |

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
The service account doesn't have access to this app. Play Console → Setup → API access → your service account → Grant access → add Startup Ninja.

**"Version code N has already been used. Try another version code"**
Edit `pubspec.yaml`, bump `+N` past the highest existing code on Play Console, retry.

**"Track 'alpha' was not found" / "track is not opened"**
You haven't created a Closed testing release on Play Console yet. Open the app → Test and release → Testing → Closed testing → Create new release. fastlane will handle subsequent uploads.

**Fastlane hangs at "Loading..."**
First-time gem install is downloading dependencies into `~/.local/share/fastlane/4.0.0`. Let it finish.
