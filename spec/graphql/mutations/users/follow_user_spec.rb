require 'rails_helper'

module Mutations
  module Users
    RSpec.describe FollowUser, type: :request do
      describe '.resolve' do
        it 'current user will follow the given user' do
          user1 = FactoryBot.create(:user)
          user2 = FactoryBot.create(:user)
          session = FactoryBot.create(:session, user_id: user1.id)
          headers = sign_in_test_headers(session)
          variables = {id: user2.id}

          post '/graphql', params: {query: query, variables: variables.to_json}, headers: headers

          json = JSON.parse(response.body)
          data = json['data']['followUser']['success']

          expect(data).to be_truthy
        end
      end

      def query
        '
          mutation($id: ID!) {
            followUser(id: $id) {
              success
            }
          }
        '
      end
    end
  end
end