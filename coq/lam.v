Require Import String.

Inductive term : Set :=
| Var : string -> term
| Abs : string -> term -> term
| App : term -> term -> term.

Fixpoint notFreeIn (x : string) (e : term) : Prop :=
match e with
| Var y => x <> y
| Abs y e1 => x = y \/ notFreeIn x e1
| App e1 e2 => notFreeIn x e1 /\ notFreeIn x e2
end.

Fixpoint subst (rep : term) (x : string) (e : term) : term :=
match e with
| Var y => if string_dec y x then rep else Var y
| Abs y e1 => if string_dec y x then Abs y e1 else Abs y (subst rep x e1)
| App e1 e2 => App (subst rep x e1) (subst rep x e2)
end.

Theorem subst_comm : forall rep1 x1 rep2 x2 e,
  (forall x, notFreeIn x rep1)
  -> (forall x, notFreeIn x rep2)
  -> x1 <> x2
  -> subst rep1 x1 (subst rep2 x2 e)
      = subst rep2 x2 (subst rep1 x1 e)
.
Proof.
intros.
induction e.
simpl.
destruct (string_dec s x2).
destruct (string_dec s x1).
congruence.
simpl.
destruct (string_dec s x2).
induction rep2; simpl.
destruct (string_dec s0 x1); congruence.
destruct (string_dec s0 x1).
reflexivity.
rewrite IHrep2.
reflexivity.