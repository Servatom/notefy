import "../assets/css/ToggleBtn.css";

function Togglebtn()
{
    
    function toggleTheme()
        {
            
        }

    
    return(

        
        <div>
            <label class="switch ml-auto">
                <input type="checkbox" onClick={toggleTheme}/>
                <span class="slider round"></span>
              </label>
              <i class="fas fa-moon"></i>
        </div>
            
            
        
    );
}

export default Togglebtn;