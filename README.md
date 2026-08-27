# TRT IPTV playlists

M3U playlists for TRT's public (free-to-air) TV channels, straight from TRT's own
HLS servers (`*.medya.trt.com.tr`). No third-party re-streams, no tokens.
Checked and regenerated automatically every morning.

| File | Quality |
| --- | --- |
| `trt.m3u` | **Auto** — HLS master playlist, the player picks the variant (360p → 1440p) |
| `trt-1080p.m3u` | **Fixed 1080p** — for players/boxes that pick badly on their own |

There is no 4K rendition on any TRT channel; the top variant is 1440p, so `trt.m3u`
can never go above that. To cap at Full HD, use `trt-1080p.m3u`.

Current stream status: **[STATUS.md](STATUS.md)** (refreshed daily).

## Channels (13)

TRT 1 · TRT 2 · TRT Haber · TRT Spor · TRT Spor Yıldız · TRT Belgesel · TRT Çocuk ·
TRT Müzik · TRT Avaz · TRT Türk · TRT Kurdî · TRT Arabi · TRT World

Every entry carries a channel logo (`tvg-logo`) served from `logos/` in this repo,
and a `tvg-id` matching the iptv-org Turkish EPG, which the playlists reference via
`x-tvg-url`.

## Using it

Point any IPTV player at the raw URL of the playlist, or download it and open it locally.

```
https://raw.githubusercontent.com/kuz3-orange/TurkishIPTV-Claude/main/trt.m3u
https://raw.githubusercontent.com/kuz3-orange/TurkishIPTV-Claude/main/trt-1080p.m3u
```

- **VLC**: Media → Open Network Stream → paste the URL
- **TiviMate / OTT Navigator / IPTV Smarters**: add a playlist by URL
- **Kodi (PVR IPTV Simple Client)**: M3U playlist URL, EPG URL is picked up from the file
- **mpv**: `mpv https://tv-trt1.medya.trt.com.tr/master.m3u8`

## Geo-blocking

TRT 1, TRT Haber, TRT Çocuk, TRT Müzik, TRT Avaz, TRT Türk, TRT Kurdî, TRT Arabi
and TRT World play worldwide.

**TRT 2, TRT Spor, TRT Spor Yıldız and TRT Belgesel are restricted to Turkey** —
from a Turkish connection they work normally; from abroad TRT's CDN returns HTTP 403.
The URLs are correct either way, so the updater reports those as `GEO` and leaves
them alone rather than treating them as broken.

## Maintenance

`channels.json` is the source of truth — the playlists are generated, so edit the
JSON, not the `.m3u` files.

```sh
python3 update.py
```

This probes every channel's master playlist and then rewrites `trt.m3u`,
`trt-1080p.m3u` and `STATUS.md`. A channel that comes back dead (404, DNS failure,
timeout, non-M3U body) triggers repair: the `alt_hosts` listed for it are probed and
the first working one is promoted in `channels.json`. HTTP 403 is treated as
geo-blocking, never as death.

Logos come from Wikimedia Commons; `logos/SOURCES.json` records the source file for
each one.
