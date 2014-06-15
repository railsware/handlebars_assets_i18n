# HandlebarsAssetsI18n

Very simple [handlebars_assets](https://github.com/leshill/handlebars_assets) internationalization for `.hamlbars` and `.slimbars` that allows your to have precompiled translated templates for each desired locale. So that you don't need translate it on client side on the fly.

## Installation

Add this line to your application's Gemfile:

    gem 'handlebars_assets_i18n'

## Configuration

By default templates will be precompiled with all available locales.
You can restrict it using `locales` configuration option:

```ruby
HandlebarsAssets::Config.locales = [:en, :de]
```

## How it works

If you file is `app/javascripts/templates/shared/errors.hamlbars` or `app/javascripts/templates/shared/errors.slimbars` and your locales are `:en` and `:de` then the assets pipeline will compile code for each locale and store it under corresponding names `HandlebarsAssets['shared/errors_en']` and `HandlebarsAssets['shared/errors_de']`.


## Using with Marionette

Export current locale in your `layouts/application.html.haml` to client side:

```haml
...
:javascript
  MyApp.locale = '#{I18n.locale}'
...
```

Internationalize your Marionette renderer:

```coffee

Marionette.Renderer.render = (template, context) ->
  template = "#{template}_#{MyApp.locale}"

  unless HandlebarsTemplates[template]
    throw "Template '#{template}' not found!"

  HandlebarsTemplates[template](data)

```

That's all.

Now you can use `I18n.translate` and `I18n.localize` helpers in `.hamlbars` or `.slimbars`.
Also if you use this gem with `rails` then you can use rails `t` and `l` helpers`:


```hamlbars
%h2
  =t 'title.errors'

%ul
  {{#each errors}}
  %li {{.}
  {{/each}}
```

## Benefits

* Easy to plug in.
* Fast due to precompiled templates with translations.
* No I18n javascript code required.
* Translation keys are not exported to client side.

## Penalty of Simplicity

* Please remember that translation is performed on precompilation phase. Not at runtime.
* You must recompile templates if you changed translations in `config/locales`.
* You can't use interpolation features.

## Author

[Andriy Yanko](http://ayanko.github.io/)

## License

* Copyright (c) 2014 Railsware [www.railsware.com](http://www.railsware.com)
* [MIT](www.opensource.org/licenses/MIT)
