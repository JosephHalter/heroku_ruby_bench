class App
  def call(env)
    body = StringIO.new "Hello World!"
    [200, {"Content-Type" => "text/plain"}, body]
  end
end
run App.new
