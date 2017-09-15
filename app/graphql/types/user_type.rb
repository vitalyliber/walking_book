module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'a description'

    field :first_name, !types.String
    field :last_name, !types.String
    field :email, !types.String
    field :id, !types.Int
    field :books, !types[Types::BookType]
    field :histories do
      type !types[Types::HistoryType]
      resolve -> (obj, args, ctx) {
        last_history = obj.histories.last.id
        Rails.cache.fetch("#{last_history}/histories", expires_in: 1.month) do
          obj.histories.order(id: :desc)
        end
      }
    end
  end
end