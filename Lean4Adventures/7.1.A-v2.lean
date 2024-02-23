namespace grp

class has_op (α : Type u) (op : α → α → α) where
  op : α → α → α

class has_one (α : Type u) (op : α → α → α) where
  one : α
  right_id : ∀ a : α, op a one = a
  left_id : ∀ a : α, op one a = a

-- it seems that 'one' below is inferred by lean, since has_one is not within the scope of has_inv?

class has_inv (α : Type u) (op : α → α → α) where
  inv : α → α
  left_inverse : ∀ a : α, op (inv a) a = one
  right_inverse : ∀ a : α, op a (inv a) = one

class semigroup (α : Type u) (op : α → α → α) extends has_op α op where
  op_assoc : ∀ a b c : α, op (op a b) c = op a (op b c)

class monoid (α : Type u) (op : α → α → α) extends semigroup α op, has_one α op where
  r_id : ∀ a : α, op a one = a
  l_id : ∀ a : α, op one a = a

-- this is where i realised has_op is redundant and it's better to include op in class singatures - except if there's a way to make a class necessitate an argument more (op in this case) by extending it from another class (e.g. has_op) - this idea not super clear in my mind
-- actual fix without has_op in v3!
class group (α : Type u) (op : α → α → α) extends monoid α op, has_inv α op, has_op α op where
  l_inv : ∀ a : α, op (inv a) a = one
  r_inv : ∀ a : α, op a (inv a) = one

end grp
