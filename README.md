# campeonato-regional
trabalho final com nota 10 na disciplina PL/pgSQL, desenvolvimento de  um sistema para que a população possa acompanhar os campeonatos regionais
A Federação Esportiva Riograndense de Críquete (FERC) te procurou para compor o time de desenvolvimento deles. A FERC está desenvolvendo um sistema para que a população possa acompanhar os campeonatos regionais, além de poder obter uma série de informações relacionadas às equipes e aos esportistas. A tua responsabilidade é desenvolver o banco de dados do sistema e, como administrador do banco de dados, tens a função de criar as tabelas e todas as funções necessárias para que a equipe de desenvolvedores backend possa acessar o banco de dados sem necessitar conhecer como este banco de dados foi implementado.

O administrador do sistema gerou o diagrama do banco de dados conforme imagem anexa, e que pode ser resumido da seguinte forma: Um atleta pertence a uma equipe, esta equipe possui diversos atletas. Uma equipe joga várias competições e cada competição possui várias equipes. 

Com base nessas relações, observe as requisições do sistema para que tu possa desenvolver um banco de dados para a FERC:

   Tabelas Explícitas:

   - Atleta: cada atleta é identificado de forma única, armazenam-se as informações de nome completo, data de nascimento, cidade natal e a posição em que joga.

 - Equipe: cada equipe é identificado de forma única, amazenam-se as informações de nome da equipe, data de fundação, cidade de origem e o número de vezes campeã;

    - Competição: cada competição é identificado de forma única, amazenam-se as informações de cidade-sede, semestre, ano, nome fantasia e a identificação da equipe vencedora;




     

     Relações:

      - Um atleta está vinculado a uma só equipe. E uma equipe deve possuir ao menos 18 atletas;

          - Apesar de um atleta estar vinculado somente a uma equipe, os contratos possuem a duração de um campeonato. Portanto, o vínculo entre o atleta e a equipe dura 6 meses. Desta forma, o atleta pode mudar de equipe e, a longo prazo, pode até retornar a equipe original. Logo, deve constar alguma análise de vínculo entre atleta e equipe ($atletaAtivo);

          - Cada competição possui 8 equipes cadastradas;

          - Cada competição possui 28 jogos, onde todas as equipes cadastradas naquela competição se confrontam uma única vez;

          - Cada combinação de equipes na disputa por um jogo não pode ser repetida, independente da ordem em que elas se encontram. Em outras palavras, o jogo Equipe A vs Equipe B é a mesma coisa que Equipe B vs Equipe A;

          - De cada jogo amazenam-se as informações de identificação da equipe A, identificação da equipe B, assim como as pontuações de cada uma dessas equipes e a identificação da equipe vencedora;




     Observações Gerais:

      - O sistema em desenvolvimento vai lidar apenas com cidades riograndenses cuja numero de população seja igual ou superior à 20mil. Desta forma, para fins de simplificação, os atletas só poderão ter nascidos em alguma dessas cidades;

          - A lista de cidades que podem ser consideradas no sistema podem ser obtidas na página da Wikipédia (https://pt.wikipedia.org/wiki/Lista_de_munic%C3%ADpios_do_Rio_Grande_do_Sul_por_popula%C3%A7%C3%A3o); ;

          - Os atletas podem jogar somente em uma das seguintes posições: Opener, Number3, Midle-order, Wicket-keeper, Bowlers, All-rounders e Fielders. Apesar de algumas dessas posições poder ser subdividida, o administrador do sistema preferiu manter somente essas posições para fins de cadastro;

          - Durante uma partida, há 11 jogadores de cada equipe em campo, onde cada posição de jogador deve conter um número mínimo de atletas, como se observa: 2 Opener, 1 Number3, 4 Midle-order, 1 Wicket-keeper, 1 Bowlers, 1 All-rounders e 1 Fielders.

          - Para cada posição de jogador existente, a equipe deve manter ao menos um atleta reserva para aquela posição. Portanto, uma equipe só poderá participar de um campeonato se possuir no mínimo 18 jogadores contratados, sendo eles ao menos: 3 Opener, 2 Number3, 5 Midle-order, 2 Wicket-keeper, 2 Bowlers, 2 All-rounders e 2 Fielders;

          - Todas as equipes irão começar no banco de dados com nenhum campeonato vencido e, somente irão ganhar o troféu de campeã ao fim de uma competição;

          - A equipe vencedora de um campeonato é aquela que possuir o maior número de vitórias e, em caso de empate, a que possuir maior pontuação acumulada;

          - Cada competição possui um nome fantasia que, em geral, é uma junção do nome da cidade-sede com o ano em que está ocorrendo. Desta forma, uma competição não pode ocorrer na mesma cidade duas vezes no mesmo ano. Por exemplo, Camaquã_2022 ocorreu OU no primeiro semestre de 2022 OU no segundo semestre de 2022. Não pode haver dois Camaquã_2022!


