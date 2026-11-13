# Kyle's Umbrel App Store

Community app store for umbrelOS.

| App | What it does |
| --- | --- |
| **Outlook Box** (`kyle-outlook-box`) | Windows 11 LTSC in a container with the new Outlook auto-installed, viewable in the browser. |

## Add to Umbrel

1. Push this folder to a **public** GitHub repo (or click "Use this template" on
   `getumbrel/umbrel-community-app-store` and replace its files with these).
2. In umbrelOS: **App Store → ⋯ (top right) → Community App Stores**, paste the
   repo URL, click **Add**.
3. Open the store and install **Outlook Box**.

## Reach it over Tailscale

Install the official **Tailscale** app from the Umbrel App Store and log in.
Then from any device on your tailnet:

- Browser: `http://<umbrel-tailscale-name>:18006`
- RDP (better quality, clipboard, audio): `<umbrel-tailscale-name>:3389`,
  user `outlook`, password shown on the app's page in umbrelOS.

## Notes

- Needs an x86 Umbrel with VT-x / AMD-V enabled. ~4 GB RAM, up to 64 GB disk.
- First boot downloads and installs Windows unattended (15-30 min).
- `oem/install.bat` installs the new Outlook at the end of setup; its log is
  at `C:\OEM\install-log.txt`. It only runs on the *first* install.
- Windows is not activated; use your own license if you want to activate it.
