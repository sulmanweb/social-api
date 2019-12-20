require 'rails_helper'

module Mutations
  module Auth
    RSpec.describe SignOut, type: :request do
      describe '.resolve' do
        it 'signs out current_user' do
          session = FactoryBot.create(:session)
          headers = sign_in_test_headers session
          post '/graphql', params: {query: query}, headers: headers

          json = JSON.parse(response.body)
          expect(json['data']['signOut']['success']).to be_truthy
          session.reload
          expect(session.status).to be_falsey
        end
      end

      def query
        '
          mutation {
            signOut {
              success
            }
          }
        '
      end
    end
  end
end