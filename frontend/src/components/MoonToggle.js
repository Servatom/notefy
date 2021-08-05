import { useState, useEffect } from "react";
import "../assets/css/MoonToggle.css";

function MoonToggle(props)
{
    const [theme, setTheme] = useState("dark");
    
    useEffect(() => {
        let themeChoice = JSON.parse(localStorage.getItem('theme'))
        
        if(themeChoice)
        setTheme(themeChoice);
    }, []);

    // stores notes to local storage whenever the notes list changes
    useEffect(() => {
        localStorage.setItem('theme',JSON.stringify(theme));
            if(theme=="dark")
            {
                
                document.documentElement.style.setProperty('--bodycolor', 'rgb(27, 27, 27)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(248, 248, 248)');

            }
            else{

                document.documentElement.style.setProperty('--bodycolor', 'rgb(248, 248, 248)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(27, 27, 27)');
            
            }
    }, [theme]);
    
    
    
    function toggleTheme()
        {
            // document.querySelector(".fa-moon").classList.toggle("darkTheme");

            const moon = document.querySelector(".fa-moon");
            if(theme=="dark")
            {
                document.documentElement.style.setProperty('--bodycolor', 'rgb(248, 248, 248)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(27, 27, 27)');
                setTheme("light");
            }
            else{
                document.documentElement.style.setProperty('--bodycolor', 'rgb(27, 27, 27)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(248, 248, 248)');
                setTheme("dark");
            }
            moon.classList.toggle("darkTheme");
            
        }
    
        let className="fas fa-moon darkTheme " + props.className;
    return(
        <i className={className} onClick={toggleTheme}></i>
    );


}

export default MoonToggle;