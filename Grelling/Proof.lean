import Mathlib.Tactic
import Grelling.Theory

open Classical

-- Grelling's Paradox using a Classical Formulation
theorem grelling {means : Prop -> (Prop -> Prop) -> Prop} {v : Prop} : false := by
  -- Excluded middle is used
  have options := Classical.em (Het means (het means v))

  -- Proof by cases
  cases' options with h h

  -- Positive case
  . exfalso
    have h' := h
    rw [Het] at h
    cases' h with F hF
    have eqF : F = (fun x => Het means x) := by
      apply (uniqueness means (het means v))
      constructor
      . cases' hF with l _r
        exact l
      . exact (postulate means v)
    rw [eqF] at hF
    simp at hF
    cases' hF with _l r
    apply r
    exact h'

  -- Negative case
  . exfalso
    have h' := h
    rw [Het] at h
    have hF : ¬ ((means (het means v) (fun x => Het means x)) ∧ ¬ ((fun x => (Het means x)) (het means v))) := by
      intro H
      apply h
      cases' H with l r
      use (fun x => Het means x)
    simp at hF
    have hP := postulate means v
    apply hF at hP
    apply h'
    trivial
