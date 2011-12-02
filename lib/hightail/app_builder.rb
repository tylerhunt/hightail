module Hightail
  class AppBuilder < Rails::AppBuilder
    def database_yml
      template "config/databases/#{options[:database]}.yml", 'config/database.yml.example'
    end

    def readme
      template 'README.md'
    end

    def rspec
      copy_file 'rspec', '.rspec'
      template 'spec/spec_helper.rb'
      empty_directory_with_gitkeep 'spec/support'
    end

    def rvm
      template 'rvmrc', '.rvmrc'
    end

    def generators
      directory 'lib/generators'
    end

    def lib_app_name
      directory 'lib/app_name', "lib/#{app_name}"
    end

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo
      remove_file 'app/assets/images/rails.png'
    end
  end
end
