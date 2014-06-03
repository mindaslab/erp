module Searchable
  extend ActiveSupport::Concern
  
  included do
    ##
    # A simple search method
    def self.search text
      columns = self::SearchableColumns
      words = text.downcase.gsub(/[^a-z0-9\s]/i, ' ').split(/\s+/)
      query_array_2 = []
      for word in words
            query_array = []
      	for column in columns
      	    query_array << "lower(#{column}) like '%#{word}%'"
      	end
      	query_array_2 << query_array.join(' or ')
      end
      query = query_array_2.collect{|e| "(#{e})"}.join(' and ')
      self.where query
    end
  end
end
