require './requests/api.rb'

describe 'Room API' do

  context 'with a valid token' do
    before(:each) do
      login = Room.login
      expect(login.status).to be(200)
      @cookie = login.headers['set-cookie']
    end

    after(:each) do
      Room.delete_room(@cookie, @roomid)
    end

    it 'successfully creates a room without features' do
      create_room = Room.create_room(@cookie, Payloads.room_no_features)
      expect(create_room.status).to be(201)
      expect(create_room.body).to match_schema('create_room')
      json = JSON.parse(create_room.body)
      @roomid = json['roomid']
    end

    it 'successfully creates a room with features' do
      create_room = Room.create_room(@cookie, Payloads.room_with_features)
      expect(create_room.status).to be(201)
      expect(create_room.body).to match_schema('create_room')
      json = JSON.parse(create_room.body)
      @roomid = json['roomid']
    end

    it "doesn't allow to create same room name multiple times" do
      create_room = Room.create_room(@cookie, Payloads.room_with_features)
      expect(create_room.status).to be(201)
      json = JSON.parse(create_room.body)
      @roomid = json['roomid']
      create_second_room = Room.create_room(@cookie, Payloads.room_with_features)
      expect(create_second_room.status).to be(409)
    end

  end

  context 'without a valid token' do
    it 'is unable to create a room' do
      create_room = Room.create_room(Payloads.room_no_features)
      expect(create_room.status).to be(403)
    end
  end

end
