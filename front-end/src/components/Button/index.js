import { ButtonContainer } from './styled'

const Button = (props) => {
    return (
        <ButtonContainer> {props.children} </ButtonContainer>
    );
}

export default Button;
