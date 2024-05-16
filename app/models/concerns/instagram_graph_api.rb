class InstagramGraphApi
  FB_BASE_URL = "https://graph.facebook.com/v19.0"

  def initialize(access_token:)
    @access_token = access_token
  end

  def instagram_page_id
    url = "#{FB_BASE_URL}/#{facebook_page_id}?fields=instagram_business_account&access_token=#{@access_token}"
    response = call(url)
    return nil unless response

    response['instagram_business_account']['id']
  end

  def stories
    url = "#{FB_BASE_URL}/#{instagram_page_id}/stories?fields=id,media_url,media_type,caption,timestamp,thumbnail_url&access_token=#{@access_token}"
    response = call(url)
    return nil unless response

    response['data']
  end

  def facebook_page_id
    url = "#{FB_BASE_URL}/me/accounts?access_token=#{@access_token}"
    response = call(url)
    return nil unless response

    response['data'][0]['id']
  end

  private

  def call(url)
    begin
      client = RestClient.get(url)
      JSON.parse(client.body)
    rescue RestClient::Exception, JSONError => e
      puts "Error fetching data from Instagram Graph API: #{e.message}"
      return nil
    end
  end
end