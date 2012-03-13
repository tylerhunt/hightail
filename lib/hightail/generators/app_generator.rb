require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Hightail
  class Generator < Rails::Generators::AppGenerator
    class_option :database,
      type: :string,
      aliases: '-d',
      default: 'postgresql',
      desc: "Preconfigure for selected database (options: #{DATABASES.join('/')})"

    class_option :skip_bundle,
      :type => :boolean,
      :default => true,
      :desc => "Don't run bundle install"

    class_option :skip_test_unit,
      type: :boolean,
      aliases: '-T',
      default: true,
      desc: 'Skip Test::Unit files'

    class_option :skip_rspec,
      type: :boolean,
      default: false,
      desc: 'Skip RSpec files'

    class_option :skip_rvm,
      type: :boolean,
      default: false,
      desc: 'Skip RVM files'

    def initialize(*args)
      raise Rails::Generators::Error, 'Options should be given after the application name. For details run: hightail --help' if args[0].blank?
      super
    end

    def finish_template
      invoke :hightail_customization
      super
    end

    def hightail_customization
      build :bundler
      build :rspec unless options[:skip_rspec]
      build :rvm unless options[:skip_rvm]
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

    def rails_gemfile_entry
      if options.dev?
        <<-GEMFILE.strip_heredoc
          gem 'rails', :path => '#{Rails::Generators::RAILS_DEV_PATH}'
        GEMFILE
      elsif options.edge?
        <<-GEMFILE.strip_heredoc
          gem 'rails', :git => 'git://github.com/rails/rails.git'
        GEMFILE
      else
        <<-GEMFILE.strip_heredoc
          gem 'rails'
        GEMFILE
      end
    end

    def rspec_gemfile_entry
      unless options[:skip_rspec]
        <<-GEMFILE.strip_heredoc
          group :test, :development do
            gem 'rspec-rails'
          end

          group :test do
            gem 'remockable'
          end
        GEMFILE
      end
    end

    def get_builder_class
      AppBuilder
    end
  end
end
