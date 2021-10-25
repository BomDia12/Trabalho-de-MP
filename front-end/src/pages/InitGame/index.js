import { Container } from "./styles";
import { api } from "../../services/api";
import { useHistory } from "react-router-dom";

const InitGame = () => {
  const history = useHistory();
  const StartGame = (e) => {
    console.log("iniciou");
    e.preventDefault();
    console.log("continua");
    api.post("games/new").then((response) => {
      console.log("meio");
      response.status === 201
        ? alert("criado com sucesso")
        : alert("erro, tente novamente");
      history.push("/game");
    });
  };
  return (
    <Container>
      <a href="#" onClick={StartGame}>
        start
      </a>
    </Container>
  );
};

export default InitGame;
