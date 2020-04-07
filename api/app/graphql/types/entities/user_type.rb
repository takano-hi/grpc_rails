module Types
  module Entities
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
    end
  end
end
