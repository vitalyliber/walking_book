import React, {Component} from 'react'
import { Menu } from 'element-react';
import { Layout } from 'element-react';

export default class Navbar extends Component {

  render() {
    return (
        <div>
          <Layout.Row>
            <Layout.Col span="24">
              <Menu theme="dark" defaultActive="2" className="el-menu-demo" mode="horizontal" >
                <Menu.Item index="1">Logo</Menu.Item>
                <Menu.Item index="3">Регистрация</Menu.Item>
              </Menu>
            </Layout.Col>
          </Layout.Row>
        </div>
    )
  }
}