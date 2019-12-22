require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe UpdatePost, type: :request do
      describe '.resolve' do
        it 'updates the post of the user with authorizations' do
          session = FactoryBot.create(:session)
          headers = sign_in_test_headers(session)
          post = FactoryBot.create(:post, user_id: session.user_id)
          post_params = FactoryBot.attributes_for(:post)
          variables = {post: {content: post_params[:content], status: post_params[:status]}, id: post.id}

          post '/graphql', params: {query: query, variables: variables.to_json}, headers: headers

          json = JSON.parse(response.body)
          expect(json['errors']).not_to be_present
          data = json['data']['updatePost']['post']

          expect(data).to include(
                              'id' => be_present,
                              'content' => post_params[:content],
                              'postedBy' => be_present
                          )
          session = FactoryBot.create(:session)
          headers = sign_in_test_headers(session)

          post '/graphql', params: {query: query, variables: variables.to_json}, headers: headers
          json = JSON.parse(response.body)
          expect(json['errors']).to be_present
        end
      end

      def query
        '
          mutation($id: ID!, $post: PostInput!) {
            updatePost(id: $id, input: $post) {
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