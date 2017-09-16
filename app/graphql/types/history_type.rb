module Types
  HistoryType = GraphQL::ObjectType.define do
    name 'History'
    description 'a description'

    field :id, !types.Int
    field :user, !UserType
    field :book, !BookType
    field :createdAt do
      type types.String
      property :created_at
      resolve -> (obj, args, ctx) {
        obj.created_at.iso8601
      }
    end
    field :updatedAt do
      type types.String
      property :updated_at
      resolve -> (obj, args, ctx) {
        obj.updated_at.iso8601
      }
    end
  end
end