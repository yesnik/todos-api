module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end
end

RSpec.configure do |config|
  config.include RequestSpecHelper
end
