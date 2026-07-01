<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAD MCP Session Log

Status: V5 provenance stub for `octobass`.

No MCP, CAD, DXF, image generation, Wolfram, acoustic modeling, or measurement
tool produced or modified artifacts in this repository. This is a text-only L1
concept packet.

## Step 0 QMD

| timestamp | command | result |
| --- | --- | --- |
| 2026-05-30 | `qmd query "octobass 3.5m three-string sub-contrabass too large to finger by hand -- a system of hand levers and foot pedals operates stopping mechanisms on the strings; giant bowed body, mechanical fretting linkage is the core challenge"` | Tooling failure: Bun crashed with a segmentation fault after node-llama-cpp CPU fallback under `timeout 30`; no usable QMD context was returned. |
| 2026-05-30 | `qmd search "octobass" -c instrument-builds` | No results found. |

## Tool Sessions

| session_id | tool | input_authority | outputs | role | authority_result | review_status | notes |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 2026-05-30-codex-r7-octobass | none | Round 7 lane prompt only | `README.md`; `design.md`; `bom.csv`; `decision-record.md`; `visual-output-register.csv`; `cad/mcp-session-log.md` | concept_packet_scaffold | concept_only | self_checked | No CAD geometry, DXF coordinates, tuning values, acoustic predictions, pressure values, or mechanism dimensions were generated. |
| 2026-05-30-r8-wolfram | Codex local edit | Existing L2 packet and Round 8 Wolfram authoring contract | `octobass-starter.wl`; `wolfram/octobass-wolfram-model.wl`; `visual-output-register.csv`; `cad/mcp-session-log.md` | wolfram_reference_model | reference_only | self_checked | Source authored by hand. No MCP, Wolfram Desktop, CAD, rendering, or fabrication-authority session was run; every physical number in the model is an estimate placeholder pending measurement. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) | design.md, bom.csv, cut-list.csv, parametric-design.csv | bom.csv, cut-list.csv, sourcing.csv, validation.csv, visual-output-register.csv | packet_refresh | fabrication | self_checked | V5 refresh pass; tabular packet data reviewed against design docs. Scaffolded missing baseline files (sourcing.csv, validation.csv, risks.md, drawing-brief.md) as concept-only/pending_measurement; no dimensions invented. |
| fable-v5-refresh-2026-07-01 | claude-code (Fable 5) + OpenSCAD CLI | parametric-design.csv, design.md | cad/octobass.scad, cad/README.md | cad_authoring | pending_measurement | self_checked | Parametric structural-envelope scaffold; symbolic relationships encoded as formulas, all leaf values render-only placeholders (packet is non-dimensional; register dimension_claim=render_only_scaffold / scaffold_dimensions). Mechanism internals out of scope. OpenSCAD render check: pass (openscad -o STL, exit 0). Not fabrication authority. |

## Next Provenance Requirement

Any future CAD, drawing, render, tuning, string-force, or mechanism-linkage
artifact must add a new row here with the real tool, source inputs, outputs,
review status, and authority result.
