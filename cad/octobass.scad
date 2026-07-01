// Octobass — parametric STRUCTURAL-ENVELOPE scaffold (concept-only packet).
//
// Authority: pending_measurement. NOT fabrication authority.
// ---------------------------------------------------------------------------
// HONESTY BOUNDARY (read before using any value here):
//   This packet is deliberately NON-DIMENSIONAL. README.md, design.md,
//   bom.csv, cut-list.csv, and parametric-design.csv release NO absolute
//   dimensions — every parameter (scale_length, linkage_ratio,
//   stop_position_ratio, ...) is `pending_measurement` / "No absolute value
//   assigned". Therefore EVERY numeric leaf value below is a RENDER-ONLY
//   PLACEHOLDER chosen only so the envelope draws; NONE is a design, tuning,
//   force, or fabrication authority. Placeholders are tagged `// PLACEHOLDER`.
//   The DOCUMENTED content this file honestly encodes is the set of SYMBOLIC
//   RELATIONSHIPS from parametric-design.csv (stop_position_ratio,
//   stop_contact_travel, linkage_ratio, lost_motion_budget) — expressed as
//   formulas, not baked values.
//   Mechanism detail (lever/pedal internals, bell-crank geometry, stop contact
//   heads) is intentionally OUT OF SCOPE — see design.md.
// ---------------------------------------------------------------------------
// Units: millimeters.

/* [Overall envelope — overall_height_concept (PLACEHOLDER)] */
overall_height_mm  = 3500;  // PLACEHOLDER giant sub-contrabass height (no value assigned)
body_width_mm      = 700;   // PLACEHOLDER lower-bout width
body_depth_mm      = 500;   // PLACEHOLDER body depth
body_frac          = 0.45;  // PLACEHOLDER body height as fraction of overall
wall_thk_mm        = 25;    // PLACEHOLDER plate/wall thickness

/* [String plan — string_count_concept = 3 (prompt), scale_length PLACEHOLDER] */
string_count       = 3;     // prompt-supplied concept constraint (family)
string_spacing_mm  = 60;    // PLACEHOLDER string spacing at bridge
scale_frac         = 0.8;   // PLACEHOLDER scale length as fraction of overall

/* [Stopping mechanism envelope — parametric-design.csv, all PLACEHOLDER] */
stop_position_ratio   = 0.5;  // PLACEHOLDER stop_position/scale_length (symbolic)
string_clearance_mm   = 20;   // PLACEHOLDER clearance to string
contact_displace_mm   = 15;   // PLACEHOLDER required contact displacement
player_input_travel_mm= 120;  // PLACEHOLDER lever/pedal input travel
lever_bank_height_mm  = 900;  // PLACEHOLDER hand-lever bank envelope height
pedal_bank_depth_mm   = 400;  // PLACEHOLDER foot-pedal bank envelope depth

/* [Frame / bow envelope — PLACEHOLDER] */
frame_width_mm     = 500;   // PLACEHOLDER mechanism support frame width
bow_clear_mm       = 300;   // PLACEHOLDER bow swept clearance envelope

// ---------------------------------------------------------------------------
// Derived geometry — DOCUMENTED symbolic relationships as formulas
// (parametric-design.csv). Honest, source-traceable part of the model.
// ---------------------------------------------------------------------------

scale_length_mm = overall_height_mm * scale_frac;

// stop_position = stop_position_ratio * scale_length.
function stop_position(ratio, scale) = ratio * scale;
stop_pos_mm = stop_position(stop_position_ratio, scale_length_mm);

// stop_contact_travel = clearance_to_string + required_contact_displacement.
function stop_contact_travel(clear, disp) = clear + disp;
stop_travel_mm = stop_contact_travel(string_clearance_mm, contact_displace_mm);

// linkage_ratio = stop_output_travel / player_input_travel.
function linkage_ratio(out, inp) = out / inp;
L_ratio = linkage_ratio(stop_travel_mm, player_input_travel_mm);

// lost_motion_budget = input_motion - effective_stop_motion (placeholder 0.1).
lost_motion_mm = player_input_travel_mm * 0.1;  // PLACEHOLDER 10% budget

body_height_mm = overall_height_mm * body_frac;

module body_shell() {
  // Oversized bowed-bass body near the base of the standing instrument.
  difference() {
    hull() {
      for (z = [body_depth_mm/2, body_height_mm - body_depth_mm/2])
        translate([body_width_mm/2, 0, z])
          rotate([-90,0,0]) cylinder(h = body_depth_mm, r = body_width_mm/2, $fn=48, center=true);
    }
    translate([0, 0, 0])
      hull() {
        for (z = [body_depth_mm/2 + wall_thk_mm, body_height_mm - body_depth_mm/2 - wall_thk_mm])
          translate([body_width_mm/2, 0, z])
            rotate([-90,0,0]) cylinder(h = body_depth_mm - 2*wall_thk_mm, r = body_width_mm/2 - wall_thk_mm, $fn=48, center=true);
      }
  }
}

module neck_and_strings() {
  // Extended neck/support head rising to overall height; 3 string lanes.
  translate([body_width_mm/2 - frame_width_mm/2, -body_depth_mm/4, body_height_mm])
    cube([frame_width_mm, 80, overall_height_mm - body_height_mm]);
  for (i = [0 : string_count-1])
    translate([body_width_mm/2 - (string_count-1)*string_spacing_mm/2 + i*string_spacing_mm,
               -body_depth_mm/4 - 10, body_height_mm*0.3])
      cube([3, 3, scale_length_mm]);   // PLACEHOLDER string standoff
}

module stop_mechanism_envelope() {
  // Lever bank (hand height) + pedal bank (floor) as reserved volumes only.
  translate([body_width_mm + 40, -pedal_bank_depth_mm/2, body_height_mm*1.1])
    cube([frame_width_mm, pedal_bank_depth_mm, lever_bank_height_mm]);   // lever bank
  translate([body_width_mm + 40, -pedal_bank_depth_mm/2, 0])
    cube([frame_width_mm, pedal_bank_depth_mm, 150]);                    // pedal bank
}

module octobass_assembly() {
  body_shell();
  neck_and_strings();
  stop_mechanism_envelope();
}

octobass_assembly();

echo(str("scale_length_mm=", scale_length_mm));
echo(str("stop_pos_mm=", stop_pos_mm));
echo(str("stop_travel_mm=", stop_travel_mm));
echo(str("linkage_ratio=", L_ratio));
echo(str("lost_motion_mm=", lost_motion_mm));
echo("AUTHORITY=pending_measurement; all leaf values are render-only placeholders.");
