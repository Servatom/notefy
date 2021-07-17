import React, {Component} from 'react';
import classes from '../assets/css/Auth.module.css'; 
import Button from '../components/Button';
import Input from '../components/Input';

import axios from 'axios';


class Auth extends Component {
    state = {
        formControls: {
            touched: false,
            valid: false
        },

        inputValues: {
            name: '',
            email: '', 
            password: ''
        }
    }


    inputChangeHandler = (event, type) => {
        let formControls = {...this.state.formControls};
        formControls.touched = true; 
        let isValid = this.checkValidation(event.target.value, type); 
        formControls.valid = isValid; 
        this.setState({formControls}); 
        
        let inputChange = {...this.state.inputValues}; 
        inputChange[type] = event.target.value; 
        this.setState({inputValues: inputChange}); 
    }



    checkValidation = (value, type) => {
        let isValid = false; 
        if (type === 'name'){
            const regExPattern = /^(?=[a-zA-Z0-9._]{8,20}$)(?!.*[_.]{2})[^_.].*[^_.]$/; 
            isValid = regExPattern.test(value); 
        } else {
            if (type === 'email') {
                const regExPattern = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/; 
                isValid = regExPattern.test(value); 
            }
            else {
                if (type === 'password') {
                    const regExPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/; 
                    isValid = regExPattern.test(value); 
                }
            }
        }
        return isValid; 
    }

    onSubmitHandler = (event) => { 
        event.preventDefault(); 
        const authCreds = {
            email: this.state.inputValues.email,
            password: this.state.inputValues.password
        }
        axios.post('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBdIyvDyssnpsBXxoxF7184XtnLt0lFVXU', authCreds); //Enter your API key. This is bonus content for sending a request to Firebase and storing your input values. 
    } 
    render() {
        return(
            <React.Fragment> 

                <div className={classes.AuthFormContainer}>
                    <h3>
                        Sign Up! 
                    </h3>
                    <form onSubmit={this.onSubmitHandler} className={classes.AuthForm}>
                        <Input 
                        type="name"
                        placeholder="eg: Elon Musk"
                        label=""
                        changed ={ (event) => this.inputChangeHandler(event, 'name')} 
                        touched = {this.state.formControls.touched}
                        invalid = {!this.state.formControls.valid}/>
                        <Input 
                        type="email" 
                        placeholder="eg: elonMusk@mars.com" 
                        label=""
                        changed ={ (event) => this.inputChangeHandler(event, 'email')} 
                        touched = {this.state.formControls.touched}
                        invalid = {!this.state.formControls.valid}/>

                        <Input 
                        type="password" 
                        placeholder="eg: X Æ A-12" 
                        label=""
                        changed ={ (event) => this.inputChangeHandler(event, 'password')} 
                        touched = {this.state.formControls.touched}
                        invalid = {!this.state.formControls.valid}/>
                        
                        <div className={classes.ButtonWrapper}>
                            <Button btnType="Active">Sign Up</Button>
                        </div>
                        {/* <div className={classes.SocialSignin}>
                            <button className={classes.google} onClick={ this.props.onClick }>
                                <i className="fa fa-google" aria-hidden="true"></i>
                            </button>
                        </div> */}
                        {/* <p className={classes.para}>Already a member?</p> */}
                        <a href="/" className={classes.Link}>Login here →</a>
                    </form>                    
                </div>
                
            </React.Fragment>
        );
    }
}

export default Auth; 