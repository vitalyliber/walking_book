import React, {Component} from 'react'
import Dropzone from 'react-dropzone'
import request from 'superagent'
import { Message } from 'element-react'


export default class bookEditView extends Component {

  constructor(props) {
    super(props)

    this.state = {
      uploadedFileUrl: null,
      imageLoading: false
    }
  }

  onImageDrop = (files) => {
    this.setState({
        uploadedFile: files[0]
    });

    this.handleImageUpload(files[0])
  }

  handleImageUpload = (file) => {
    this.setState({
      imageLoading: true
    })

    let upload = request.post('/image_uploader')
      .set('X-CSRF-Token', document.getElementsByName('csrf-token')[0].content || '')
      .field('file', file);

    upload.end((err, response) => {
      if (err) {
        console.error(err, response.body.errors)
        response.body.errors.forEach( (element) => (
          Message.error(element)
        )
      )
      }

      if (response.body && response.body.image_url !== '') {
        this.setState({
          uploadedFileUrl: response.body.image_url,
          uploadedFileId: response.body.image_id,
        })
      }

      this.setState({
        imageLoading: false
      })
    })
  }

  render() {
    const dropzoneStyle = {
      fontSize: '28px',
      color: '#8c939d',
      width: '178px',
      height: '178px',
      textAlign: 'center',
      lineHeight: '178px',
      border: '1px dashed #d9d9d9'
    }

    const dropzoneImage = {
      width: '178px',
      height: '178px',
      objectFit: 'cover'
    }

    return (
      <div>

        <Dropzone
            style={dropzoneStyle}
            multiple={false}
            accept="image/*"
            onDrop={this.onImageDrop}>
          {(this.state.imageLoading) ? (
            <i className="el-icon-loading"/>
          ) : (
            <div>
              { (this.state.uploadedFileUrl) ? (
                <img style={dropzoneImage} src={this.state.uploadedFileUrl} />
              ) : (
                <i className="el-icon-plus"/>
              )
              }
            </div>
          )
          }

        </Dropzone>

      </div>
    )
  }
}