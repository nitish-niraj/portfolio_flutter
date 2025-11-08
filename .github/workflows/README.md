# GitHub Actions Workflows

## Active Workflows

### Deploy to Netlify (`deploy-netlify.yml`)
Automatically builds and deploys the Flutter web app to Netlify on every push to `main`.

**Required Secrets** (add in GitHub Settings → Secrets → Actions):

1. **`NETLIFY_AUTH_TOKEN`**
   - Go to [Netlify User Settings → Applications → Personal Access Tokens](https://app.netlify.com/user/applications#personal-access-tokens)
   - Click "New access token"
   - Give it a name (e.g., "GitHub Actions")
   - Copy the token and add it as a GitHub secret

2. **`NETLIFY_SITE_ID`**
   - Go to your Netlify site dashboard
   - Navigate to Site settings → General → Site details
   - Copy the "Site ID" (looks like: `12345678-1234-1234-1234-123456789abc`)
   - Add it as a GitHub secret

**Setup Steps:**
```bash
1. Create a new site on Netlify (or use existing)
2. Get your NETLIFY_SITE_ID from Site settings
3. Generate NETLIFY_AUTH_TOKEN from User settings
4. Add both secrets to GitHub: Settings → Secrets and variables → Actions → New repository secret
5. Push to main branch - workflow will auto-deploy!
```

**What it does:**
- Triggers on push to `main` branch
- Checks out code
- Sets up Flutter stable channel
- Runs `flutter pub get`
- Builds web app (`flutter build web --release`)
- Deploys `build/web` to Netlify
- Posts deployment URL as comment on commits

---

## Disabled Workflows

The following workflows have been disabled (renamed with `.disabled` extension) because they had configuration errors:

- **`main.yml.disabled`** - Old Firebase deploy workflow with missing `FIREBASE_TOKEN` secret
- **`firebase-hosting-pull-request.yml.disabled`** - Firebase PR preview with missing `FIREBASE_SERVICE_ACCOUNT_AERIUM_V2` secret
- **`cd.yml.disabled`** - Old GitHub Pages deploy workflow with outdated actions

**To re-enable any workflow:**
1. Remove the `.disabled` extension from the filename
2. Update the workflow file to use modern actions (v2+ recommended)
3. Add any required secrets to GitHub Settings → Secrets

---

## Common Issues & Fixes

### Workflow fails with "secret not found"
- Make sure you've added all required secrets in GitHub repo settings
- Secret names are case-sensitive and must match exactly

### Build fails
- Check Flutter version compatibility
- Run `flutter pub get` locally to verify dependencies
- Check the Actions tab for detailed error logs

### Deployment succeeds but site doesn't update
- Check Netlify dashboard for deployment status
- Verify `NETLIFY_SITE_ID` matches your actual site
- Clear browser cache or try incognito mode
