module Hightail
  class AppBuilder < Rails::AppBuilder
    def doc
      template 'doc/README_FOR_APP'
    end

    def readme
      template 'README.md'
    end

    def remove_public_index
      remove_file 'public/index.html'
    end

    def remove_rails_logo
      remove_file 'app/assets/images/rails.png'
    end
  end
end
