import "../assets/css/MoonToggle.css";

function MoonToggle(props)
{
    function toggleTheme()
        {
            // document.querySelector(".fa-moon").classList.toggle("darkTheme");
            const theme = document.querySelector(".fa-moon");
            if(theme.classList.contains("darkTheme"))
            {
                document.documentElement.style.setProperty('--bodycolor', 'rgb(248, 248, 248)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(27, 27, 27)');
            }
            else{
                document.documentElement.style.setProperty('--bodycolor', 'rgb(27, 27, 27)');
                document.documentElement.style.setProperty('--textcolor', 'rgb(248, 248, 248)');
            }
            theme.classList.toggle("darkTheme");
            
        }
    
        let className="fas fa-moon darkTheme " + props.className;
    return(
        <i className={className} onClick={toggleTheme}></i>
    );


}

export default MoonToggle;