module Types
  class MutationType < Types::BaseObject
    # auth
    field :sign_up, mutation: Mutations::Auth::SignUp
    field :sign_in, mutation: Mutations::Auth::SignIn
    field :sign_out, mutation: Mutations::Auth::SignOut

    # posts
    field :create_post, mutation: Mutations::Posts::CreatePost
    field :update_post, mutation: Mutations::Posts::UpdatePost

    # users
    field :follow_user, mutation: Mutations::Users::FollowUser
    field :un_follow_user, mutation: Mutations::Users::UnFollowUser
  end
end
