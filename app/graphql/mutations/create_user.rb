module Mutations
  class CreateUser < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true

    def resolve(params)
      user = User.create(name: params[:name])
      {
        "user": user
      }
    end
  end
end
