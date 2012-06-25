(*============================================================================*)
(*                                                                            *)
(*  Copyright (C) 2012 Oleksandr Gituliar.                                    *)
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

(*  Unit tests for Axiloop package.                                           *)

Needs["Axiloop`"]

(* EquivalenceFunction for Test. It turns out that Equal doesn't do the job. *)
EqualSimplify[x_, y_] := Module[{},
	If[ListQ[x] && ListQ[y],
		EqualSimplify[First[x], First[y]] && EqualSimplify[Rest[x], Rest[y]],
	If[StringQ[x] && StringQ[y],
		SameQ[x, y],
		SameQ[0, Simplify[x-y]]
	]]
];
