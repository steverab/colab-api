class App < Sinatra::Application
  before do
    content_type 'text/plain'
  end
  
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
end
