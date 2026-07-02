<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# CAD Notes

`octobass.scad` is a parametric **structural-envelope scaffold** — authority
`pending_measurement`, **not** fabrication authority. See
`../visual-output-register.csv` (OB-CAD-001) and `mcp-session-log.md`.

This packet is deliberately non-dimensional: every leaf number in the `.scad`
is a render-only placeholder (tagged `// PLACEHOLDER`), chosen only so the
body / neck / string / stop-mechanism / frame envelope draws. The honest,
source-traceable content is the set of **symbolic relationships** from
`../parametric-design.csv` (`stop_position_ratio`, `stop_contact_travel`,
`linkage_ratio`, `lost_motion_budget`) encoded as formulas.

Mechanism internals (lever/pedal linkage geometry, bell cranks, stop contact
heads) are intentionally **out of scope** — see `../design.md`.

Render check: `openscad -o /tmp/octobass-check.stl octobass.scad`
exits 0 (manifold solid). Promote a placeholder to a real value only via a
measured/reviewed authority-register row.
