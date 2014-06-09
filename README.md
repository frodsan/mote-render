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

`Mote::Render` comes with three helpful methods: `partial`, `view` and
`render`.

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

Installation
------------

```
$ gem install mote-render
```

[cuba]: https://github.com/soveran/cuba
[cuba-contrib]: https://github.com/cyx/cuba-contrib
[mote]: https://github.com/soveran/mote
