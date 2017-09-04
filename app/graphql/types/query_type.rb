PER_PAGE = 20

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :books, types[Types::BookType] do
    description "Book field"
    argument :page, !types.Int
    resolve ->(obj, args, ctx) {
      Book.eager_load(:user, :author).paginate(
          page: args['page'], per_page: PER_PAGE
      ).order(id: :desc)
    }
  end

  field :books_total_pages do
    type types.Int
    description 'Return number of posts'
    resolve -> (object, arguments, context) { Book.paginate(per_page: PER_PAGE, page: 1).total_pages }
  end

  field :book do
    type Types::BookType
    description 'Find a Book by id'
    argument :id, !types.ID
    resolve -> (obj, args, ctx) { Book.find(args['id']) }
  end

  field :authors, types[Types::AuthorType] do
    description "Author field"
    resolve ->(obj, args, ctx) {Author.all.order(id: :desc)}
  end

  field :me, Types::UserType do
    description "the current user"
    resolve ->(obj, args, ctx) {ctx[:current_user]}
  end

  field :my_books, types[Types::BookType] do
    description "Book field"
    resolve ->(obj, args, ctx) {ctx[:current_user]&.books}
  end

end