require 'rails_helper'

module Mutations
  module Auth
    RSpec.describe SignUp, type: :request do
      describe '.resolve' do
        it 'returns current_user' do
          body = FactoryBot.attributes_for(:user)
          variables = {email: body[:email], username: body[:username], password: body[:password]}
          post '/graphql', params: {query: query, variables: variables}

          json = JSON.parse(response.body)
          expect(json['data']['signUp']['token']).to be_present
          data = json['data']['signUp']['user']

          expect(data).to include(
                              'id' => be_present,
                              'email' => be_present
                          )
        end
      end

      def query
        '
          mutation($email: String!, $username: String!, $password: String!) {
            signUp(input: {
              email: $email,
              username: $username,
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