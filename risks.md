<!-- SPDX-License-Identifier: CC-BY-4.0 -->

# Risks

Top-level risk summary for the octobass L2 concept packet. The full qualitative
analysis lives in `risk-FMEA.md`; this file is the baseline packet summary. No
numeric risk scores are assigned.

## Stopping mechanism / linkage

- **Lost motion / backlash in linkage** — stops miss pitch or lag the player.
  Control: linkage-mule measurement of ratio + lost-motion budget
  (validation.csv VAL-005); keep `linkage_ratio` symbolic until measured.
- **Stop contact travel wrong** — string not cleanly stopped or over-driven.
  Control: contact-rig measurement of clearance + contact displacement (VAL-004).
- **Stop position mislocated** — wrong pitch. Control: `stop_position_ratio`
  solved against a reviewed scale/tuning plan (VAL-003).

## Structure / performer

- **Frame deflects under string + stop load** — geometry drifts, pitch unstable.
  Control: frame-mockup deflection measurement (VAL-007).
- **Bow strikes the mechanism** — unplayable. Control: bow-clearance envelope
  vs mechanism envelope via posture mockup (VAL-006).
- **Instrument too tall to play/service safely** — Control: height + frame
  envelope review (VAL-001).

## Service / process

- **Mechanism blocks service access** — cannot regulate stops. Control: service
  mockup clearance review (VAL-008).
- **CAD appears authoritative too early** — the parametric OpenSCAD envelope
  (`cad/octobass.scad`) carries `pending_measurement` authority and render-only
  placeholder values; it is **not** fabrication authority. Update the authority
  register before any DXF/SVG or measured geometry is accepted.

## Must-not (carried into evolution/design-intent.md)

- Do not assign a fabrication value to any parameter (scale_length,
  linkage_ratio, stop_contact_travel, …) or promote a `// PLACEHOLDER` without a
  measured/reviewed authority-register row.
- Do not release scale, tuning, string, force, or linkage values from reference
  research, images, or prose (README / design.md authority boundary).
- The three-string layout is a concept-family constraint, not a measured
  stringing plan.
