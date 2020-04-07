module Types
  class QueryType < Types::BaseObject
    field :users, [Entities::UserType], null: false, description: "An example field added by the generator"

    def users
      UserServices::Stub
    end
  end
end
