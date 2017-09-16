module Types
  FeedbackType = GraphQL::ObjectType.define do
    name 'Feedback'
    description 'a description'

    field :id, !types.Int
    field :user, !UserType
    field :book, !BookType
    field :text, !types.String
  end
end