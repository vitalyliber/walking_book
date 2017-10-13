import React, {Component} from 'react'
import { Layout } from 'element-react';
import { Link } from 'react-router-dom';
import logo from '../../images/logo.svg'

export default class Navbar extends Component {

  render() {
    return (
        <div>
          <Layout.Row className='navbar-container'>
            <Layout.Row className='nav-inner limited'>
              <Layout.Col span="16">
                <div className='menu-item'>
                  <Link to="/">
                    <img src={logo} width="60" height="60" />
                  </Link>
                </div>
                <div className='menu-item'>
                  <Link to="/books">WALKING BOOK</Link>
                </div>
              </Layout.Col>
              <Layout.Col span="8">
                <div className='menu-item'>РЕГИСТРАЦИЯ</div>
              </Layout.Col>
            </Layout.Row>
          </Layout.Row>
        </div>
    )
  }
}
