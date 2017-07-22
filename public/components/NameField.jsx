import React from 'react';

class NameField extends React.Component{

    constructor (props){
      super (props);
      this.state = {
        name : ''
      }
      this.onChange = this.onChange.bind(this);
    }

    onChange(e){
      this.setState({name : e.target.value});
    }

    render(){
        return (
            <div className="NameField">
                <input type="text" value={this.state.value} onChange={this.onChange} placeholder=" Enter Name"></input>
            </div>
        );
    }
}

export default NameField;