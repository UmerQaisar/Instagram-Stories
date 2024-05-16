class LongLivedToken
  FB_BASE_URL = "https://graph.facebook.com/v19.0"

  def get(access_token:)
    url = "#{FB_BASE_URL}/oauth/access_token?grant_type=fb_exchange_token&client_id=#{ENV['FACEBOOK_APP_ID']}&client_secret=#{ENV['FACEBOOK_APP_SECRET']}&fb_exchange_token=#{access_token}"
    begin
      client = RestClient.get(url)
      response = JSON.parse(client.body)
      expires_at = response['expires_in'] ? (Time.now + response['expires_in']) : nil
      [response['access_token'], expires_at]
    rescue RestClient::Exception => e
      puts e.message
    end
  end
end
