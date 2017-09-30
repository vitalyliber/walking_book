module Types
  BookType = GraphQL::ObjectType.define do
    name 'Book'
    description 'a description'

    field :id, !types.Int
    field :title, !types.String
    field :description, !types.String
    field :category, !types.String
    field :status, !types.String
    field :cover do
      type !types.String
      argument :size, Types::CoverEnum
      resolve -> (obj, args, ctx) {
        if args[:size] == 'original'
          obj.image.file.url
        else
          obj.image.file(args[:size])
        end
      }
    end
    field :authorName, !types.String, property: :author_name
    field :user, !UserType
    field :histories, !types[Types::HistoryType]
  end
end