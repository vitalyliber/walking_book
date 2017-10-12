import React, {Component} from 'react'
import { Dialog } from 'element-react';
import SignUpForm from "./sign-up-form";
import SignInForm from "./sign-in-form";

export default class ModalDialog extends Component {

  constructor(props) {
    super(props)

    this.state = {
      modalTitle: ''
    };
  }

  render() {
    return (
      <div>
        <Dialog
          className='modal-dialog'
          title={this.props.type === 'signup' ? 'Регистрация' : 'Вход'}
          size="small"
          visible={this.props.dialogVisible}
          onCancel={this.props.closeDialog}
          lockScroll={false}
        >
          <Dialog.Body>
            {this.props.type === 'signup'  ? (<SignUpForm/>) : (<SignInForm/>)}
          </Dialog.Body>
          <Dialog.Footer className="dialog-footer">
            {this.props.type === 'signup' ? (
              <div>
                <span>Уже зарегистрированы?&nbsp;</span>
                <span onClick={() => this.props.switchType('signin')} className='clickable'>Войти</span>
              </div>
            ) : (
              <div>
                <span>He зарегистрированы?&nbsp;</span>
                <span onClick={() => this.props.switchType('signup')} className='clickable'>Регистрация</span>
              </div>
            )}
          </Dialog.Footer>
        </Dialog>
      </div>
    )
  }
}