namespace grp

-- Group definition constructed step by step following (*insert that link*) with modifications

class has_mul (α : Type u) where
  mul : α → α → α

class has_one (α : Type u) where
  one : α

class has_inv (α : Type u) where
  inv : α → α

instance HMul_inst (α : Type u) [has_mul α] : HMul α α α := ⟨ has_mul.mul ⟩

class semigroup (α : Type u) extends has_mul α where
  mul_assoc : ∀ a b c : α, a * b * c = (a * b) * c

class monoid (α : Type u) extends semigroup α, has_one α where
  one_mul : ∀ a : α, one * a = a
  mul_one : ∀ a : α, a * one = a
  -- (one_mul : ∀ a : α, one * a = a) (mul_one : ∀ a : α, a * one = a)
  -- (one_mul : ∀ a : α, 1 * a = a) (mul_one : ∀ a : α, a * 1 = a)

class group (α : Type u) extends monoid α, has_inv α, has_mul α where
  mul_left_inv : ∀ a : α, inv a * a = one
  left_inv_mul : ∀ a : α, inv a * a = one
  right_mul_inv : ∀ a : α, a * inv a = one

  -- (mul_assoc : ∀ a b c : α, a * b * c = a * (b * c))

-- Theorem 7.4
-- Let G (with operation *) and H (with operation ⋄) be groups. Define an operation ▪ on G ⨯ H by
-- (g, h) ▪ (g', h') = (g * g', h ⋄ h').
-- Then G ⨯ H is a group. If G and H are abelian, then so is G ⨯ H. If G and H are finite, then so is G ⨯ H and |G ⨯ H| = |G||H|

-- theorem

-- Define now an abelian (commutative) group
class commutativeGroup (α : Type u) extends group α where
  mul_comm : ∀ a b : α, a * b = b * a


end grp
