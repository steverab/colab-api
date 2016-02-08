class App < Sinatra::Application
  before do
    content_type :txt
  end
  
  # Standard errors
  
  not_found do
    '404 - Not Found'
  end

  error 401 do
    '401 - Unauthorized'
  end

  error 403 do
    '403 - Forbidden'
  end

  error 426 do
    '426 - Upgrade Required'
  end

  error do
    '500 - Internal Server Error'
  end
  
  # ActiveRecord errors
  
  error ActiveRecord::RecordNotFound do
    halt 404
  end
  
end
