import { Container, Table } from "./styles";
import CardBack from "../../components/GameCardBack";

const Game = () => {
  return (
    <Container>
      <Table>
        Truco
        <CardBack />
      </Table>
    </Container>
  );
};

export default Game;
