require 'rails_helper'

module Mutations
  module Auth
    RSpec.describe SignIn, type: :request do
      describe '.resolve' do
        it 'returns current_user' do
          user = FactoryBot.create(:user)
          variables = {auth: user.username, password: user.password}
          post '/graphql', params: {query: query, variables: variables}

          json = JSON.parse(response.body)
          expect(json['data']['signIn']['token']).to be_present
          data = json['data']['signIn']['user']

          expect(data).to include(
                              'id' => be_present,
                              'email' => be_present
                          )
        end
      end

      def query
        '
          mutation($auth: String!, $password: String!) {
            signIn(input: {
              auth: $auth,
              password: $password
            }) {
              token,
              user {
                id,
                email
              }
            }
          }
        '
      end
    end
  end
end