import React from 'react';
import classes from './Input.module.css'
import SVGIcon from '../Icon/Icon'; 

const Input = (props) => {
    const inputClasses = [classes.Input];
    if(props.touched && props.invalid){
        inputClasses.push(classes.InputError);
    }

    return (
    <div className={classes.InputWrapper}>
        <span className={classes.Label}>{props.label}</span>
        <div className={classes.InputGroup}>
            <span><SVGIcon 
            name = {props.type}/>
            </span>
            <input className={inputClasses.join(' ')}
                type={props.type} 
                placeholder={props.placeholder}
                onChange={props.changed}>      
            </input>
        </div>    
    </div>
    );
};

export default Input;