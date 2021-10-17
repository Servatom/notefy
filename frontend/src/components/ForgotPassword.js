import '../assets/css/ForgotPassword.css';

import React, { useState } from 'react';

import Alert from './Alert';
import URL from '../URL';
import axios from 'axios';
import { Link, useHistory } from 'react-router-dom';

const FORGOT_PW_ENDPOINT = '/api/users/forgot_password/';
const NEW_PW_ENDPOINT = '/api/users/new_password/';
const UNVERIFIED_MSG = 'There was an issue verifying your email.'

const ForgotPassword = () => {
	const history = useHistory();

	// use isEmailVerified to render the appropriate content
	// null return emailForm, true return passwordForm, false return an error message on the page
	const [isEmailVerified, setIsEmailVerified] = useState(null)
	const [loading, setLoading] = useState(false);
	const [errorMsg, setErrorMsg] = useState(false);
	const [successMsg, setSuccessMsg] = useState(false);
	const [emailState, setEmailState] = useState({ email: '' })
	const [passwordState, setPasswordState] = useState({
		password1: '',
		password2: '',
	});
	const { password1, password2 } = passwordState;

	const handleEmailChange = e => {
		const { value } = e.target;
		setEmailState({ email: value})
	}

	const handlePasswordChange = e => {
		const { name, value } = e.target;
		setPasswordState({
			...passwordState,
			[name]: value,
		});
	};

	const submitEmail = email => fetch(`${URL}${FORGOT_PW_ENDPOINT}`, {
		method: 'POST',
		'Content-Type': 'application/json',
		body: JSON.stringify(email),
	})	
	
	const handleEmailSubmit = async e => {
		e.preventDefault()
		try {
			if (!emailState.email) {
				setErrorMsg('Enter a valid email address.');
				return;
			}
			const response = await submitEmail(emailState.email)
			console.log('response:', response)
			if (response.status !== 200) {
				setIsEmailVerified('unverified')
				setErrorMsg(response.statusText)
			}
			setSuccessMsg('Please check your email to reset for a link to reset your password.')
		} catch (err) {
			setIsEmailVerified('unverified')
			setErrorMsg(err.message)
			console.error(err)
		}
		setEmailState({email: ''})
	}

	const sendNewPassword = newPassword =>
		axios.post(URL + NEW_PW_ENDPOINT, newPassword);

	const handleNewPasswordSubmit = async e => {
		e.preventDefault();
		setLoading(true);
		try {
			if (password1 === password2) {
				const response = await sendNewPassword(password2);
				if (response.statusText === 'OK') {
					history.push('/');
				}
			}
			if (password1 !== password2) {
				setErrorMsg('The passwords do not match.');
			}
		} catch (err) {
			setErrorMsg(err.message);
			console.error(err);
		}
		setLoading(false);
		setPasswordState({ password1: '', password2: '' });
	};

	const submitBtn = (
		<button type='submit' disabled={loading}>
			Submit
		</button>
	)

	const emailForm = (
		<> 
			<h1>Enter email</h1>
			<p>Enter your email to reset your password.</p>
			<form onSubmit={handleEmailSubmit}>
				<label htmlFor="email">Your Email:</label>
				<input 
					name='email' 
					value={emailState.email}  
					onChange={handleEmailChange}
				/>
				{submitBtn}
			</form>
		</>
	)

	const passwordForm = (
		<>
			<h1>Reset password</h1>
			<p>Forgot your password? Reset it here.</p>
			<form onSubmit={handleNewPasswordSubmit}>
				<label htmlFor='password1'>New Password:</label>
				<input
					name='password1'
					value={password1}
					onChange={handlePasswordChange}
					required
				/>
				<label htmlFor='password2'>Confirm Password:</label>
				<input
					name='password2'
					value={password2}
					onChange={handlePasswordChange}
					required
				/>
				<p>
					<Link to='/'>
						Remember your password?
					</Link>
				</p>
				{submitBtn}
			</form>
		</>	
	)

	const errorMessage = (
		<>
			<p className='error-message'>{UNVERIFIED_MSG}</p>
			<p >
				<span className='try-again' onClick={() => window.location.reload()}>Try again?</span>
			</p>
		</>
	)

	const renderContent = (isEmailVerified) => {
		switch (isEmailVerified) {
			case true:
				return passwordForm;
			case 'unverified':
				return errorMessage;
			default:
				return emailForm;
			}
	}

	return (
		<>
			<div className='password-container'>
				{renderContent(isEmailVerified)}
				{errorMsg && (
					<Alert onClose={setErrorMsg(false)}>
						<p>{errorMsg}</p>
						<small>Tap to dismiss.</small>
					</Alert>
				)}
				{successMsg && (
					<Alert onClose={setSuccessMsg(false)}>
						<p>{successMsg}</p>
						<small>Tap to dismiss.</small>
					</Alert>
				)}
			</div>
		</>
	);
};

export default ForgotPassword;
