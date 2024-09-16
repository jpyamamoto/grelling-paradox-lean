import Lake
open Lake DSL

package "grelling" where
  -- add package configuration options here

lean_lib «Grelling» where
  -- add library configuration options here

require batteries from git
  "https://github.com/leanprover-community/batteries" @ "main"
require mathlib from git
  "https://github.com/leanprover-community/mathlib4"
