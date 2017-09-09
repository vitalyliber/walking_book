import React, {Component} from 'react'
import {gql, graphql} from 'react-apollo'

const MoreBooksQuery = gql`
  query more_books($cursor: Int!) {
    more_books(cursor: $cursor, first: 3){
      cursor
      books{
        id
        title
        description
      }
    }
  }
`

const query = gql`
  query{
    cursor(type: "books", first: 3)
    books(cursor: 0, first: 3){
      id
      title
      description
    }
  }
`

class bookListView extends Component {

  render() {
    const {data} = this.props
    console.log('data', this.props)
    if (data.loading) {
      return <div>Loading...</div>
    }
    return (
      <div>
        bookListView
        {data.books.map((item, index) =>(
          <p key={item.id}>{item.title} - {item.id}</p>
          )
        )}
        { data.cursor != 0 ? (
            <button onClick={data.loadMoreEntries}>loadMoreEntries</button>
          ) : (
            <p>that's all!</p>
          )
        }
      </div>
    )
  }
}

const bookListView1 = graphql(query, {
  // This function re-runs every time `data` changes, including after `updateQuery`,
  // meaning our loadMoreEntries function will always have the right cursor
  props({ data: { loading, cursor, books, fetchMore } }) {
    return {
      data: {
        cursor,
        loading,
        books,
        loadMoreEntries: () => {
          console.log(books)
          return fetchMore({
            query: MoreBooksQuery,
            variables: {
              cursor: cursor,
            },
            updateQuery: (previousResult, { fetchMoreResult }) => {
              const newBooks = fetchMoreResult.more_books.books;
              const newCursor = fetchMoreResult.more_books.cursor || 0;
              return {
                // By returning `cursor` here, we update the `loadMore` function
                // to the new cursor.
                cursor: newCursor,
                // Put the new books in the end of the list
                books: [...previousResult.books, ...newBooks],
              };
            },
          });
        },
      },
    }
  },
})(bookListView)

export default bookListView1