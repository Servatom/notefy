import '../assets/css/Alert.css';

const Alert=(props)=>
{
    return(
            <div className="modalBox" onClick={()=>props.onClose(false)}>
                <div className="modal-wrapper">
                    {props.children}
                </div>
            </div>
    )
}

export default Alert;