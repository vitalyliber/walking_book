import React, {Component} from 'react'
import {gql, graphql} from 'react-apollo'

const query = gql`
  query{
    books{
      id
      title
      description
    }
  }
`

class bookListView extends Component {

  render() {
    const {data} = this.props
    if (data.loading) {
      return <div>Loading...</div>
    }
    return (
      <div>
        bookListView
        {data.books.map((item, index) =>(
          <p key={item.id}>{item.title}</p>
          )
        )}
      </div>
    )
  }
}

bookListView = graphql(query)(bookListView)
export default bookListView