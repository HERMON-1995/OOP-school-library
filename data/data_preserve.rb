require 'json'

def save_data(data, file)
  hashed_data = data.map(&:to_h)
  json = JSON.generate(hashed_data)
  File.write(file, json)
end

def read_data(file)
  if File.exist?(file)
    data = File.read(file)
    JSON.parse(data)
  else
    []
  end
end
