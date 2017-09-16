# mutation createFeedback{
#   createFeedback(input: { text: "Hello", user_id: 1, book_id: 2 })
#   {
#     feedback{
#       id
#       text
#       user{
#         id
#         first_name
#       }
#       book{
#         id
#         title
#       }
#     }
#     errors
#   }
# }

Mutations::CreateFeedback = GraphQL::Relay::Mutation.define do
  name "CreateFeedback"

  return_field :feedback, Types::FeedbackType
  return_field :errors, types.String

  input_field :book_id, !types.Int
  input_field :user_id, !types.Int
  input_field :text, !types.String

  resolve ->(obj, args, ctx) {
    feedback = Feedback.new(
        text: args[:text],
        user: ctx[:current_user],
        book_id: args[:book_id],
    )
    if feedback.save
      { feedback: feedback }
    else
      { errors: feedback.errors.to_a }
    end
  }
end
