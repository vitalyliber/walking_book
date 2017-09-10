Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :booksConnection, Types::BooksConnectionType do
    description "Book field"
    argument :after, types.Int
    argument :first, types.Int
    resolve ->(obj, args, ctx) {

      books = resolve_books_connection(args)

      has_next_page = false
      if args[:first].present?
        end_cursor = books&.last&.id || 0
        has_next_page = resolve_books_connection(args.to_h.merge(after: end_cursor, first: 1)).present?
      end
      if end_cursor.blank?
        end_cursor = books&.last&.id || 0
      end

      OpenStruct.new({
                           books: books,
                           total_count: Book.count,
                           page_info: OpenStruct.new({
                               end_cursor: end_cursor,
                               has_next_page: has_next_page
                           })
                       })
    }
  end

  field :books, types[Types::BookType] do
    description "Book field"
    argument :cursor, !types.Int
    argument :first, !types.Int
    resolve ->(obj, args, ctx) {
      resolve_books(args)
    }
  end

  field :cursor do
    type types.Int
    description "Book field"
    argument :type, !types.String
    argument :first, !types.Int
    resolve ->(obj, args, ctx) {
      if args[:type].eql? 'books'
        resolve_books(args)&.last&.id || 0
      end
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

def resolve_books_connection args
  books = Book.includes(:user, :author)
  if args[:after].present?
    books = books.where('id < ?', args[:after])
  end

  books = books.order(id: :desc)

  if args[:first].present?
    books = books.first(args[:first])
  end

  books
end

def resolve_books args
  Book.includes(:user, :author).order(id: :desc).first(args[:first])
end