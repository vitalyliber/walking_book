import React, {Component} from 'react'
import { Layout, Dialog } from 'element-react';
import { Link } from 'react-router-dom';
import logo from '../../images/logo.svg'
import ModalDialog from './modal-dialog'

export default class Navbar extends Component {

  constructor(props) {
    super(props);

    this.state = {
      dialogVisible: false,
      modalType: null
    };
  }

  openModal = (type) => {
    this.setState({modalType: type})
    this.setState({dialogVisible: true})
  }

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
              <div onClick={() => this.openModal('signin')} className='menu-item clickable'>Вход</div>
              <div onClick={() => this.openModal('signup')} className='menu-item clickable'>Регистрация</div>
            </Layout.Col>
          </Layout.Row>
        </Layout.Row>
        <ModalDialog
          type={this.state.modalType}
          dialogVisible={this.state.dialogVisible}
          closeDialog={() => this.setState({dialogVisible: false})}
          switchType={this.openModal}
        />
      </div>
    )
  }
}
