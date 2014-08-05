require "cuba/test"
require "mote"
require_relative "../lib/mote/render"

Cuba.plugin(Mote::Render)
Cuba.settings[:mote][:views] = "./test/views"

Cuba.define do
  def name
    "App"
  end

  on "partial" do
    res.write partial("home")
  end

  on "view" do
    res.write view("home", title: "Hello")
  end

  on "render" do
    render("home", title: "Hola")
  end

  on "context" do
    res.write partial("context")
  end

  on "absolute" do
    render("./test/custom_views/custom.mote", title: "Custom")
  end

  on "absolute_layout" do
    render("./test/custom_views/custom.mote", title: "Custom Layout")
  end
end

scope do
  test "view renders view with layout" do
    expected = "<title>Hello</title>\n<h1>Home</h1>"

    get "/view"

    assert last_response.body[expected]
  end

  test "partial renders view without layout" do
    get "/partial"

    assert last_response.body["<h1>Home</h1>"]
  end

  test "render renders view with layout" do
    get "/render"

    assert last_response.body["<title>Hola</title>\n<h1>Home</h1>"]
  end

  test "access to application context" do
    get "/context"

    assert last_response.body["App"]
  end

  test "use of absolute path for template" do
    get "/absolute"

    assert last_response.body["<title>Custom</title>\n<h1>Custom</h1>"]
  end

  test "use of absolute path for layout" do
    Cuba.settings[:mote][:layout] = "./test/custom_views/layout.mote"

    get "/absolute_layout"

    assert last_response.body["<title>Custom Layout</title>\n<h1>Custom</h1>"]
  end
end
