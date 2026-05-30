<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# Assembly Sequence

Status: L3-candidate assembly plan. This is not a fabrication release and
contains no dimensions, tuning values, or CAD geometry.

## Jig And Fixture Strategy

Planned jigs are named by purpose only:

- string-line datum jig: establishes the temporary string path for stop tests;
- stop-contact test rig: holds one string and one replaceable contact head;
- linkage motion board: compares cable, rod, and bell-crank transmission;
- ergonomic control mockup: tests lever/pedal reach and labeling;
- frame stability mockup: tests support and service access without a resonant
  body claim.

All jig sizes, materials, and hole locations are pending measurement.

## Build Order

1. Reference and safety review:
   confirm intended posture, safe support method, and non-negotiable unknowns.
2. Single-string rig:
   create a temporary string path and adjustable stop-contact fixture.
3. Contact-head trials:
   compare tangent, padded, and clamp-style stops for clean speech and wear.
4. Linkage trials:
   connect hand lever and foot pedal inputs to the stop fixture using candidate
   transmissions.
5. Ergonomic mockup:
   place controls around a player-position fixture and observe bow clearance.
6. Frame mockup:
   hold the mechanism in a non-acoustic support frame and test deflection and
   service access.
7. Integration review:
   decide which measurements can promote from `pending_measurement` to reviewed
   design-table authority.

## Assembly Checks

- Confirm the string line is clearly marked and cannot be confused with a final
  fabrication datum.
- Confirm all contact heads are replaceable.
- Confirm linkages have visible adjusters and inspection access.
- Confirm every spring, cable, rod, or pivot can fail safely during a test.
- Confirm no mechanism blocks bow travel.
- Confirm all observations are recorded before any geometry is copied into CAD.

## Stop Conditions

Stop assembly work if:

- a string shows visible damage from a contact head;
- a stop fails to reset consistently;
- a linkage binds or stores unsafe energy;
- the player cannot bow without contacting the mechanism;
- the support frame shifts during actuation;
- a proposed datum cannot be measured repeatably.
