# HITPRO AzuraCast

AzuraCast v0.24.0 with HITPRO's custom TV module and direct HTTPS audio import.

This public repository distributes the complete code package as a ZIP and provides a bootstrap script for a clean Ubuntu/Linux VPS. It contains source code and runtime configuration templates only. It does not contain VPS databases, user accounts, media, credentials, or stream keys.

## One-command install

Run this on a **fresh Ubuntu/Linux VPS** with root/sudo access and an Internet connection:

```bash
curl -fsSL https://raw.githubusercontent.com/hitprollc/hitpro-azuracast/main/install-from-github.sh -o /tmp/hitpro-azuracast-install.sh && sudo bash /tmp/hitpro-azuracast-install.sh; status=$?; rm -f /tmp/hitpro-azuracast-install.sh; exit $status
```

The script downloads the full package, starts the official AzuraCast installer, then adds the TV and audio-import features. It asks for the public IP/domain and RTMP/HLS ports. Keep the terminal open and follow the installer prompts.

The installer stops if `/var/azuracast` is not empty. The server needs Internet access and several GB of free disk space to download the pinned AzuraCast Docker image. Open TCP 80/443, 1935 (RTMP), and 8888 (HLS) in the VPS firewall as needed.

After installation, create new AzuraCast accounts/stations and upload your media. Existing VPS data is not copied.

## Included features

- AzuraCast v0.24.0 full source, with HITPRO TV frontend changes.
- Separate TV channels, video playlists, RTMP/HLS input, automatic playlist fallback, and RTMP destinations.
- Direct HTTPS audio-file import into radio playlists.
- Docker-based application dependencies and portable installation scripts.

See `HITPRO-AzuraCast-Portable-2026-11-15.zip` for the complete code and `README-HT.md` inside it for details.
