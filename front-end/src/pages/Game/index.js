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
import { useEffect, useState } from "react";
import { api } from "../../services/api";

const Game = () => {

  let { player, game_id } = useParams()

  console.log(player)
  
  const[hand, setHand] = useState()

  const loadHand = async () => {
    const response = await api.get(`games/${game_id}`)
    const response2 = await api.get(`games/round/${response.data.rounds[response.data.rounds.length - 1].id}`)
    setHand(response2.data.hands.filter(hand => hand.player == player)[response2.data.hands.filter(hand => hand.player == player).length - 1])
  }

  const playCardA = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'a'})
    console.log(response.status)
  }

  const playCardB = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'b'})
    console.log(response.status)
  }

  const playCardC = async () => {
    const response = await api.post("games/play", {hand_id: hand.id, card: 'c'})
    console.log(response.status)
  }

  useEffect(() => {
    loadHand()
  }, [])

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
        {hand && <a onClick={playCardA}>{hand.card_a}</a>}
        {hand && <a onClick={playCardB}>{hand.card_b}</a>}
        {hand && <a onClick={playCardC}>{hand.card_c}</a>}
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
