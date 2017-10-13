import React, {Component} from 'react'
import {Map, Marker} from 'google-maps-react'

export default class MapComponent extends Component {

  constructor(props) {
    super(props)
  }

  render() {
    const style = {
      width: '100%',
      height: '400px'
    }

    return (
      <div>
        <Map google={window.google}
             style={style}
             zoom={15}
             initialCenter={{
               lat: this.props.book.lat,
               lng: this.props.book.lng
             }}
        >
          <Marker key={this.props.book.id}
                  name={this.props.book.name}
                  position={{lat: this.props.book.lat, lng: this.props.book.lng}}
                  optimized={false}
          />
        </Map>
      </div>
    )
  }
}