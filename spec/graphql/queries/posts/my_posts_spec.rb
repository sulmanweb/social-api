require 'rails_helper'

module Queries
  module Posts
    RSpec.describe MyPosts, type: :request do
      describe '.resolve' do
        it 'returns current_user\'s posts' do
          session = FactoryBot.create(:session)
          3.times do
            FactoryBot.create(:post, user_id: session.user_id)
          end
          headers = sign_in_test_headers(session)

          post '/graphql', params: {query: query}, headers: headers

          json = JSON.parse(response.body)
          data = json['data']['myPosts']

          expect(data.length).to eql 3
        end
      end

      def query
        '
        query {
          myPosts {
            id
            content
          }
        }
        '
      end
    end
  end
end