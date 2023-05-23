require 'json'

def save_data(data, file)
    hashed_data = data.map(&:to_h)
    json = JSON.generate(hashed_data)
    File.write(file, json)
  end
end