require File.expand_path('../boot', __FILE__)

<% if include_all_railties? -%>
require 'rails/all'
<% else -%>
<%= comment_if :skip_active_record %>require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
<%= comment_if :skip_sprockets %>require 'sprockets/railtie'
<% unless options[:skip_test_unit] %>require 'rails/test_unit/railtie'
<% end -%>
<% end -%>

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module <%= app_const_base %>
  class Application < Rails::Application
    # Defaults
    config.encoding = 'utf-8'
    config.filter_parameters += [:password]

    # Load Paths
    config.autoload_paths << config.root.join('lib')
    #config.active_record.observers = :cacher
<% unless options.skip_sprockets? -%>

    # Assets
    config.assets.enabled = true
    config.assets.version = '1.0'
<% end -%>

    # Generators
    config.generators do |generators|
      generators.orm :active_record, parent: 'ApplicationModel'
      generators.test_framework :rspec, view_specs: false
      generators.template_engine :haml
    end

    # Sass
    config.sass.preferred_syntax = :sass
  end
end
