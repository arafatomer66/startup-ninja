# GitHub Actions — fully automated Play Console releases

Once configured, **every push to `main`** that touches Android-relevant files automatically:
1. Bumps build number in `pubspec.yaml`
2. Builds a signed `.aab`
3. Uploads to Closed testing on Play Console
4. Pushes the version bump back to `main`

You can also trigger the workflow manually from the Actions tab and choose a target track (alpha/beta/production/dryrun).

## Required GitHub Secrets

Set these at: https://github.com/arafatomer66/startup-ninja/settings/secrets/actions

| Secret | Value |
|---|---|
| `KEYSTORE_BASE64` | Output of `base64 -i ~/startupninja.jks \| pbcopy` (paste from clipboard) |
| `KEYSTORE_PASSWORD` | `srsas12@DFIN` (from your local `android/key.properties`) |
| `KEY_PASSWORD` | `srsas12@DFIN` (same) |
| `KEY_ALIAS` | `startupninja` |
| `PLAY_SERVICE_ACCOUNT_JSON` | The full JSON content of your Play Console service account key (single-line, no formatting needed — paste raw) |

### Generating `KEYSTORE_BASE64`

```bash
base64 -i ~/startupninja.jks | pbcopy
```

This copies a long base64 string to your clipboard. Paste it as the value for `KEYSTORE_BASE64`.

### Getting `PLAY_SERVICE_ACCOUNT_JSON`

After you set up the service account (see `android/fastlane/README.md` step 1), open the downloaded JSON file and paste its entire contents — it's already valid JSON, GitHub Secrets handles multi-line strings fine.

## Manual trigger

From the Actions tab → "Android — Build & Ship to Closed Testing" → **Run workflow** → pick:
- `alpha` — Closed testing (default)
- `beta` — Open testing
- `production` — Production with 10% staged rollout
- `dryrun` — Validate connection only, no upload

## What happens on every push to main

The workflow only runs when these change (to avoid spinning up Android builds on web-only edits):
- `lib/**`
- `pubspec.yaml`
- `android/**`
- `.github/workflows/android-release.yml`

Web edits (theme tweaks, README updates, docs) won't trigger an Android release.

## Auto version-bump commit

After a successful upload, the workflow commits the bumped `pubspec.yaml` back to `main` with `[skip ci]` in the message — that prevents an infinite loop.
