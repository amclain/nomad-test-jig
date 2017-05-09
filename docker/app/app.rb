require 'cuba'

def not_found!
  res.status = 404
  res.write "not found"
end

Cuba.define do
  on "health", get do
    res.write "ok"
  end

  on root, get do
    res.write "hello world"
  end

  not_found!
end
