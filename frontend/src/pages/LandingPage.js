import "../assets/css/LandingPage.css";
import githubLogo from "../assets/media/github-icon.svg";
import wednesday from "../assets/media/wednesday.png";
import mynote from "../assets/media/mynote.png";
import colors from "../assets/media/colors.png";
import notesoverlap from "../assets/media/notesoverlap.png";
import MoonToggle from "../components/MoonToggle";



function LandingPage()
{
    return(
        <>
        
        <div className="landing-container">
        <MoonToggle/>
            <div className="lbox">
                <svg className="stack" width="302" height="329" viewBox="0 0 302 329" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="8.45782" y="177.006" width="138" height="188" rx="18" transform="rotate(-40.3888 8.45782 177.006)" fill="#F6A89E" stroke="#33322E" stroke-width="12"/>
                        <rect x="61.45" y="87.6386" width="138" height="188" rx="18" transform="rotate(-22.7249 61.45 87.6386)" fill="#8CD4CB" stroke="#33322E" stroke-width="12"/>
                        <rect x="136.422" y="22.1952" width="138" height="188" rx="18" transform="rotate(-6.47285 136.422 22.1952)" fill="#F4D799" stroke="#33322E" stroke-width="12"/>
                        <path d="M183 108.584L208.837 134.476L250 73.4761" stroke="#33322E" stroke-width="16" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <div className="text">
                    <h1 className="notefy-heading">notefy</h1>
                    <p className="tagline">you note, we'll notify :)</p>
                    <p className="crafted">crafted by <a href="https://github.com/Servatom/"><span>servatom</span><img className="githublogo" src={githubLogo}/></a></p>
                </div>
            </div>
            <div className="rbox">
                <div className="left">
                    <img className="wednesday" src={wednesday}/>
                    <img src={mynote}/>
                </div>
                <div className="right">
                    <img src={colors}/>
                    <img src={notesoverlap}/>
                </div>
            </div>
        </div>
        
        </>
    );
}

export default LandingPage;