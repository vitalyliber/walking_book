import React, {Component} from 'react'
import {gql, graphql} from 'react-apollo'
const per_page = 10

const MoreBooksQuery = gql`
  query books_connection($cursor: Int!) {
    booksConnection(after: $cursor, first: ${per_page}){
      totalCount
      books{
        id
        title
        description
      }
      pageInfo{
        endCursor
        hasNextPage
      }
    }
  }
`

const query = gql`
  query{
    booksConnection(first: ${per_page}){
      totalCount
      books{
        id
        title
        description
      }
      pageInfo{
        endCursor
        hasNextPage
      }
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
        {data.booksConnection.books.map((item, index) =>(
          <p key={item.id}>{item.title} - {item.id}</p>
          )
        )}
        { data.booksConnection.pageInfo.hasNextPage ? (
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
  props({ data: { loading, booksConnection, fetchMore, pageInfo } }) {
    return {
      data: {
        loading,
        booksConnection,
        pageInfo,
        loadMoreEntries: () => {
          // console.log(books)
          return fetchMore({
            query: MoreBooksQuery,
            variables: {
              cursor: booksConnection.pageInfo.endCursor,
            },
            updateQuery: (previousResult, { fetchMoreResult }) => {
              const newBooks = fetchMoreResult.booksConnection.books;
              const newCursor = fetchMoreResult.booksConnection.pageInfo.endCursor;
              const totalCount = fetchMoreResult.booksConnection.totalCount;
              const pageInfo = fetchMoreResult.booksConnection.pageInfo;
              return {
                // By returning `cursor` here, we update the `loadMore` function
                // to the new cursor.
                cursor: newCursor,
                // Put the new books in the end of the list
                booksConnection: {
                  __typename: previousResult.booksConnection.__typename,
                  books: [...previousResult.booksConnection.books, ...newBooks],
                  totalCount: totalCount,
                  pageInfo: pageInfo
                },
              };
            },
          });
        },
      },
    }
  },
})(bookListView)

export default bookListView1