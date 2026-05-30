<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Risk FMEA

Status: qualitative L3-candidate FMEA. No numeric scores are assigned.

| failure_mode | affected_subsystem | effect | likely_cause | detection_method | mitigation_before_L3 |
| --- | --- | --- | --- | --- | --- |
| Stop lands off string centerline | stop system | Buzz, pitch error, string wear | Poor datum scheme or frame deflection | Single-string rig and registration marks | Define measured string datum and adjustable stop mount |
| Stop damages string winding | stop contact | String failure or tone degradation | Hard contact, sharp edge, excessive force | Wear inspection after repeated cycles | Compare padded/tangent materials and record wear |
| Stop fails to reset | stop/linkage | Note remains stopped or rattles | Spring weakness, friction, cable stretch | Repeated actuation test | Add return-force study and serviceable adjusters |
| Linkage backlash masks pitch onset | linkage | Unreliable note speech | Long cable path, loose pivots, compliance | Input/output motion comparison | Select transmission after measured lost-motion test |
| Pedal actuation destabilizes player | performer | Unsafe posture or poor bowing | Pedal force or location incompatible with bowing | Ergonomic mockup | Separate foot controls or move stops to hand lever bank |
| Mechanism enters bow path | performer/mechanism | Unplayable or unsafe bow stroke | Stop frame placed too close to strings | Bow swept-volume mockup | Redesign mechanism envelope before CAD |
| Body/frame deflects under load | structure | Stop positions drift | Underbuilt frame or body-mounted mechanism | Deflection measurement on frame mockup | Independent mechanism frame or reinforced load path |
| Service access blocked | service | Cannot tune or repair stops | Case/body shape chosen before mechanism | Service mockup | Require removable panels and external adjusters |
| Control map is unreadable | performer | Player chooses wrong stop | Poor labeling or mixed hand/foot logic | Console mockup review | Standardize control grouping and labeling |
| CAD copies unmeasured estimates | documentation | False fabrication authority | Premature modeling | Register and review gate audit | Require evidence source per CAD dimension |

## FMEA Boundary

This file identifies failure modes and evidence needs. It does not assign
severity scores, occurrence scores, detection scores, dimensions, forces,
frequencies, or tuning values.
