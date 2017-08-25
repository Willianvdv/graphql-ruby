require 'graphql'

module GraphQL
  class Railtie < Rails::Railtie
    railtie_name :graphql

    rake_tasks do
      load File.join(File.dirname(__FILE__), 'rake_task.rb')
      GraphQL::RakeTask.new(dependencies: [:environment])
    end
  end
end
