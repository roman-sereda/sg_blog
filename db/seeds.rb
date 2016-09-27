10.times do |n|
  Post.create(title: "number_#{n}", body: "abcdefghgklmnopqrs
  tuvwxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopq
  rstuvwxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyzhgklmnopqrstuv
  wxyzabcdefghgklmnopqrstuvwxyzabcdefghgklmnopqrstuvwxyz")
end
