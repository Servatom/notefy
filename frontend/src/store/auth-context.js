import React, { useState } from 'react';

const AuthContext = React.createContext({
    token: '',
    email: '',
    isLoggedIn: false,
    login: (token)=>{},
    setEmail:(email)=>{},
    logout: ()=>{}
});

export const AuthContextProvider = (props)=>
{
    const initialToken = localStorage.getItem('token');
    const initialEmail = localStorage.getItem('userEmail');
    
    const [token, setToken] = useState(!!initialToken?initialToken:null);
    const [email, setEmail] = useState(!!initialEmail?initialEmail:null);

    const userIsLoggedIn = !!token;
    const loginHandler=(token)=>
    {
        setToken(token);
        localStorage.setItem('token',token);
        localStorage.setItem('userEmail',email);
        
    }
    const emailHandler=(email)=>
    {
        setEmail(email);

    }

    const logoutHandler=()=>
    {
        setToken(null);
        setEmail(null);
        localStorage.removeItem('token');
        localStorage.removeItem('userEmail');
        
    }
    

    const contextValue={
        token: token,
        email: email,
        isLoggedIn: userIsLoggedIn,
        login: loginHandler,
        setEmail: emailHandler,
        logout: logoutHandler
    }
    
    return <AuthContext.Provider value={contextValue}>
        {props.children}
        </AuthContext.Provider>
}

export default AuthContext;