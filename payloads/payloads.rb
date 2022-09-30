module Payloads

  def self.login
    {
      username: "admin",
      password: "password"
    }.to_json
  end

  def self.room_no_features
    {
      accessible: false,
      description: "Lovely room with a view and a kitten",
      image: "https://www.randomkittengenerator.com/cats/22613.jpg",
      roomName: "222",
      roomPrice: 50,
      type: "Double"
    }.to_json
  end

  def self.room_with_features
    {
      accessible: false,
      description: "Lovely room with a view and a kitten",
      "features":[
        "WiFi",
        "TV",
        "Views"
      ],
      image: "https://www.randomkittengenerator.com/cats/13222.jpg",
      roomName: "99",
      roomPrice: 112,
      type: "Double"
    }.to_json
  end
end
