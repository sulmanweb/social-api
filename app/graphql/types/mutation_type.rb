module Types
  class MutationType < Types::BaseObject
    field :sign_up, mutation: Mutations::Auth::SignUp
    field :sign_in, mutation: Mutations::Auth::SignIn
    field :sign_out, mutation: Mutations::Auth::SignOut
  end
end
