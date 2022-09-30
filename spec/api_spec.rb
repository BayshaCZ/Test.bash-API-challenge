require './requests/api.rb'

describe 'Room API' do

  before(:each) do
    login = Room.login
    expect(login.status).to be(200)
    @cookie = login.headers['set-cookie']
  end

  it 'successfully creates a room without features' do
    create_room = Room.create_room(@cookie, Payloads.room_no_features)
    expect(create_room.status).to be(201)
    expect(create_room.body).to match_schema('create_room')
  end

  it 'successfully creates a room with features' do
    create_room = Room.create_room(@cookie, Payloads.room_with_features)
    expect(create_room.status).to be(201)
    expect(create_room.body).to match_schema('create_room')
  end

  it "doesn't allow to create same room name multiple times" do
    create_room = Room.create_room(@cookie, Payloads.room_with_features)
    expect(create_room.status).to be(201)
    create_second_room = Room.create_room(@cookie, Payloads.room_with_features)
    expect(create_second_room.status).to be(409)
  end

end
