<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Drawing Brief

Scope for any future dimensioned drawing of the octobass. This packet is
deliberately non-dimensional (concept-only / `pending_measurement`), so **no
dimensioned DXF/SVG exists yet** and none may be produced until the measurement
gates in `validation.csv` and the authority register are satisfied.

## What a future drawing set must show (once measured)

- **Overall envelope** — instrument height, frame layout, and player station.
- **String plan** — scale length, three-string layout, oversized bridge.
- **Stopping mechanism** — hand-lever bank, foot-pedal bank, remote
  tangents/padded stops; stop position ratio and contact travel.
- **Linkage** — transmission (cables/rods/bell cranks), linkage ratio, and
  lost-motion budget.
- **Bow-clearance + service envelopes** — bow swept volume vs mechanism
  envelope; tool access to obstructed zones.

## Current CAD artifact

`cad/octobass.scad` is a **parametric structural-envelope scaffold**: it
encodes the documented symbolic relationships from `parametric-design.csv` as
formulas and uses render-only placeholder leaf values (clearly flagged, not
authority).

## Drawing rules

- Every dimension on any released drawing must trace to a measured or reviewed
  authority-register row.
- Keep the mechanism relationships (`stop_position_ratio`, `linkage_ratio`,
  `lost_motion_budget`, `frame_deflection_ratio`) formula-driven; never
  hand-place from a lossy export.
- Treat existing octobasses (e.g. museum instruments), photos, and diagrams as
  reference-only.
