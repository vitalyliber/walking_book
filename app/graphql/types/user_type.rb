module Types
  UserType = GraphQL::ObjectType.define do
    name 'User'
    description 'a description'

    field :first_name, !types.String
    field :last_name, !types.String
    field :email, !types.String
    field :id, !types.Int
    field :books do
      type !types[Types::BookType]
      resolve -> (obj, args, ctx) {
        last_updated_book = obj.books.order(updated_at: :asc).last.id
        Rails.cache.fetch("#{last_updated_book}/user_books", expires_in: 1.month) do
          obj.books.order(updated_at: :desc)
        end
      }
    end
    field :histories do
      type !types[Types::HistoryType]
      resolve -> (obj, args, ctx) {
        last_history = obj.histories.last.id
        Rails.cache.fetch("#{last_history}/user_histories", expires_in: 1.month) do
          obj.histories.order(id: :desc)
        end
      }
    end
  end
end