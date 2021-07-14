import "../assets/css/MoonToggle.css";

function MoonToggle()
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
    
    return(
        <i class="fas fa-moon darkTheme" onClick={toggleTheme}></i>
    );


}

export default MoonToggle;