import { Container } from "./styles"

const Rules = () => {
  return (
    <Container>
      Truco mineiro

      As manilhas (cartas mais fortes) são fixas e têm a seguinte ordem (do mais forte para o mais fraco):
      4 de paus, Zap.
      7 de copas.
      Ás de espadas, Espadilha.
      7 de ouros.

      As cartas comuns (com qualquer outro naipe) são inferiores às manilhas, mas também têm seus valores,  e esses têm a seguinte ordem (do mais forte para o mais fraco):
      3
      2
      A, Ás
      K, Rei
      J, Valete
      Q, Rainha

      Exemplo de mão forte:
      4 de paus; (manilha mais forte)
      7 de ouros; (manilha mais fraca)
      3 de espadas; (carta comum mais forte)

      Exemplo de mão fraca:
      Rainha (carta mais fraca);
      Valete;
      2 de copas;
      Como jogar truco mineiro
      A primeira dupla a ganhar 12 pontos ganha.
      O jogo será distribuído entre 2 times de 2 jogadores cada (total de 4 jogadores), e a pontuação deles será contabilizada em conjunto
      Isso quer dizer que caso alguém ganhe uma rodada, o seu companheiro de equipe também ganhará os pontos daquela rodada.
      Em uma rodada supõe-se jogar de 2 a 3 cartas (é uma melhor de 3), e quem escolher a carta mais forte ganha a mão da vez.
      Se houver empate, os dois times pontuam.
      Em caso de empate na rodada, os 2 times ganham pontuação de 1 no jogo.
      Em caso de alguém pedir truco;
      Se o time 1 pediu truco e foi negado pelo time 2, o time 1 ganha  1 ponto;
      Se o time 1 pediu truco, o time 2 aceitou, e após isso houve desistência da mão pelo time 2, o time 1 ganha 3 pontos;
      (Após o truco 3 ser aceito) Se o time 1 pediu truco 6 e foi negado pelo time 2, o time 1 ganha  3 pontos;
      (Após o truco 3 ser aceito) Se o time 1 pediu truco 6, o time 2 aceitou, e após isso houve desistência da mão  pelo time 2, o time 1 ganha 6 pontos;
      (Após o truco 6 ser aceito) Se o time 1 pediu truco 9 e foi negado pelo time 2, o time 1 ganha 6 pontos;
      (Após o truco 6 ser aceito) Se o time 1 pediu truco 9, o time 2 aceitou, e após isso houve desistência da mão pelo time 2, o time 1 ganha 9 pontos;
      (Após o truco 9 ser aceito) Se o time 1 pediu truco 12 e foi negado pelo time 2, o time 1 ganha 9 pontos;
      (Após o truco 9 ser aceito) Se o time 1 pediu truco 12, o time 2 aceitou, e após isso houve desistência da mão pelo time 2, o time 1 ganha o jogo.

      Pontos no jogo
      Aposta
      Pontos
      Se não houver aposta
      1 pontos ao ganhador da rodada
      Truco
      3 pontos
      Truco 6
      6 pontos
      Truco 9

      Truco 12
      9 pontos

      12 pontos


      Como funcionam os turnos (ordem de cartas jogadas)
      Ao começo de cada rodada, um jogador será selecionado para começar o jogo, a primeira mão será seguida normalmente.
      O primeiro jogador da rodada atual será o último da próxima rodada, sendo o primeiro jogador da próxima rodada o que lhe suceder em sentido anti-horário.
      O ganhador da primeira mão jogará a primeira carta da segunda rodada, e o próximo será o que estiver depois dele (caso o jogador 2 tenha ganhado a primeira mão, o próximo a jogar após ele será o jogador 3. Caso o jogador 4 tenha ganhado a segunda mão, o próximo a jogar após ele será o jogador 1.)

      Controles de jogo
      Clique sobre uma carta para colocá-la em jogo.

      Finalizar a partida (desistir da partida)
      Durante os jogos, os jogadores têm a opção de finalizar a partida. Se isso ocorrer, o jogador não desistente receberá a vitória. Isto também entrará para a estatística do jogador.
    </Container>
  )
}

export default Rules;
