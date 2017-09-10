# query{
#   books_connection(first: 7, after: 9){
#     books{
#       id
#       title
#     }
#     totalCount
#     pageInfo{
#       endCursor,
#           hasNextPage
#     }
#   }
# }

module Types
  BooksConnectionType = GraphQL::ObjectType.define do
    name 'booksConnection'
    description 'a description'

    field :totalCount, !types.Int, property: :total_count
    field :books, types[Types::BookType]
    field :pageInfo, PageInfoType, property: :page_info
  end
end