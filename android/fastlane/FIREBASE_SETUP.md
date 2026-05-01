# Firebase App Distribution — fully automated CI

Every push to `main` (when Android-relevant files change) automatically:
1. Bumps build number
2. Builds a signed `.apk`
3. Uploads to Firebase App Distribution
4. Notifies the `testers` group via email

Testers click the email link, install the APK directly. No Play Console review delay, no Play Store flow at all. After Play Console API access unlocks, we can flip to that channel via a one-line workflow change.

## One-time setup (~15 min)

### 1. Create the Firebase project

- Open https://console.firebase.google.com → **Add project**
- Project name: `Startup Ninja` (or anything you like)
- Disable Google Analytics (not needed for App Distribution; you can add later)
- **Create project** → wait ~30 sec

### 2. Register the Android app

- On the project home, click the **Android icon** (or **Add app → Android**)
- **Android package name:** `com.startupninja.startup_ninja`  *(must match exactly)*
- App nickname: `Startup Ninja Android`
- Skip the SHA-1 step (not needed for App Distribution)
- Click **Register app**
- **Skip** downloading `google-services.json` — we don't need it for App Distribution
- Click through to the dashboard

### 3. Get the Firebase App ID

- Project home → click the **gear icon** (top-left, near "Project Overview") → **Project settings**
- Scroll to **Your apps** → find the Android app you just added
- Copy the **App ID** — looks like `1:123456789012:android:abc123def456`

### 4. Enable App Distribution

- Left sidebar → **Build → App Distribution** (or **Release & Monitor → App Distribution** in newer layouts)
- Click **Get started** if prompted
- **Testers & Groups** tab → **Add group** → name it exactly `testers` (lowercase, matches the workflow)
- Click into the group → **Add testers** → paste tester email addresses (your own + up to 10 others to start)

### 5. Generate a Firebase CI token

In your terminal:

```bash
npm install -g firebase-tools     # if you don't have it
firebase login:ci
```

A browser window opens, you authenticate. The terminal prints a long token at the end like:
```
1//0g...long-string...
```

**Copy that token.** It's the `FIREBASE_TOKEN` GitHub Secret.

### 6. Add GitHub Secrets

Open: https://github.com/arafatomer66/startup-ninja/settings/secrets/actions

Add (or update):

| Secret | Value |
|---|---|
| `FIREBASE_TOKEN` | The long string from step 5 |
| `FIREBASE_ANDROID_APP_ID` | The App ID from step 3 (e.g. `1:123456789012:android:abc123`) |
| `KEYSTORE_BASE64` | Run: `base64 -i ~/startupninja.jks \| pbcopy` then paste |
| `KEYSTORE_PASSWORD` | `srsas12@DFIN` |
| `KEY_PASSWORD` | `srsas12@DFIN` |
| `KEY_ALIAS` | `startupninja` |

That's it. Six secrets.

### 7. Trigger the first run

Two ways:

**Manual:** GitHub → **Actions tab** → **"Android — Ship to Firebase App Distribution"** → **Run workflow** → fill in release notes if you want → **Run**.

**Automatic:** Push any change to `lib/`, `pubspec.yaml`, or `android/`.

After ~5 min, the workflow finishes:
- Testers in the `testers` group receive an email titled "New build of Startup Ninja"
- They click the link, accept the invite (one-time per device), download + install the APK
- App opens normally

## Local-only manual ship (without GitHub)

If you want to ship from your laptop without going through CI:

```bash
export FIREBASE_TOKEN="<token from step 5>"
export FIREBASE_APP_ID="<app id from step 3>"
export FIREBASE_PROJECT_ID="<your firebase project id>"
export RELEASE_NOTES="Manual hotfix"

cd ~/Desktop/startup_ninja/android
fastlane firebase
```

For just validating auth without uploading:

```bash
fastlane firebase_dryrun
```

## Switching back to Play Console later

When Play Console API access unlocks:

1. Re-enable the push trigger in `.github/workflows/android-release.yml` (uncomment the `push:` block)
2. Optionally disable the push trigger on `firebase-distribution.yml` (keep manual)
3. Push. Now every release ships to Closed testing on Play Store; Firebase becomes the manual fallback.

## Troubleshooting

**"App distribution: Permission denied"**
The Firebase CLI token expired or is wrong. Regenerate with `firebase login:ci`, update the GitHub Secret.

**"App with id ... not found"**
The `FIREBASE_ANDROID_APP_ID` secret has a typo, or you're using the project ID instead of the app ID. Re-copy from Project settings → Your apps.

**"Group 'testers' does not exist"**
Create the group in Firebase console → App Distribution → Testers & Groups, with exactly that lowercase name.

**Tester didn't get the email**
- Check spam folder
- Confirm the tester is in the `testers` group (not just the project)
- They need to accept the invite once per device — first email is the invite, subsequent emails are build notifications
