require_relative '../spec/spec_helper'

@base_url = 'https://automationintesting.online'

module Room

  def self.conn
    Faraday.new(url: "https://automationintesting.online") do |faraday|
      faraday.response :logger, nil, { headers: true, bodies: true }
    end
  end

  def self.login
    conn.post "auth/login" do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = Payloads.login
    end
  end

  def self.create_room(cookie, payload)
    conn.post "room/" do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Cookie'] = cookie
      req.body = payload
    end
  end

end
