# TRT IPTV playlists

M3U playlists for TRT's public (free-to-air) TV channels, straight from TRT's own
HLS servers (`*.medya.trt.com.tr`). No third-party re-streams, no tokens, nothing
to keep updated.

| File | Quality |
| --- | --- |
| `trt.m3u` | **Auto** — HLS master playlist, the player picks the variant (360p → 1440p) |
| `trt-1080p.m3u` | **Fixed 1080p** — for players/boxes that pick badly on their own |

There is no 4K rendition on any TRT channel; the top variant is 1440p, so `trt.m3u`
can never go above that. If you'd rather cap at Full HD, use `trt-1080p.m3u`.

## Channels (13)

TRT 1 · TRT 2 · TRT Haber · TRT Spor · TRT Spor Yıldız · TRT Belgesel · TRT Çocuk ·
TRT Müzik · TRT Avaz · TRT Türk · TRT Kurdî · TRT Arabi · TRT World

## Using it

Point any IPTV player at the raw URL of the file, or download it and open it locally.

- **VLC**: Media → Open Network Stream → paste the raw file URL
- **TiviMate / OTT Navigator / IPTV Smarters**: add a playlist by URL
- **Kodi (PVR IPTV Simple Client)**: M3U playlist URL
- **mpv**: `mpv https://tv-trt1.medya.trt.com.tr/master.m3u8`

EPG: the playlists reference `https://iptv-org.github.io/epg/guides/tr.xml` via
`x-tvg-url`, and each channel carries a `tvg-id` matching that guide.

## Geo-blocking

TRT 1, TRT Haber, TRT Çocuk, TRT Müzik, TRT Avaz, TRT Türk, TRT Kurdî, TRT Arabi
and TRT World play worldwide.

**TRT 2, TRT Spor, TRT Spor Yıldız and TRT Belgesel are restricted to Turkey** —
from a Turkish connection they work normally; from abroad TRT's CDN returns
HTTP 403. The URLs in the playlist are correct either way.

## Checking the streams

```sh
./check.sh            # checks trt.m3u
./check.sh trt-1080p.m3u
```

`200` = playing, `403` = geo-blocked from where you ran it.
