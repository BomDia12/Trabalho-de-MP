// Arquivo da página inicial
import { FirstContainer, SecondContainer, TitleContainer } from "./styles";
import Title from "../../components/Title";
import CardsImage from "../../assets/images/Rectangle.png";
import Tree from "../../assets/images/tree.png";
import Group from "../../assets/images/group.png";
import Ai from "../../assets/images/ai.png";
import Wagon from "../../assets/images/wagon.png";

import { api } from "../../services/api";
import { useHistory } from "react-router-dom";
import { useUserContext } from "../../context/user";

import Button from "../../components/Button";

const HomePage = () => {
  const { user } = useUserContext;
  const history = useHistory();

  const StartGame = () => {
      console.log('oi')
    api
      .post("/games/new", {
        users: [user ? user.id : null],
      })
      .then((response) => {
        response.status === 201
          ? alert("Criado com sucesso")
          : alert("Erro, tente novamente");
        history.push(`/game/${response.data.id}/0`);
      });
      console.log('oi')
  };
  return (
    <>
      <FirstContainer>
        <img src={CardsImage}></img>
        <TitleContainer>
          <Title>O FUTURO DO TRUCO</Title>
        </TitleContainer>
        <Button onClick={StartGame}>Jogue Agora</Button>
      </FirstContainer>

      <SecondContainer>
        <div className="content-wrapper">
          <Title>
            <span>Orientado a Testes</span>
          </Title>
          <img src={Tree}></img>
          <p>Feito sob protocolo para uma melhor experiência</p>
        </div>
        <div className="content-wrapper-2">
          <Title>
            <span>Modo Multijogador</span>
          </Title>
          <img src={Group}></img>
          <p>Jogue com seus amigos e divirta-se</p>
        </div>
        <div className="content-wrapper">
          <Title>
            <span>Truco Mineiro</span>
          </Title>
          <img src={Wagon}></img>
          <p>Jogue a modalidade de truco queridinha do Brasil</p>
        </div>
        <div className="content-wrapper-2">
          <Title>
            <span>Inteligência Artificial</span>
          </Title>
          <img src={Ai}></img>
          <p>Jogue contra o computador e teste suas habilidades</p>
        </div>
      </SecondContainer>
    </>
  );
};

export default HomePage;
