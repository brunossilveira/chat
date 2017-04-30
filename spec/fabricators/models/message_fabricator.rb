Fabricator(:message) do
  room
  user
  body { Faker::Lorem.sentence }
end
