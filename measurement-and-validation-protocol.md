<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Measurement And Validation Protocol

Status: L3-candidate protocol. All values are `pending_measurement`; this file
defines what must be measured before any estimate can become fabrication
authority.

## Authority Promotion Rule

An estimated dimension, force, contact position, or structural feature may be
promoted only when the packet records:

- the measurement setup and datum;
- the tool or fixture used;
- repeatability observations;
- reviewer or shop signoff;
- the downstream artifact updated from the evidence.

No single observation should promote the full instrument. Promote only the
subsystem tested.

## String Domain

Measure before authority:

- actual scale length from chosen nut/contact datum to bridge datum;
- string gauge, material, winding, supplier lot, and installed tension;
- target pitch and measured pitch response after settling;
- bow response at the intended contact zone;
- safe tensioning and detensioning workflow.

Promotion blocker: no stop geometry can become authority until string
centerline, tension behavior, and bow clearance are known.

## Stop Contact Domain

Measure before authority:

- stop contact location relative to string datum;
- stop head material and surface finish;
- actuation force needed for clean speech;
- return reliability and rattle after repeated cycles;
- string wear or deformation after repeated stopping.

Promotion blocker: a stop position remains `pending_measurement` until the rig
shows clean attack, stable pitch behavior, reliable reset, and acceptable string
wear.

## Linkage Domain

Measure before authority:

- input motion at each hand lever or foot pedal;
- output motion at the stop head;
- backlash, hysteresis, stretch, friction, and return delay;
- adjuster range and service accessibility;
- noise from pivots, cables, rods, and springs.

Promotion blocker: linkage layout cannot become fabrication authority until
lost motion and return behavior are measured under representative load.

## Structure Domain

Measure before authority:

- frame deflection under string and mechanism load;
- bridge, tailpiece, neck/head support, and floor/endpin load paths;
- stop frame deflection while actuating;
- service access with the instrument upright and safely supported;
- stability when the player actuates controls while bowing.

Promotion blocker: body or frame dimensions remain estimates until deflection,
stability, and service access are reviewed.

## Performer Domain

Measure before authority:

- reach to levers and pedals from the chosen posture;
- bow path clearance around stops, frame, bridge, and body;
- labeling and control mapping comprehension;
- safe emergency release or reset behavior;
- fatigue and control force during repeated actuation.

Promotion blocker: the control console cannot become authority until a mockup
proves reach, labeling, and bow clearance.

## Validation Log Requirements

Future logs should include `test_id`, `subsystem`, `datum`, `setup`, `input`,
`observed_result`, `pass_fail_pending`, `failure_notes`, `reviewer`, and
`authority_change`. Numeric result columns may be added only after a real test
exists.
