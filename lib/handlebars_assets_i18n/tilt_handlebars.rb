module HandlebarsAssets
  class TiltHandlebars

    alias_method :evaluate_without_i18n, :evaluate

    def evaluate_with_i18n(scope, locals, &block)
      HandlebarsAssets::Config.locales.map do |locale|
        I18n.with_locale(locale) do
          evaluate_without_i18n(scope, locals, &block)
        end
      end.join("\n")
    end

    def evaluate(scope, locals, &block)
      template_path = TemplatePath.new(scope)

      if template_path.i18n? and not HandlebarsAssets::Config.locales.empty?
        evaluate_with_i18n(scope, locals, &block)
      else
        evaluate_without_i18n(scope, locals, &block)
      end
    end

  end
end
