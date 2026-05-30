<!-- SPDX-License-Identifier: CC-BY-4.0 -->
---
instrument: Octobass
family: strings / bowed bass
readiness: L3-candidate
authority: engineering packet candidate; pending measurement
---

# Octobass Design Study

## Concept

This packet deepens a very large bowed bass in the octobass lineage: a
roughly 3.5 m, three-string instrument whose strings are too long and too high
for ordinary left-hand stopping. The player bows with the hands while a
mechanical keywork system stops selected string positions.

The engineering center of gravity is not the outline of the body. It is the
translation from a human-scale hand lever or foot pedal into a controlled,
repeatable stop at a giant string. A future build-ready packet must prove that
the stop touches the right string, at the right position, with enough force to
sound cleanly, without crushing the winding, dragging pitch, rattling, or
blocking bow access.

The L3-candidate work here is not a claim that the instrument is build-ready.
It is a review scaffold: it names the measurements, interfaces, assembly risks,
and symbolic relationships that must be proven before any dimension becomes
fabrication authority.

## Mechanism Direction

Candidate mechanism families:

- Hand lever bank: large organ-stop-like levers near the player, each linked to
  a selected stopping pad.
- Foot-pedal octave or position bank: pedals select lower-register stops where
  hand reach and force are least practical.
- Remote tangent stops: hard or semi-hard tangents contact the string at
  measured positions, similar in spirit to keyed string instruments but scaled
  for very high string tension.
- Padded clamp stops: paired or backed pads squeeze the string gently against a
  local reference surface, trading tonal clarity against lower damage risk.
- Cable, rod, or bell-crank transmission: a future prototype should compare
  stretch, backlash, friction, reset speed, and serviceability.

## L3-Candidate Architecture

The packet separates the instrument into authority domains:

- string domain: string count, scale, tuning, gauge, tension, winding, and bow
  response;
- stop domain: tangent or pad contact, stop position, contact force, return
  force, and string wear;
- linkage domain: hand lever, foot pedal, cable/rod/bell-crank transmission,
  backlash, adjustability, and maintenance;
- structure domain: body, neck/head support, bridge, tailpiece, endpin/floor
  interface, and mechanism frame;
- performer domain: bow access, reach, control labeling, posture, and safe
  reset.

Each domain remains `pending_measurement`. L3 promotion requires measured or
reviewed evidence for every domain that controls fit, force, pitch, or safety.

## Parametric Intent

Use named parameters before any CAD work:

- `estimate_overall_height`: prompt-supplied 3.5 m concept scale, pending
  measurement.
- `string_count`: prompt-supplied three-string concept constraint.
- `pending_scale_length`: not specified.
- `pending_string_tuning`: not specified.
- `pending_stop_positions`: not specified.
- `pending_stop_force`: not specified.
- `pending_linkage_ratio`: not specified.
- `pending_body_outline`: not specified.
- `pending_bow_clearance`: not specified.
- `pending_service_access`: not specified.

See `parametric-design.csv` for symbolic relationships. The table intentionally
uses ratios and named variables rather than absolute fabricated dimensions.

## Prototype Path

The first physical work should not be a full instrument. It should be a
single-string stop-action test rig with adjustable string tension, replaceable
stop pads or tangents, and interchangeable hand/foot inputs. The useful
measurements are actuation force, return reliability, audible rattle, clean
note onset, wear at the string contact, and how much lost motion appears after
repeated cycles.

The prototype path should progress in four review gates:

1. non-sounding linkage mule for lever/pedal feel and reset;
2. single-string tension mule with replaceable contact heads;
3. ergonomic console mockup for player reach, bow clearance, and labeling;
4. structural frame mockup that carries mechanism loads without claiming body
   acoustics.

## Engineering Packet Map

- `measurement-and-validation-protocol.md` names what must be measured before
  estimates can become authority.
- `tolerance-and-fit-analysis.md` frames critical clearances as open questions.
- `assembly-sequence.md` describes build order and jig needs without dimensions.
- `subsystem-interface-spec.md` defines cross-subsystem contracts.
- `risk-FMEA.md` lists failure modes and detection/mitigation evidence.

## Non-Claims

This packet does not claim historical octobass measurements, string tuning,
string gauges, bridge geometry, plate design, body volume, linkage dimensions,
or structural sizing. Those must come from future reference research,
measurements, CAD review, and bench tests.
