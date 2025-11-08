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

**Detailed Setup Steps:**

### Step 1: Get NETLIFY_AUTH_TOKEN

1. **Go to Netlify**: Open https://app.netlify.com/user/applications#personal-access-tokens
2. **Create token**: 
   - Scroll to "Personal access tokens" section
   - Click **"New access token"** button
   - Give it a name: `GitHub Actions` (or any descriptive name)
   - Click **"Generate token"**
3. **Copy the token**: 
   - ⚠️ **IMPORTANT**: Copy it immediately! You won't be able to see it again
   - It looks like: `nfp_ABC123xyz...` (long string starting with `nfp_`)

### Step 2: Add NETLIFY_AUTH_TOKEN to GitHub

1. **Go to your repo secrets page**: https://github.com/nitish-niraj/portfolio_flutter/settings/secrets/actions
2. Click **"New repository secret"** (green button on the right)
3. Fill in:
   - **Name**: `NETLIFY_AUTH_TOKEN` (exactly as shown, all caps)
   - **Secret**: Paste the token you copied from Netlify
4. Click **"Add secret"** button at the bottom
5. ✅ You should see "NETLIFY_AUTH_TOKEN" in your secrets list

### Step 3: Get NETLIFY_SITE_ID

1. **Go to Netlify dashboard**: Open https://app.netlify.com
2. **Select your site**: 
   - If you already have a site: Click on it
   - If you don't have a site yet: 
     - Click **"Add new site"** → **"Deploy manually"**
     - Drag any folder to create a placeholder site (we'll overwrite it with GitHub Actions)
3. **Find the Site ID**:
   - Click **"Site configuration"** in the left sidebar
   - Or go to **"Site settings"** button
   - Look for **"Site information"** or **"Site details"** section
   - Find **"Site ID"** (looks like: `abc12345-6789-def0-1234-56789abcdef0`)
4. **Copy the Site ID**: Click the copy icon next to it

### Step 4: Add NETLIFY_SITE_ID to GitHub

1. **Go back to repo secrets**: https://github.com/nitish-niraj/portfolio_flutter/settings/secrets/actions
2. Click **"New repository secret"** again
3. Fill in:
   - **Name**: `NETLIFY_SITE_ID` (exactly as shown, all caps)
   - **Secret**: Paste the Site ID you copied from Netlify
4. Click **"Add secret"** button
5. ✅ You should now see both secrets in your list:
   - `NETLIFY_AUTH_TOKEN`
   - `NETLIFY_SITE_ID`

### Step 5: Verify Setup

1. **Check secrets are added**: 
   - Go to https://github.com/nitish-niraj/portfolio_flutter/settings/secrets/actions
   - You should see 2 repository secrets listed (values are hidden for security)
2. **Trigger deployment**: 
   - **Option A**: Make any small change and push to `main` branch
   - **Option B**: Go to Actions tab → "Deploy to Netlify" → "Run workflow" button
3. **Watch the deployment**: 
   - Go to https://github.com/nitish-niraj/portfolio_flutter/actions
   - Click on the latest "Deploy to Netlify" workflow run
   - Watch it build and deploy (takes ~2-5 minutes)
4. **Check your live site**: 
   - Once complete, go to your Netlify dashboard
   - Your Flutter web app should be live!
   - Click "Open production deploy" to see your site

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
