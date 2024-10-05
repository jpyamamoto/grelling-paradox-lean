Require Import Theory.
Require Import Classical.

Theorem Grelling : 
  forall (means : Prop -> (Prop -> Prop) -> Prop)
  (v : Prop), False.
Proof.
  intros.

  assert (lem : (Het means (het means v)) \/ ~(Het means (het means v)))
    by (exact (classic (Het means (het means v)))).

  destruct lem.

  - assert (H' : Het means (het means v)) by (exact H).
    unfold Het in H.
    destruct H as [F HF].
    assert (EqF : F = (fun x => Het means x)) by (
      apply (Uniqueness means (het means v));
      split;
      destruct HF as [H0 H1]; trivial;
      exact (Postulate means v)
    ).
    rewrite EqF in HF.

    destruct HF as [HPos HNeg].
    apply HNeg.
    exact H'.

- assert (H' : ~ Het means (het means v)) by (exact H).
  assert (HF : ~ ((means (het means v) (fun x => Het means x)) /\ ~ ((fun x => Het means x) (het means v)))) by (
    intro H0;
    apply H;
    destruct H0 as [L R];
    unfold Het;
    exists (fun x => Het means x);
    split;
    trivial
  ).
  assert (HP : means (het means v) (fun x => Het means x)) by (exact (Postulate means v)).
  simpl in HF.
  apply HF.
  split.
  + exact HP.
  + exact H'.
Qed.

