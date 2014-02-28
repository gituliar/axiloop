BeginPackage["Axiloop`FeynmanRules`", {
    "Axiloop`GammaTrace`"}];

  FP::usage =
  "FP[momentum, Line -> f1] -- a fermion propagator in the light-cone gauge."

  FPx::usage =
  "FPx[momentum, Line -> f1] -- a crossed (final-state, on-shell) fermion
  propagator in the light-cone gauge."

  FV::usage =
  "FV[index, Line -> f1] -- a fermion vertex in the light-cone gauge."

  GP::usage =
  "GP[mu, nu, p] -- a gluon propagator in the light-cone gauge."

  GPx::usage =
  "GPx[mu, nu, p] -- a crossed (final-state, on-shell) gluon propagator in
  the light-cone gauge."

  GV::usage =
  "GV[i1,p1, i2,p2, i3,p3] -- a gluon vertex in the light-cone gauge."

  as::usage = "g^2 / (4 Pi)";

  aspi::usage = "Alpha_s / (2 Pi)";

  g::usage =
  "Quark-gluon coupling constant."

  n::usage =
  "Light-cone gauge vector; n.n = 0."

  Begin["`Private`"]

    as = g^2 / (4 Pi);
    aspi = as / (2 Pi);

    Options[FP] = {Line -> f1};
    FP[p_, OptionsPattern[]] := I/p.p G[p, Line -> OptionValue[Line]];

    Options[FPx] = {Line -> f1};
    FPx[p_, OptionsPattern[]] := G[p, Line -> OptionValue[Line]];

    Options[FV] = {Line -> f1};
    FV[mu_, OptionsPattern[]] := - I g G[{mu}, Line -> OptionValue[Line]];

    GP[mu_, nu_, p_] := I/p.p (- {mu}.{nu} + (p.{mu} n.{nu} + n.{mu} p.{nu}) / p.n);

    GPx[mu_, nu_, p_] := (- {mu}.{nu} + (p.{mu} n.{nu} + n.{mu} p.{nu}) / p.n);

    GV[i1_,p1_, i2_,p2_, i3_,p3_] :=
      g ({i1}.{i2} (p1.{i3}-p2.{i3}) + {i2}.{i3} (p2.{i1}-p3.{i1}) + {i3}.{i1} (p3.{i2}-p1.{i2}));

  End[];

EndPackage[];
