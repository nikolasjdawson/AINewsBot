class Item < ApplicationRecord
  belongs_to :feed_source

  after_create :fetch_info

  def fetch_info
    item_info = MetaInspector.new(self.link)
    self.update(description: item_info.description)
  end

  def twitter_card
    link = self.link
    uri = URI.parse('https://publish.twitter.com/oembed?url=' + link)
    response = Net::HTTP.get_response(uri)
    if response.code == "200"
      json = JSON.parse response.body
      card = json['html']
    else
      self.destroy
      return ""
    end
  end
end

# https://twitter.com/Mc_Snz/status/1095763932688596994
