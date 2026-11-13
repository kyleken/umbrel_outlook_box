# Kyle's Umbrel App Store

Community app store for umbrelOS.

| App | What it does |
| --- | --- |
| **MS Mail** (`kyle-ms-mail`) | Recommended. Windows 11 Enterprise LTSC VM with the new Outlook, plus Apache Guacamole, so Outlook opens in any browser with clipboard and audio. |
| **Outlook Box** (`kyle-outlook-box`) | Just the Windows VM with the new Outlook, viewed with the basic built-in web viewer or RDP on port 3389. |

Install one or the other, not both: each one runs its own Windows VM.

## Add to Umbrel

In umbrelOS: **App Store → ⋯ (top right) → Community App Stores**, paste
`https://github.com/kyleken/umbrel_outlook_box`, click **Add**, then **Open**.

## Reach it over Tailscale

Install the official **Tailscale** app from the Umbrel App Store and sign in.
Then from any device on your tailnet open:

- MS Mail: `http://<umbrel-tailscale-name>:18080`
- Outlook Box: `http://<umbrel-tailscale-name>:18006`, or RDP to `<umbrel-tailscale-name>:3389`

## Notes

- Needs an x86 Umbrel with VT-x / AMD-V enabled. About 4-4.5 GB RAM and up to 64 GB disk.
- First boot downloads and installs Windows unattended (20-40 min).
- `windows-setup/setup.ps1` runs once at the end of the Windows install. It
  installs the new Outlook, opens it at sign-in, and allows RemoteApp. Its log
  is at `C:\OEM\setup-log.txt`. To re-run it by hand, open PowerShell as
  Administrator in Windows and run:
  `iwr -UseBasicParsing https://raw.githubusercontent.com/kyleken/umbrel_outlook_box/main/windows-setup/setup.ps1 | iex`
- Both apps install the full Windows 11 Enterprise LTSC 2024 image (the
  `11l` evaluation image expires and shuts down every hour). Activate it with
  your own key inside Windows: Settings → System → Activation → Change
  product key. Never put your key in this public repo.
- If your key is for **IoT** Enterprise LTSC, change `VERSION` to
  `win11x64-enterprise-iot` in the app's `docker-compose.yml` before installing.
- This repo must stay **public**: the Windows VM downloads `setup.ps1` from it.
