import React from 'react';
import EmailField from './EmailField';
import NameField from './NameField';

class Capture extends React.Component {

    submitted(){
        if(this.email.state.value == "") {
            alert(this.name.state.value + "! At least try. You didn't enter anything for your email");
        }
        else if(!this.email.state.valid){
            alert("Come on " + this.name.state.value + ", please provide a correct email");
            this.name.clear();
            this.email.clear();
        }
        else {
            alert("Thank you for your submission " + this.name.state.value);
            this.name.clear();
            this.email.clear();
        }
    }

    render(){
        return (
            <div className="Capture col-xs-6 col-xs-offset-3">
                <h1>Please enter your name and email</h1>
                <form>
                    <div className="form-group">
                        <NameField className="form-control" ref={(Name) => {this.name = Name;}} />
                    </div>
                    <div className="form-group">
                        <EmailField className="form-control" ref={(Email) => {this.email = Email;}} />
                    </div>
                    <button className="btn btn-primary" onClick={this.submitted}>submit</button>
                </form>
            </div> /*className="LeadCapture col-xs-6 col-xs-offset-3"*/
        );
    }

};

export default Capture;