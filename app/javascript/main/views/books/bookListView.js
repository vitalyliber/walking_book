import React, {Component} from 'react';
import {gql, graphql} from 'react-apollo';
import { Layout, Card } from 'element-react';
import PlacesAutocomplete, { geocodeByAddress, getLatLng } from 'react-places-autocomplete'

import '../../styles/pages/book-list.sass';

const per_page = 9

const MoreBooksQuery = gql`
  query books_connection($cursor: Int!) {
    booksConnection(after: $cursor, first: ${per_page}){
      totalCount
      books{
        id
        title
        description
        cover
        authorName
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
        cover
        authorName
      }
      pageInfo{
        endCursor
        hasNextPage
      }
    }
  }
`

class bookListView extends Component {

  constructor(props) {
    super(props)

    this.state = {
      locationReceived: false,
      latitude: null,
      longitude: null
    }
  }


  getLocation = () => {
    if (!navigator.geolocation){
      return;
    }

    let success = (position) => {
      this.setState({
        locationReceived: true,
        latitude: position.coords.latitude,
        longitude: position.coords.longitude
      })
    };

    let error = () => {
      console.log('bad')
    };

    navigator.geolocation.getCurrentPosition(success, error);
  };

  componentDidMount() {
    this.getLocation()
  }

  render() {
    const {data} = this.props
    if (data.loading) {
      return <div>Loading...</div>
    }
    return (
      <div>
        bookListView
        <Layout.Row gutter="30">
          {data.booksConnection.books.map((item, index) =>(
            <Layout.Col xs="24" sm="24" md="8" lg="8" key={item.id}>
              <Card className="book-card">
                <div className="book-title">
                  <div>{item.title}</div>
                  <div>{item.authorName}</div>
                </div>
                <div className="book-cover-wrapper">
                  <img src={item.cover} className="book-card-cover" />
                </div>
              </Card>
            </Layout.Col>
            )
          )}
        </Layout.Row>

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