import React, {Component} from 'react'
import { Form, Input, Button } from 'element-react';

export default class SignUpForm extends Component {

  constructor(props) {
    super(props);

    this.state = {
      form: {
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        checkPassword: ''
      },
      rules: {
        password: [
          { required: true, message: 'Please input the password', trigger: 'blur' },
          { validator: (rule, value, callback) => {
            if (value === '') {
              callback(new Error('Please input the password'));
            } else {
              if (this.state.form.checkPassword !== '') {
                this.refs.form.validateField('checkPassword');
              }
              callback();
            }
          } }
        ],
        checkPassword: [
          { required: true, message: 'Please input the password again', trigger: 'blur' },
          { validator: (rule, value, callback) => {
            if (value === '') {
              callback(new Error('Please input the password again'));
            } else if (value !== this.state.form.password) {
              callback(new Error('Two inputs don\'t match!'));
            } else {
              callback();
            }
          } }
        ],

        email: [
          { required: true, message: 'Please input email address', trigger: 'blur' },
          { type: 'email', message: 'Please input correct email address', trigger: 'blur,change' }
        ],

        firstName: [
          { required: true, message: 'Please input your first name', trigger: 'blur' }
        ],

        lastName: [
          { required: true, message: 'Please input your last name', trigger: 'blur' }
        ],
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
        <Form.Item label="First name" prop="firstName">
          <Input value={this.state.form.firstName} onChange={this.onChange.bind(this, 'firstName')}></Input>
        </Form.Item>
        <Form.Item label="Last name" prop="lastName">
          <Input value={this.state.form.lastName} onChange={this.onChange.bind(this, 'lastName')}></Input>
        </Form.Item>
        <Form.Item prop="email" label="Email">
          <Input value={this.state.form.email} onChange={this.onChange.bind(this, 'email')}></Input>
        </Form.Item>
        <Form.Item label="Password" prop="password">
          <Input type="password" value={this.state.form.password} onChange={this.onChange.bind(this, 'password')} autoComplete="off" />
        </Form.Item>
        <Form.Item label="Confirm password" prop="checkPassword">
          <Input type="password" value={this.state.form.checkPassword} onChange={this.onChange.bind(this, 'checkPassword')} autoComplete="off" />
        </Form.Item>
        <Form.Item>
          <Button className="primary-btn" onClick={this.handleSubmit.bind(this)}>Зарегистрироваться</Button>
          <Button onClick={this.handleReset.bind(this)}>Cancel</Button>
        </Form.Item>
      </Form>
    )
  }
}