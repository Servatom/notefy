import React from 'react';

const Icon = (props) => {

    const getPath = (name) => {
        switch(name) {
            case "name":
            return (
                <React.Fragment>
                    
                </React.Fragment>
            );
            case "email": 
            return (
                <React.Fragment>
                    <rect x="2.5" y="4.5" width="19" height="15" rx="1.5" fill="#2357DD" stroke="#193170"/>
                    <path d="M12.3554 13.9302C12.1597 14.1279 11.8403 14.1279 11.6446 13.9302L3.64905 5.85173C3.33657 5.53601 3.56021 5 4.00442 5L19.9956 5C20.4398 5 20.6634 5.53601 20.351 5.85173L12.3554 13.9302Z" fill="#3E83DC" stroke="#193170"/>
                    <rect x="4.92468" y="15.8661" width="3" height="1" rx="0.5" transform="rotate(-45 4.92468 15.8661)" fill="#193170"/>
                    <rect x="18.046" y="16.5732" width="3" height="1" rx="0.5" transform="rotate(-135 18.046 16.5732)" fill="#193170"/>
                </React.Fragment>
            );
            case "password": 
            return (
                <React.Fragment>
                    <mask id="mask0" mask-type="alpha" maskUnits="userSpaceOnUse" x="5" y="10" width="14" height="13">
                    <rect x="5.5" y="10.5" width="13" height="12" rx="1.5" fill="#2357DD" stroke="#193170"/>
                    </mask>
                    <g mask="url(#mask0)">
                    <rect x="5.5" y="10.5" width="13" height="12" rx="1.5" fill="#2357DD" stroke="#193170"/>
                    <rect x="6" y="11" width="12" height="5" rx="1" fill="#4F70BA"/>
                    <rect x="5" y="13" width="3" height="3" rx="1" fill="#193170"/>
                    <rect x="16" y="13" width="3" height="3" rx="1" fill="#193170"/>
                    <rect x="11" y="17" width="2" height="3.9" rx="1" fill="#193170"/>
                    </g>
                    <path d="M8.01646 9C8.01646 9 7.51851 2 12 2C16.4815 2 15.9835 9 15.9835 9" stroke="#193170" fill="none"/>
                </React.Fragment>
            ); 
            default: 
            return null; 
        }
    }
    return (
        <svg width="24" 
        height="24" 
        viewBox="0 0 24 24" 
        xmlns="http://www.w3.org/2000/svg">
            {getPath(props.name)}
        </svg>
    );
}

export default Icon;