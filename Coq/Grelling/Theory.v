Section Theory.

  Variable (means : Prop -> (Prop -> Prop) -> Prop).

  Definition Het (v : Prop) : Prop := 
    exists (F : Prop -> Prop), (means v F) /\ ~ (F v).

  Axiom Uniqueness : forall (v : Prop) (F G : Prop -> Prop),
    (means v F) /\ (means v G) -> F = G.

  Variable (v : Prop).

  Definition het := Het v.

  Axiom Postulate : means het (fun x => Het x).

End Theory.
