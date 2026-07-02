# Design Intent — octobass rev A

- Master CAD: `cad/octobass.scad` (sha256: 1fdaf1df3dc5fee96048fb65a323041e89da5cee883449af8aadd87022949d94), a parametric structural-envelope scaffold driven by the symbolic table `parametric-design.csv` (sha256: 008e0a2f07b2cf24b1b32c900e6f600ae55f51ac343f273535be60d684f4bd2b).
- Function: A giant bowed three-string sub-contrabass. Because a player cannot reach the strings by hand at this scale, hand levers and foot pedals actuate stops (tangent/clamp/padded-finger) against the strings while the player bows. The body/frame carry the string load and support the mechanism.
- Environment: large standing acoustic instrument; string tension + stop forces are sustained structural loads on the frame; player ergonomics (reach, bow clearance, pedal access) and service access are first-order constraints.
- Target qty: 1 (prototype). Deadline: TBD. Budget/unit ceiling: TBD.

## Critical dimensions (carry tolerances)

Packet is deliberately non-dimensional — every critical value is
`pending_measurement`; the table records the governing symbolic relationship
and its measurement gate, not a released number.

| Feature | Nominal | Tolerance | Why critical | Source |
| --- | --- | --- | --- | --- |
| Scale length | TBD (no absolute value assigned) | measured/reviewed scale | pitch + string load | parametric-design.csv scale_length (pending_measurement) |
| Stop position ratio | TBD (stop_position/scale_length) | measured stop position | correct stopped pitch | parametric-design.csv stop_position_ratio (pending_measurement) |
| Stop contact travel | TBD (clearance + contact displacement) | contact-rig measurement | clean, repeatable stop | parametric-design.csv stop_contact_travel (pending_measurement) |
| Linkage ratio | TBD (stop output / player input) | linkage-mule measurement | playable actuation | parametric-design.csv linkage_ratio (pending_measurement) |
| Lost-motion budget | TBD (input − effective stop) | measured backlash | responsive stops | parametric-design.csv lost_motion_budget (pending_measurement) |
| Bow-clearance envelope | TBD (bow swept − mechanism) | ergonomic mockup | bow clears mechanism | parametric-design.csv bow_clearance_envelope (pending_measurement) |
| Frame deflection ratio | TBD (deflection / load reference) | frame-mockup deflection | stable geometry under load | parametric-design.csv frame_deflection_ratio (pending_measurement) |

## Incidental (free for DFM)

- Body outline styling, scroll/head shape, lever/pedal cosmetic housings, non-mating surface finish, decorative elements.

## Must-nots (DFM may never violate)

- Do not assign a fabrication value to any parameter or promote a `// PLACEHOLDER` in `cad/octobass.scad` without a measured/reviewed authority-register row (risks.md / README).
- Do not release scale, tuning, string, force, or linkage values from reference research, images, or prose.
- The three-string layout is a concept-family constraint, not a measured stringing plan.
- Frame is a structural load path (string + stop forces): no sizing until deflection review (validation.csv VAL-007).
- Bow-clearance and service envelopes must be preserved: mechanism may never intrude into the bow swept volume or block regulation access.

## Material intent

- Preferred: structural timber/steel frame, tonewood body/soundboard, large bowed strings, mechanical linkage hardware — all per bom.csv, all class-only / `pending_measurement`.
- Acceptable subs: per sourcing.csv (spec-first; specs pending).
- Forbidden: none recorded.

## Stage status

Stage 0 intake complete 2026-07-01. Gate A (Alpha shop compile) NOT yet run — no concessions logged, nothing presented as shippable or dimensioned.
