(* Octobass parametric acoustic and mechanism model.
   Reference-only source model: all physical values are estimates pending
   measurement and are not fabrication authority. *)

ClearAll["Global`*"];

metadata = <|
   "instrument" -> "octobass",
   "packet" -> "Round 8 Wolfram build-packet model",
   "modelName" -> "Long bowed-string, remote stop, linkage, and structure relationships",
   "authority" -> "reference_only",
   "wolframVersionTarget" -> "14.3"
   |>;

stringFrequencyExpression = HoldForm[
   f == (1/(2 L)) Sqrt[T/mu]
   ];

stopPositionExpression = HoldForm[
   stoppedLength == scaleLength*stopPositionRatio
   ];

linkageExpression = HoldForm[
   stopOutputTravel == playerInputTravel*linkageRatio - lostMotion
   ];

frameDeflectionExpression = HoldForm[
   deflectionRatio == estimatedDeflection/stringLoadReference
   ];

scaleLengthByStringEstimate = {3.2, 3.0, 2.8}; (* estimate - pending measurement, not fabrication authority *)
stringTensionByStringEstimate = {360.0, 330.0, 300.0}; (* estimate - pending measurement, not fabrication authority *)
linearDensityByStringEstimate = {0.075, 0.058, 0.044}; (* estimate - pending measurement, not fabrication authority *)
stringCountEstimate = 3; (* estimate - pending measurement, not fabrication authority *)
activeStringEstimate = 1; (* estimate - pending measurement, not fabrication authority *)
stopPositionRatioEstimate = 0.50; (* estimate - pending measurement, not fabrication authority *)
stopPositionRatioMinEstimate = 0.20; (* estimate - pending measurement, not fabrication authority *)
stopPositionRatioMaxEstimate = 0.95; (* estimate - pending measurement, not fabrication authority *)
playerInputTravelEstimate = 0.120; (* estimate - pending measurement, not fabrication authority *)
playerInputTravelMinEstimate = 0.020; (* estimate - pending measurement, not fabrication authority *)
playerInputTravelMaxEstimate = 0.300; (* estimate - pending measurement, not fabrication authority *)
linkageRatioEstimate = 0.35; (* estimate - pending measurement, not fabrication authority *)
linkageRatioMinEstimate = 0.05; (* estimate - pending measurement, not fabrication authority *)
linkageRatioMaxEstimate = 1.20; (* estimate - pending measurement, not fabrication authority *)
lostMotionEstimate = 0.006; (* estimate - pending measurement, not fabrication authority *)
lostMotionMinEstimate = 0.000; (* estimate - pending measurement, not fabrication authority *)
lostMotionMaxEstimate = 0.060; (* estimate - pending measurement, not fabrication authority *)
requiredContactDisplacementEstimate = 0.018; (* estimate - pending measurement, not fabrication authority *)
requiredContactDisplacementMinEstimate = 0.002; (* estimate - pending measurement, not fabrication authority *)
requiredContactDisplacementMaxEstimate = 0.060; (* estimate - pending measurement, not fabrication authority *)
stopForceEstimate = 90.0; (* estimate - pending measurement, not fabrication authority *)
stopForceMinEstimate = 10.0; (* estimate - pending measurement, not fabrication authority *)
stopForceMaxEstimate = 400.0; (* estimate - pending measurement, not fabrication authority *)
stringLoadReferenceEstimate = 990.0; (* estimate - pending measurement, not fabrication authority *)
stringLoadReferenceMinEstimate = 100.0; (* estimate - pending measurement, not fabrication authority *)
stringLoadReferenceMaxEstimate = 2000.0; (* estimate - pending measurement, not fabrication authority *)
estimatedFrameDeflectionEstimate = 0.004; (* estimate - pending measurement, not fabrication authority *)
estimatedFrameDeflectionMinEstimate = 0.0002; (* estimate - pending measurement, not fabrication authority *)
estimatedFrameDeflectionMaxEstimate = 0.030; (* estimate - pending measurement, not fabrication authority *)
bowSweepEnvelopeEstimate = 0.180; (* estimate - pending measurement, not fabrication authority *)
bowSweepEnvelopeMinEstimate = 0.030; (* estimate - pending measurement, not fabrication authority *)
bowSweepEnvelopeMaxEstimate = 0.400; (* estimate - pending measurement, not fabrication authority *)
mechanismEnvelopeEstimate = 0.080; (* estimate - pending measurement, not fabrication authority *)
mechanismEnvelopeMinEstimate = 0.010; (* estimate - pending measurement, not fabrication authority *)
mechanismEnvelopeMaxEstimate = 0.300; (* estimate - pending measurement, not fabrication authority *)

stringFrequency[length_, tension_, linearDensity_] :=
  (1/(2 length)) Sqrt[tension/linearDensity];

stoppedLengthFromRatio[scaleLength_, stopPositionRatio_] :=
  scaleLength*stopPositionRatio;

stopOutputTravel[playerInputTravel_, linkageRatio_, lostMotion_] :=
  playerInputTravel*linkageRatio - lostMotion;

contactReserve[stopOutputTravelValue_, requiredContactDisplacement_] :=
  stopOutputTravelValue - requiredContactDisplacement;

frameDeflectionRatio[estimatedDeflection_, stringLoadReference_] :=
  estimatedDeflection/stringLoadReference;

bowClearanceMargin[bowSweepEnvelope_, mechanismEnvelope_] :=
  bowSweepEnvelope - mechanismEnvelope;

modelSummary = <|
   "stringLaw" -> stringFrequencyExpression,
   "stopPosition" -> stopPositionExpression,
   "linkage" -> linkageExpression,
   "frameDeflection" -> frameDeflectionExpression,
   "measurementStatus" -> "All numerical inputs are estimates pending measurement; not fabrication authority."
   |>;

octobassExplorer = Manipulate[
 Module[
  {
   scaleLength,
   tension,
   linearDensity,
   stoppedLength,
   computedFrequency,
   outputTravel,
   reserve,
   deflectionProxy,
   stopForceRatio,
   bowMargin
   },
  scaleLength = scaleLengthByStringEstimate[[activeStringIndex]];
  tension = stringTensionByStringEstimate[[activeStringIndex]];
  linearDensity = linearDensityByStringEstimate[[activeStringIndex]];
  stoppedLength = stoppedLengthFromRatio[scaleLength, stopPositionRatio];
  computedFrequency = stringFrequency[stoppedLength, tension, linearDensity];
  outputTravel = stopOutputTravel[playerInputTravelM, linkageRatio, lostMotionM];
  reserve = contactReserve[outputTravel, requiredContactDisplacementM];
  deflectionProxy =
   frameDeflectionRatio[estimatedFrameDeflectionM, stringLoadReferenceN];
  stopForceRatio = stopForceN/stringLoadReferenceN;
  bowMargin = bowClearanceMargin[bowSweepEnvelopeM, mechanismEnvelopeM];
  Column[
   {
    Style["Octobass reference-only parametric model", 16, Bold],
    metadata,
    Grid[
     {
      {"active string index", activeStringIndex},
      {"scale length estimate used (m)", NumberForm[scaleLength, {6, 3}]},
      {"stopped length from ratio (m)", NumberForm[stoppedLength, {6, 3}]},
      {"computed string relationship (Hz from estimates)", NumberForm[computedFrequency, {7, 2}]},
      {"stop output travel (m)", NumberForm[outputTravel, {7, 4}]},
      {"contact travel reserve (m)", NumberForm[reserve, {7, 4}]},
      {"stop force to string-load proxy", NumberForm[stopForceRatio, {6, 3}]},
      {"frame deflection proxy (m/N)", ScientificForm[deflectionProxy, 3]},
      {"bow clearance margin (m)", NumberForm[bowMargin, {7, 4}]}
      },
     Frame -> All
     ],
    Style[
     "Every displayed value is computed from estimate placeholders only; pending measurement, not fabrication authority.",
     11,
     Darker[Red]
     ]
    }
   ]
  ],
 {{activeStringIndex, activeStringEstimate, "active string"}, 1, stringCountEstimate, 1,
  Appearance -> "Labeled"},
 {{stopPositionRatio, stopPositionRatioEstimate, "stop position ratio"},
  stopPositionRatioMinEstimate, stopPositionRatioMaxEstimate, Appearance -> "Labeled"},
 Delimiter,
 {{playerInputTravelM, playerInputTravelEstimate, "player input travel m"},
  playerInputTravelMinEstimate, playerInputTravelMaxEstimate, Appearance -> "Labeled"},
 {{linkageRatio, linkageRatioEstimate, "linkage ratio"}, linkageRatioMinEstimate,
  linkageRatioMaxEstimate, Appearance -> "Labeled"},
 {{lostMotionM, lostMotionEstimate, "lost motion m"}, lostMotionMinEstimate,
  lostMotionMaxEstimate, Appearance -> "Labeled"},
 {{requiredContactDisplacementM, requiredContactDisplacementEstimate,
   "required contact displacement m"}, requiredContactDisplacementMinEstimate,
  requiredContactDisplacementMaxEstimate, Appearance -> "Labeled"},
 Delimiter,
 {{stopForceN, stopForceEstimate, "stop force N"}, stopForceMinEstimate,
  stopForceMaxEstimate, Appearance -> "Labeled"},
 {{stringLoadReferenceN, stringLoadReferenceEstimate, "string load reference N"},
  stringLoadReferenceMinEstimate, stringLoadReferenceMaxEstimate,
  Appearance -> "Labeled"},
 {{estimatedFrameDeflectionM, estimatedFrameDeflectionEstimate,
   "estimated frame deflection m"}, estimatedFrameDeflectionMinEstimate,
  estimatedFrameDeflectionMaxEstimate, Appearance -> "Labeled"},
 Delimiter,
 {{bowSweepEnvelopeM, bowSweepEnvelopeEstimate, "bow sweep envelope m"},
  bowSweepEnvelopeMinEstimate, bowSweepEnvelopeMaxEstimate, Appearance -> "Labeled"},
 {{mechanismEnvelopeM, mechanismEnvelopeEstimate, "mechanism envelope m"},
  mechanismEnvelopeMinEstimate, mechanismEnvelopeMaxEstimate, Appearance -> "Labeled"},
 ControlPlacement -> Left,
 SaveDefinitions -> True
 ]
