Fabricator(:user) do
  email    FFaker::Internet.email
  password FFaker::Internet.password
end
