require 'rails_helper'

module Queries
  module Posts
    RSpec.describe ShowPost, type: :request do
      describe '.resolve' do
        it 'returns post if authorized' do
          session = FactoryBot.create(:session)
          post = FactoryBot.create(:post, user_id: session.user_id)
          headers = sign_in_test_headers(session)

          post '/graphql', params: {query: query, variables: {id: post.id}}, headers: headers

          json = JSON.parse(response.body)
          data = json['data']['showPost']

          expect(data).to include(
                              'id' => be_present,
                              'content' => be_present
                          )
        end
      end

      def query
        '
        query($id: ID!) {
          showPost(id: $id) {
            id
            content
          }
        }
        '
      end
    end
  end
end