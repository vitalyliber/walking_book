import React, {Component} from 'react'
import { Form, Input, Button } from 'element-react';

export default class SignInForm extends Component {

  constructor(props) {
    super(props);

    this.state = {
      form: {
        email: '',
        password: '',
      },
      rules: {
        password: [
          { required: true, message: 'Please input the password', trigger: 'blur' },
        ],

        email: [
          { required: true, message: 'Please input email address', trigger: 'blur' },
          { type: 'email', message: 'Please input correct email address', trigger: 'blur,change' }
        ]
      }
    };
  }

  handleSubmit(e) {
    e.preventDefault();

    this.refs.form.validate((valid) => {
      if (valid) {
        alert('submit!');
      } else {
        console.log('error submit!!');
        return false;
      }
    });
  }

  handleReset(e) {
    e.preventDefault();

    this.refs.form.resetFields();
  }

  onChange(key, value) {
    this.setState({
      form: Object.assign({}, this.state.form, { [key]: value })
    });
  }

  render() {
    return (
      <Form ref="form" model={this.state.form} rules={this.state.rules} labelWidth="100" className="demo-ruleForm">
        <Form.Item prop="email" label="Email">
          <Input value={this.state.form.email} onChange={this.onChange.bind(this, 'email')}></Input>
        </Form.Item>
        <Form.Item label="Password" prop="password">
          <Input type="password" value={this.state.form.password} onChange={this.onChange.bind(this, 'password')} autoComplete="off" />
        </Form.Item>
        <Form.Item>
          <Button className="primary-btn" onClick={this.handleSubmit.bind(this)}>Войти</Button>
          <Button onClick={this.handleReset.bind(this)}>Cancel</Button>
        </Form.Item>
      </Form>
    )
  }
}