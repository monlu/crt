require "crt/version"

require 'rails/generators'
require 'rails/generators/rails/app/app_generator'

module Crt
  class CrtGenerator < Rails::Generators::AppGenerator

  	class_option :database, type: :string, aliases: "-d", default: "mysql",
      desc: "Configure for selected database (options: #{DATABASES.join("/")})"

  	def finish_template
      invoke :import_template
      invoke :setup_database
      super
    end

    def import_template
    	remove_file 'Gemfile'
      template 'Gemfile.erb', 'Gemfile'
    end

    def customize_gemfile
      build :replace_gemfile
    end

    def setup_database

      if 'mysql' == options[:database]
        build :use_mysql2_template
      end

    end

    protected

    def get_builder_class
      Crt::CrtBuilder
    end

  end

  class CrtBuilder < Rails::AppBuilder

  	def replace_gemfile
      remove_file 'Gemfile'
      template 'Gemfile.erb', 'Gemfile'
    end

    def use_mysql2_template
      template 'mysql2_database.yml.erb', 'config/database.yml',
        force: true
    end

  end
end
