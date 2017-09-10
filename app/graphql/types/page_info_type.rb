module Types
  PageInfoType = GraphQL::ObjectType.define do
    name 'pageInfo'
    description 'a description'

    field :endCursor, !types.Int, property: :end_cursor
    field :hasNextPage, !types.Boolean, property: :has_next_page
  end
end