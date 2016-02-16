class App < Sinatra::Application
  before do
    content_type :json
  end

  # Standard errors

  error 401 do
    {:status => 401, :message => "Unauthorized"}.to_json
  end

  error 403 do
    {:status => 403, :message => "Forbidden"}.to_json
  end

  not_found do
    {:status => 404, :message => "Not Found"}.to_json
  end

  error 426 do
    {:status => 426, :message => "Upgrade Required"}.to_json
  end

  error do
    {:status => 500, :message => "Internal Server Error"}.to_json
  end

  # ActiveRecord errors

  error ActiveRecord::RecordNotFound do
    halt 404
  end

end
