require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Hightail
  class Generator < Rails::Generators::AppGenerator
    class_option :database,
      type: :string,
      aliases: '-d',
      default: 'postgresql',
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_test_unit,
      type: :boolean,
      aliases: '-T',
      default: true,
      desc: 'Skip Test::Unit files'

    class_option :heroku,
      type: :boolean,
      aliases: '-H',
      default: false,
      desc: 'Create staging and production heroku apps'

    class_option :omniauth,
      type: :boolean,
      aliases: '-o',
      default: true,
      desc: 'Add the OmniAuth Rails authentication library'

    def initialize(*args)
      raise Rails::Generators::Error, 'Options should be given after the application name. For details run: hightail --help' if args[0].blank?
      super
    end

    def finish_template
      invoke :hightail_customization
      super
    end

    def hightail_customization
      build :remove_public_index
      build :remove_rails_logo
    end

    protected

    def self.banner
      "hightail #{self.arguments.map(&:usage).join(' ')} [options]"
    end

    def comment_if(value)
      super.strip
    end

    def get_builder_class
      AppBuilder
    end
  end
end
