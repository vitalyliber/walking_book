module Types
  CoverEnum = GraphQL::EnumType.define do
    name 'Cover'
    description 'a description'

    value('thumb', 'thumb size of cover')
    value('original', 'original size of cover')
  end
end