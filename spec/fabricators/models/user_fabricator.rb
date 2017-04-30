Fabricator(:user) do
  email { Faker::Internet.email }
  dialect { Dialect.list.sample }
  password { 'password' }
  password_confirmation { 'password' }
end
