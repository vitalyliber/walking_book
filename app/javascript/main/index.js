// Run this example by adding <%= javascript_pack_tag 'main' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React from 'react'
import ReactDOM from 'react-dom'
import {
  ApolloClient,
  ApolloProvider,
  createNetworkInterface,
} from 'react-apollo'
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom'

import bookDetailView from './views/books/bookDetailView'
import bookNewView from './views/books/bookNewView'
import bookListView from './views/books/bookListView'
import bookEditView from './views/books/bookEditView'
import homeView from './views/homeView'
import notFoundView from './views/notFoundView'
import Navbar from './views/common/navbar'
import './styles/app.scss'
import 'element-theme-default'
// import { Layout, Button } from 'element-react' #example

const networkInterface = createNetworkInterface({
  uri: '/graphql',
  opts: {
    credentials: 'same-origin',
    headers: {
      'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content || '',
    }
  },
})

const client = new ApolloClient({
  networkInterface: networkInterface,
})

ReactDOM.render(
  <ApolloProvider client={client}>
    <Router>
      <div>
        <Navbar/>
        <div className="main-container limited">
          <Switch>
            <Route exact path="/" component={homeView}/>
            <Route exact path="/books" component={bookListView}/>
            <Route exact path="/books/edit" component={bookEditView}/>
            <Route exact path="/books/new" component={bookNewView}/>
            <Route exact path="/books/:id" component={bookDetailView}/>
            <Route path="*" component={notFoundView} />
          </Switch>
        </div>
      </div>
    </Router>
  </ApolloProvider>,
  document.body.appendChild(document.createElement('div')),
)