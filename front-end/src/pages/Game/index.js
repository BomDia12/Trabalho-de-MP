import {
  BottomPlayer,
  Container,
  LeftPlayer,
  RightPlayer,
  Table,
  TopPlayer,
} from "./styles";
import CardBack from "../../components/GameCardBack";
import { useParams } from "react-router";

const Game = () => {

    const { player, game_id } = useParams()

  return (
    <Container>
      <Table>Truco</Table>
      <TopPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </TopPlayer>

      <RightPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </RightPlayer>

      <BottomPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </BottomPlayer>

      <LeftPlayer>
        <CardBack />
        <CardBack />
        <CardBack />
      </LeftPlayer>
    </Container>
  );
};

export default Game;
