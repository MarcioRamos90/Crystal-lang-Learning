enum UserKind
  Guest
  Regular
  Admin
end

user_kind = UserKind::Regular
puts "This user is of kind #{user_kind}"