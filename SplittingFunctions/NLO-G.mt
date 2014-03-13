#!/usr/bin/math -script

(*============================================================================*)
(*                                                                            *)
(*  Copyright (C) 2014 Oleksandr Gituliar.                                    *)
(*                                                                            *)
(*  This file is part of Axiloop.                                             *)
(*                                                                            *)
(*  Axiloop is free software: you can redistribute it and/or modify           *)
(*  it under the terms of the GNU General Public License as published by      *)
(*  the Free Software Foundation, either version 3 of the License, or         *)
(*  (at your option) any later version.                                       *)
(*                                                                            *)
(*  This program is distributed in the hope that it will be useful,           *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of            *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *)
(*  GNU General Public License for more details.                              *)
(*                                                                            *)
(*  You should have received a copy of the GNU General Public License         *)
(*  along with this program.  If not, see <http://www.gnu.org/licenses/>.     *)
(*                                                                            *)
(*============================================================================*)

<< UnitTest`

<< Axiloop`


UT$BeginTestCase["NLO-G"];

  AX$Get["NLO-G.ms"];

  pqq = (1+x^2)/(1-x);


  UT$AssertEquivalent[
    $Get[$result, "Wbs"]
    ,
    AX$Get["NLO-G.ebs.mx"]
  ];

  UT$AssertEquivalent[
    $Get[$result, "Wz"]
    ,
    as^2/(-k.k) (pqq + (1-x) eps) 8/3
  ];

  UT$AssertEquivalent[
    $Get[$result, "Wr"]
    ,
    as^2 / (-k.k) (pqq + (1-x) eps) (-8/3) / eps
  ];


  $virt = 4 $Get[$result, "G1"];

  UT$AssertEquivalent[
    $virt
    ,
    aspi^2 (-8/3) ( pqq (Log[1-x] + Log[Q^2]) + (1-x))
  ];

  $real = aspi^2 (pqq (-20/9 - 4/3 Log[x] + 8/3 Log[1-x] + 8/3 Log[Q^2]));
  $full = aspi^2 (pqq (-20/9 - 4/3 Log[x]) - 8/3 (1-x));

  UT$AssertEquivalent[Simplify[Expand[$virt + $real - $full]], 0];


  $Wb = SplittingFunctionFormFactors[ $Get[$result, "Wb"] ];

  UT$AssertEquivalent[
    "W_uv^q" /. $Wb
    ,
    I g^4 pqq 8/3
  ];

UT$EndTestCase[];
