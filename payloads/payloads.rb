module Payloads

  def self.login
    {
      username: "admin",
      password: "password"
    }.to_json
  end

  def self.room
    {
      accessible: false,
      description: "Lovely room with a view and a kitten",
      image: "https://www.randomkittengenerator.com/cats/22613.jpg",
      roomNumber: 222,
      roomPrice: 50,
      type: "Double"
    }.to_json
  end
end
