require './requests/api.rb'

describe 'Room API' do

  it 'successfully creates a room' do
    login = Room.login
    expect(login.status).to be(200)
    cookie = login.headers['set-cookie']

    create_room = Room.create_room(cookie)
    expect(create_room.status).to be(201)
  end

end
