import React from 'react';
import { Layout, Card, Collapse, Button } from 'element-react';
import {gql, graphql} from 'react-apollo';
import { Link } from 'react-router-dom';
import map from '../../images/map.png'
import MapComponent from '../../views/mapComponent'

const query = gql`
  query BookDetailView($id: ID!) {
    book(id: $id) {
      id,
      title,
      description
      cover(size: original)
      authorName
      lat
      lng  
      user {
        id
        first_name
        last_name
      }
    }
  }
`

class BookDetailView extends React.Component {

  constructor(props) {
    super(props)
  };

  render() {
    const {data} = this.props
    if (data.loading) {
      return <div>Loading...</div>
    }

    const backgroundStyle = {
      backgroundImage: `url(${data.book.cover})`,
    }

    return (
      <div>
        <Layout.Row>
          <div className="book-cover">
            <div className="book-cover-background" style={backgroundStyle}></div>
            <img src={data.book.cover} className="book-card-cover" />
          </div>
        </Layout.Row>
        <Layout.Row>
          <div>
            <div className="book-author">{data.book.authorName}</div>
            <div className="book-title">{data.book.title}</div>
            <p className="book-description">{data.book.description}</p>
          </div>
          <Button type="success" size="large">Получить</Button>
        </Layout.Row>

        <Layout.Row className="map-container">
          <MapComponent book={data.book}/>

        </Layout.Row>
      </div>
    )
  }
}

const queryOptions = {
  options: props => ({
    variables: {
      id: props.match.params.id,
    },
  }),
}

BookDetailView = graphql(query, queryOptions)(BookDetailView)
export default BookDetailView