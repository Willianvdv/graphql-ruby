# frozen_string_literal: true
require "spec_helper"

describe 'graphql'  do
  it "back to graphql" do
    query_string = %{
      {
        cheese(id: 1) {
          id
        }
        gouda: cheese(id: 2) {
          ... {
            id
          }
        }
      }
    }.strip

    simplified_query_string = \
      'query { cheese(id: 1) { id } gouda: cheese(id: 2) { id }}'

    execution = Dummy::Schema.execute(query_string)
    assert_equal execution.to_graphql, simplified_query_string
  end

  # MUTATION
  # ALIASED ROOT
  # VARIABLE

  # ALIASED ROOT
  # NESTED ARGUMENTS?
end
