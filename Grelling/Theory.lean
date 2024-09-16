-- Theory

-- Definitions and axioms for Simple Type Theory.

-- (means v F) is notation for "v means property F"
--   where (v : Prop) and (F : Prop -> Prop)
variable (means : (Prop -> (Prop -> Prop) -> Prop))

-- The property of being Heterological.
def Het (v : Prop) : Prop :=
 ∃ (F : Prop -> Prop), (means v F) ∧ ¬ (F v)

-- Axiom of uniqueness of meaning
axiom uniqueness (v : Prop) (F G : Prop -> Prop) :
 (means v F) ∧ (means v G) -> F = G

-- An arbitrary proposition
variable (v : Prop)

-- het is notation for 'Het': (λ v . Het(v))
-- The property of being heterological
def het := Het means v

-- Postulate that: het means to be Heterological.
axiom postulate : means (het means v) (fun x => Het means x)
