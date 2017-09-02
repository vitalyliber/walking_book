Struct.new("Book", :title, :description, :id, :author_id)

Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :books, types[Types::BookType] do
    description "Book field"
    resolve ->(obj, args, ctx) {
      [
        Struct::Book.new(
          'Harry Potter and prisoner of Askaban',
          'Once was a boy named Harry',
          1,
          2
        )
      ]
    }
  end
end
