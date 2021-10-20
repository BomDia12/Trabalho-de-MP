import { Container, Table } from "./styles"

const Rules = () => {
  return (
    <Container>
      <h2>Truco mineiro</h2>
      <br/>
      <div>
        <p>As manilhas (cartas mais fortes) são fixas e têm a seguinte ordem (do mais forte para o mais fraco):</p>
        <ul>
          <li>4 de paus, Zap.</li>
          <li>7 de copas.</li>
          <li>Ás de espadas, Espadilha.</li>
          <li>7 de ouros.</li>
        </ul>
      </div>

      <div>
        <p>As cartas comuns (com qualquer outro naipe) são inferiores às manilhas, mas também têm seus valores,
          e esses têm a seguinte ordem (do mais forte para o mais fraco):</p>
        <ul>
          <li>3</li>
          <li>2</li>
          <li>A, Ás</li>
          <li>K, Rei</li>
          <li>J, Valete</li>
          <li>Q, Rainha</li>
        </ul>
      </div>

      <div>
        <p>Exemplo de mão forte:</p>
        <ul>
          <li>4 de paus; (manilha mais forte)</li>
          <li>7 de ouros; (manilha mais fraca)</li>
          <li>3 de espadas; (carta comum mais forte)</li>
        </ul>

        <br/>
        
        <p>Exemplo de mão fraca:</p>
        <ul>
          <li>Rainha (carta mais fraca);</li>
          <li>Valete;</li>
          <li>2 de copas;</li>
        </ul>
      </div>

      <div>
        <strong>Como jogar truco mineiro</strong>
        <ul>
          <li>A primeira dupla a ganhar 12 pontos ganha.</li>
          <li>O jogo será distribuído entre 2 times de 2 jogadores cada (total de 4 jogadores),
            e a pontuação deles será contabilizada em conjunto</li>
          <li>Isso quer dizer que caso alguém ganhe uma rodada, o seu companheiro de equipe
            também ganhará os pontos daquela rodada.</li>
          <li>Em uma rodada supõe-se jogar de 2 a 3 cartas (é uma melhor de 3), e quem escolher
            a carta mais forte ganha a mão da vez.</li>
          <li>Se houver empate, os dois times pontuam.</li>
          <li>Em caso de empate na rodada, os 2 times ganham pontuação de 1 no jogo.</li>
          <li>Em caso de alguém pedir truco; </li>
          <ul>
            <li>Se o time 1 pediu truco e foi negado pelo time 2, o time 1 ganha  1 ponto; </li>
            <li>Se o time 1 pediu truco, o time 2 aceitou, e após isso houve desistência da mão
              pelo time 2, o time 1 ganha 3 pontos; </li>
            <li>(Após o truco 3 ser aceito) Se o time 1 pediu truco 6 e foi negado pelo time 2, o
              time 1 ganha  3 pontos; </li>
            <li>(Após o truco 3 ser aceito) Se o time 1 pediu truco 6, o time 2 aceitou, e após isso
              houve desistência da mão  pelo time 2, o time 1 ganha 6 pontos; </li>
            <li>(Após o truco 6 ser aceito) Se o time 1 pediu truco 9 e foi negado pelo time 2, o time
              1 ganha 6 pontos; </li>
            <li>(Após o truco 6 ser aceito) Se o time 1 pediu truco 9, o time 2 aceitou, e após isso
              houve desistência da mão pelo time 2, o time 1 ganha 9 pontos; </li>
            <li>(Após o truco 9 ser aceito) Se o time 1 pediu truco 12 e foi negado pelo time 2, o time
              1 ganha 9 pontos; </li>
            <li>(Após o truco 9 ser aceito) Se o time 1 pediu truco 12, o time 2 aceitou, e após isso
              houve desistência da mão pelo time 2, o time 1 ganha o jogo.</li>
          </ul>
        </ul>
      </div>

      <div>
        <Table>
          <tr>
            <th> Aposta </th>
            <th> Pontos </th>
          </tr>

          <tr>
            <td>Se não houver aposta</td>
            <td>1 pontos ao ganhador da rodada</td>
          </tr>

          <tr>
            <td>Truco</td>
            <td>3 pontos</td>
          </tr>

          <tr>
            <td>Truco 6</td>
            <td>6 pontos</td>
          </tr>

          <tr>
            <td>Truco 9</td>
            <td>9 pontos</td>
          </tr>

          <tr>
            <td>Truco 12</td>
            <td>12 pontos</td>
          </tr>
        </Table>
      </div>

      <div>
        <h3>Como funcionam os turnos (ordem de cartas jogadas)</h3>
        <p>Ao começo de cada rodada, um jogador será selecionado para começar o jogo, a primeira mão
          será seguida normalmente.</p>
        <p>O primeiro jogador da rodada atual será o último da próxima rodada, sendo o primeiro jogador
          da próxima rodada o que lhe suceder em sentido anti-horário.</p>
        <p>O ganhador da primeira mão jogará a primeira carta da segunda rodada, e o próximo será o
          que estiver depois dele (caso o jogador 2 tenha ganhado a primeira mão, o próximo a jogar após
          ele será o jogador 3. Caso o jogador 4 tenha ganhado a segunda mão, o próximo a jogar após ele
          será o jogador 1.)</p>
      </div>

      <div>
        <h3>Controles de jogo</h3>
        <p>Clique sobre uma carta para colocá-la em jogo.</p>
      </div>

      <div>
        <h3>Finalizar a partida (desistir da partida)</h3>
        <p>Durante os jogos, os jogadores têm a opção de finalizar a partida.Se isso ocorrer, o jogador
          não desistente receberá a vitória.Isto também entrará para a estatística do jogador.</p>
      </div>
    </Container>
  )
}

export default Rules;
