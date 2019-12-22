require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates the post for the logged in user' do
          session = FactoryBot.create(:session)
          headers = sign_in_test_headers(session)
          post_params = FactoryBot.attributes_for(:post)
          variables = {post: {content: post_params[:content], status: post_params[:status]}}

          post '/graphql', params: {query: query, variables: variables.to_json}, headers: headers

          json = JSON.parse(response.body)
          data = json['data']['createPost']['post']

          expect(data).to include(
                              'id' => be_present,
                              'content' => post_params[:content],
                              'postedBy' => be_present
                          )
        end
      end

      def query
        '
          mutation($post: PostInput!) {
            createPost(input: $post) {
              post {
                id,
                content,
                postedBy {
                  id,
                  email
                }
              }
            }
          }
        '
      end
    end
  end
end