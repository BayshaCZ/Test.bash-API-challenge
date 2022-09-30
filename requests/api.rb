require_relative '../spec/spec_helper'

@base_url = 'https://automationintesting.online'

module Room

  def self.conn
    Faraday.new(url: "https://automationintesting.online")
  end

  def self.login
    conn.post "auth/login" do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = Payloads.login
    end
  end

  def self.create_room(cookie = nil, payload)
    conn.post "room/" do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Cookie'] = cookie
      req.body = payload
    end
  end

  def self.delete_room(cookie, roomid)
    conn.delete("room/#{roomid}") do |req|
      req.headers['Cookie'] = cookie
    end
  end

end
