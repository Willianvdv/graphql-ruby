# frozen_string_literal: true
require "spec_helper"
require "generators/graphql/mutation_generator"
require "generators/graphql/install_generator"

class GraphQLGeneratorsMutationGeneratorTest < BaseGeneratorTest
  tests Graphql::Generators::MutationGenerator
  destination File.expand_path("../../../tmp/dummy", File.dirname(__FILE__))

  setup do
    prepare_destination
    FileUtils.cd(File.join(destination_root, '..')) do
      `rm -rf dummy`
      `rails new dummy --skip-active-record --skip-test-unit --skip-spring --skip-bundle`
    end

    FileUtils.cd(destination_root) do
      Rails::Generators.invoke("graphql:install")
    end
  end

  test "it generates an empty resolver by name" do
    run_generator(["UpdateName"])

    expected_content = <<-RUBY
Mutations::UpdateName = GraphQL::Relay::Mutation.define do
  name "UpdateName"
  # TODO: define return fields
  # return_field :post, Types::PostType

  # TODO: define arguments
  # input_field :name, !types.String

  resolve ->(obj, args, ctx) {
    # TODO: define resolve function
  }
end
RUBY

    assert_file "app/graphql/mutations/update_name.rb", expected_content
  end
end
