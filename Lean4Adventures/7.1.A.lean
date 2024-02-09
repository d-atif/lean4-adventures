import Mathlib.Algebra.Group.Basic

namespace grp

class has_mul (α : Type u) where
  mul : α → α → α

class has_one (α : Type u) where
  one : α

class has_inv (α : Type u) where
  inv : α → α

instance HMul_inst (α : Type u) [has_mul α] : HMul α α α := ⟨ has_mul.mul ⟩

class semigroup (α : Type u) extends has_mul α where
  mul_assoc (a b c : α) : a * b * c = (a * b) * c

class monoid (α : Type u) extends semigroup α, has_one α where
  one_mul (a : α) : one * a = a
  mul_one (a : α) : a * one = a
  -- (one_mul : ∀ a : α, one * a = a) (mul_one : ∀ a : α, a * one = a)
  -- (one_mul : ∀ a : α, 1 * a = a) (mul_one : ∀ a : α, a * 1 = a)

class group (α : Type u) extends monoid α, has_inv α, has_mul α where
  mul_left_inv (a : α) : inv a * a = one
  left_inv_mul (a : α) : inv a * a = one
  right_mul_inv (a : α) : a * inv a = one

  -- (mul_assoc : ∀ a b c : α, a * b * c = a * (b * c))
end grp
