import { Container } from "./styles";
import { api } from "../../services/api";
import { useHistory } from "react-router-dom";
import { useUserContext } from "../../context/user";

const InitGame = () => {
  const { user } = useUserContext;
  const history = useHistory();

  const StartGame = (e) => {
    e.preventDefault();
    api
      .post("games/new", {
        users: [user ? user.id : ""],
      })
      .then((response) => {
        response.status === 201
          ? alert("Criado com sucesso")
          : alert("Erro, tente novamente");
        history.push(`/game/${response.data.id}/0`);
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
