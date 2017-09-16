module Types
  CategoryEnum = GraphQL::EnumType.define do
    name 'Category'
    description 'a description'

    value('fiction', 'category of book')
    value('education', 'category of book')
    value('children', 'category of book')
    value('other', 'category of book')
  end
end