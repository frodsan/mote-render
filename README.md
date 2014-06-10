mote-render
===========

Mote plugin for Cuba. This plugin was extracted from the
[cuba-contrib][cuba-contrib] gem, made by [cyx][cyx].

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
called `layout.mote`.

The defaults can be changed through the `Cuba.settings` method:

```ruby
Cuba.settings[:mote][:views] = "./views/admin/"
Cuba.settings[:mote][:layout] = "admin"
```

### Layouts

To render inner content into a layout, use the `{{ content }}` tag.

```html
<html>
  <head>
    <title>Mote Layout</title>
  </head>
  <body>
    <h1>Hello, mote!</h1>
    {{ content }}
  </body>
</html>
```

### Helpers

You can use the `app` variable to access the application helpers.

```ruby
Cuba.define do
  def h(unsafe)
    ...
  end
end
```

```html
<h1>{{ app.h("unsafe") }}</h1>

{{ app.partial("list") }}
```

Installation
------------

```
$ gem install mote-render
```

[cuba]: https://github.com/soveran/cuba
[cuba-contrib]: https://github.com/cyx/cuba-contrib
[cyx]: https://github.com/cyx
[mote]: https://github.com/soveran/mote
