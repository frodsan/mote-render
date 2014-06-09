mote-render
===========

Mote plugin for Cuba.

Usage
-----

To use Mote, you need to load the `Mote::Render` plugin as shown below:

```ruby
require "mote/render"

Cuba.plugin(Mote::Render)
```

`Mote::Render` provides three helper methods for rendering templates:
`partial`, `view` and `render`.

```ruby
Cuba.define do
  on "about" do
    # `partial` renders a template without a layout.
    res.write partial("about")
  end

  on "home" do
    # `view` renders a template within a layout.
    res.write view("about")
  end

  on "contact" do
    # `render` is a shortcut to `res.write view(...)`
    render("contact")
  end
end
```

By default, `Mote::Render` assumes that all view templates are placed
in a folder named `views` and that they use the `.mote` extension. Also
for `view` and `render` methods, it assumes that the layout template is
called `layout`.

The defaults can be changed through the `Cuba.settings` method:

```ruby
Cuba.settings[:mote][:views] = "./views/admin/"
Cuba.settings[:mote][:layout] = "admin"
```

Installation
------------

```
$ gem install mote-render
```

[cuba]: https://github.com/soveran/cuba
[cuba-contrib]: https://github.com/cyx/cuba-contrib
[mote]: https://github.com/soveran/mote
