json.extract! search_word, :id, :word, :isSearched?, :created_at, :updated_at
json.url search_word_url(search_word, format: :json)
