require 'rails_helper'

module Queries
  module Users
    RSpec.describe Me, type: :request do
      describe '.resolve' do
        it 'returns current_user' do
          session = FactoryBot.create(:session)
          headers = sign_in_test_headers(session)

          post '/graphql', params: {query: query}, headers: headers

          json = JSON.parse(response.body)
          data = json['data']['me']

          expect(data).to include(
                              'id' => be_present,
                              'email' => session.user.email,
                              'firstName' => session.user.first_name,
                              'lastName' => session.user.last_name,
                          )
        end
      end

      def query
        '
        query {
          me {
            id
            email
            firstName
            lastName
          }
        }
        '
      end
    end
  end
end