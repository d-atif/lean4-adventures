namespace grp

class has_one (α : Type u) (op : α → α → α) where
  id : α
  right_id : ∀ a : α, op a id = a
  left_id : ∀ a : α, op id a = a

class has_inv (α : Type u) (op : α → α → α) extends has_one α op where
  inv : α → α
  left_inverse : ∀ a : α, op (inv a) a = id
  right_inverse : ∀ a : α, op a (inv a) = id

class semigroup (α : Type u) (op : α → α → α) where
  op_assoc : ∀ a b c : α, op (op a b) c = op a (op b c)

class monoid (α : Type u) (op : α → α → α) extends semigroup α op, has_one α op where
  r_id : ∀ a : α, op a id = a
  l_id : ∀ a : α, op id a = a

class group (α : Type u) (op : α → α → α) extends monoid α op, has_inv α op where
  l_inv : ∀ a : α, op (inv a) a = id
  r_inv : ∀ a : α, op a (inv a) = id

class commutativeGroup (α : Type u) (op : α → α → α) extends group α op where
  mul_comm : ∀ a b : α, op a  b = op b a

-- Theorem 7.4
-- Let G (with operation *) and H (with operation ⋄) be groups. Define an operation ▪ on G ⨯ H by
-- (g, h) ▪ (g', h') = (g * g', h ⋄ h').
-- Then G ⨯ H is a group. If G and H are abelian, then so is G ⨯ H. If G and H are finite, then so is G ⨯ H and |G ⨯ H| = |G||H|


-- Attempt #1
-- example (α : Type u) (β : Type u) (op₁ : α → α → α) (op₂ ) [group α] [group β] where

-- Attempt #2

-- structure group_prod (G H : Type u) (op₁ : G → G → G) (op₂ : H → H → H)[group G op₁] [group H op₂] : Type := (carrier : G × H)

theorem group_product (G H: Type u) (op₁ : G → G → G) [group G op₁] (op₂ : H → H → H) [group H op₂] (op₃ : G × H → G × H → G × H):
  group (G × H) op₃  := sorry

end grp

-- namespace neww
structure SSemigroup : Type (u+1) :=
(carrier : Type u)
(mul : carrier → carrier → carrier)
(mul_assoc : ∀ a b c : carrier,
               mul (mul a b) c = mul a (mul b c))

-- instance Semigroup_has_mul (S : Semigroup) : has_mul (S.carrier) := ⟨S.mul⟩
-- instance HMul_inst (α : Type u) [has_mul α] : HMul α α α := ⟨ has_mul.mul ⟩
class has_mul (α : Type u) where
  mul : α → α → α
instance Semigroup_has_mul (S : SSemigroup) : has_mul (S.carrier) := ⟨S.mul⟩

-- end neww
