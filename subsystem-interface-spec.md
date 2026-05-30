<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Subsystem Interface Spec

Status: L3-candidate interface map. Every interface remains
`pending_measurement`.

## Interface Authority Rule

An interface becomes fabrication authority only when both adjacent subsystems
have measured or reviewed evidence and the handoff datum is named in the design
table.

## Interfaces

### String To Stop

- Inputs: string centerline, tension state, winding/contact surface, intended
  stopped position.
- Outputs: stop head location, contact material, reset path, wear notes.
- Evidence needed: clean stop, no damaging wear, repeatable reset, bowable
  sound.

### Stop To Linkage

- Inputs: desired stop motion, allowable contact force, return behavior.
- Outputs: lever arm, cable/rod/bell-crank path, spring or counterweight plan.
- Evidence needed: measured lost motion, friction, hysteresis, and noise.

### Linkage To Player Controls

- Inputs: player posture, hand reach, foot reach, label map, emergency release.
- Outputs: console layout, lever/pedal family, service access.
- Evidence needed: ergonomic mockup and player feedback.

### String To Structure

- Inputs: string count, tension state, bridge/tailpiece/neck support concept.
- Outputs: frame load path, body interface, endpin or floor support.
- Evidence needed: measured or reviewed load path and deflection behavior.

### Body To Mechanism Frame

- Inputs: resonant body concept, mechanism support loads, service access needs.
- Outputs: independent frame or body-mounted mechanism decision.
- Evidence needed: deflection and noise observations.

### CAD To Shop Packet

- Inputs: validated parameters, datum definitions, reviewed drawings.
- Outputs: future CAD, DXF, cut list, assembly drawings.
- Evidence needed: traceability from each dimension to measurement or expert
  review.

## Interface Log Fields

Future logs should include `interface_id`, `subsystems`, `datum_name`,
`evidence_source`, `authority_status`, `open_risk`, `reviewer`, and
`next_action`.
