module HandlebarsAssets
  module Config

    attr_writer :locales

    def locales
      @locales ||= I18n.available_locales
    end

  end
end
