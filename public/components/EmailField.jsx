import React from 'react';
import validator from 'email-validator';

class EmailField extends React.Component{

    constructor (props){
        super (props);
        this.state = {
            email : ''
        };
        this.onChange = this.onChange.bind(this);
    }

    onChange(){
        var val = validator.validate(this.refs.newEmail.value);
        if(this.refs.newEmail.value == ""){
            this.setState({
                valid : false,
                value : this.refs.newEmail.value
            });
        }
        else if(val){
            this.setState({
                valid : true,
                value : this.refs.newEmail.value
            });
        }else{
            this.setState({
                valid : false,
                value : this.refs.newEmail.value
            });
        }
    }

    render(){
        return (
            <div className="ProgramForm" >
                <input ref="newEmail" type="text" className={this.state.valid} value={this.state.value} onChange={this.onChange} placeholder=" Enter Email"></input>
            </div>
        );
    }
}

export default EmailField;