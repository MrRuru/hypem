module Hypem
  class TrackFavoritesRequest < Request
    
    base_uri 'http://hypem.com/inc'
    format :html
    
    # Extract the response in a user names enumerator
    def self.get_data(path)
      response = get(path)
      
      # Handling error cases
      if response.response.code_type != Net::HTTPOK
        throw response.response.code_type
      end
      
      return response.body.scan(/<span>(\w*)<\/span>/).flatten
    end
    
  end
end