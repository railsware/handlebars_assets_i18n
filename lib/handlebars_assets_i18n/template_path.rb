module HandlebarsAssets
  class TiltHandlebars
    class TemplatePath

      def i18n?
        is_haml? or is_slim?
      end

      def name
        "#{relative_path}_#{I18n.locale}".dump
      end

    end
  end
end
