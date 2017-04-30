Fabricator(:room) do
  user

  title { Faker::Name.name }
end
