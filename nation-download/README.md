# Atlas Nações — alpha 0.1.1

Primeira build jogável de um tycoon nacional para Windows e Android. Projeto independente, inspirado no gênero de gestão territorial e na referência visual enviada pelo usuário. Não é afiliado ao RoWorld/Roblox. Arte vetorial do mapa, marcadores simples com cores e siglas e painéis adaptados para mouse e toque.

## Jogar

- Windows 64 bits: extraia o ZIP e execute `Atlas-Nacoes-v0.1.1-Windows.exe`. Requer OpenGL 3.3; não precisa instalar Godot.
- Android 7 ou superior, ARM64 ou ARMv7 e OpenGL ES 3.0: instale `Atlas-Nacoes-v0.1.1-Android.apk`. É uma build de testes assinada com chave de desenvolvimento. Funciona offline e não solicita acesso à Internet.
- Escolha no mapa ou na lista uma das 195 nações. Há modo equilibrado e modo com população/PIB de referência real.
- Arraste o mapa; amplie pela roda do mouse, pinça ou botões +/−. Em Construir, escolha uma empresa, uma instalação e toque em terra dentro do país.
- Espaço pausa; 1/2/4 alteram o tempo; F11 alterna tela cheia; Esc cancela posicionamento.
- Os painéis e listas rolam. A barra inferior também pode ser arrastada quando não couber. No Android, os botões e o painel lateral são maiores.

## Sistemas integrados nesta alpha

- Tesouro, reserva de obras, extrato, impostos sobre renda e lucro, dividendos de indústrias estatais, despesas e crédito com juros.
- População, mercado de trabalho, habitação, satisfação e migração agregada.
- Cidades, fazendas, usinas, água, fábricas, comércio, hospitais, universidades e centros logísticos.
- Contratos de três construtoras com preço, velocidade e qualidade diferentes; reserva de verba, pagamento por progresso, consumo de insumos e cancelamento que libera somente a reserva não paga.
- Produção limitada por trabalhadores, eletricidade, água, logística, máquinas, manutenção e pesquisa. Estoques de alimentos, insumos e produtos. Importações automáticas custam dinheiro e podem ser desligadas.
- Equipamentos com entrega, cobertura produtiva e desgaste. Novas fábricas exigem mais máquinas e capacidade logística.
- Pesquisa em cinco níveis; velocidade depende da educação.
- Recrutamento, treinamento, soldos e desmobilização usando a mesma força de trabalho da economia.
- Arsenal estratégico abstrato com requisito de pesquisa, encomenda e manutenção. Não há combate ou lançamentos.
- Pausa/1×/2×/4×; um segundo a 1× é um dia; mês de 30 dias e ano de 360 dias.
- Save local, backup, autosave a cada 30 segundos e ao minimizar. Ao voltar do segundo plano a partida fica pausada. Não há progressão com o aplicativo fechado.

## Escala, dados e limites

O mapa usa coordenadas geográficas WGS84. A barra de escala calcula a distância geodésica na latitude em que aparece (raio terrestre médio 6.371,0088 km). O zoom preserva as coordenadas; uma projeção plana não preserva todas as distâncias simultaneamente. **Esta alpha não reproduz cada metro do planeta nem entrega terreno global com detalhe físico 1:1.** As fronteiras são Natural Earth 1:50 milhões, simplificadas em aproximadamente 0,008 grau para a renderização móvel. Microestados podem ser escolhidos pela lista e pelo marcador; superfícies muito pequenas não aparecem no zoom mundial.

O catálogo tem 195 países. Territórios adicionais podem aparecer no desenho do mapa sem serem opções independentes de início. Não há ainda províncias administrativas, ruas, relevo, satélite ou divisão espacial detalhada. Instalações iniciais são símbolos esquemáticos de polos regionais, e não posições reais de todas as cidades/fábricas.

No modo equilibrado, todos começam com 100 mil habitantes e 50 milhões de moeda de jogo. No modo real, a população e o PIB de referência usam o ano indicado (alvo 2023; observações anteriores aparecem identificadas). Sem população observada, o início usa estimativa de 1.000 pessoas; sem PIB observado, usa renda-base simulada. Tesouro, tropas, salários, instalações e preços são modelos de jogo, não estatísticas oficiais. Projetos são polos proporcionais ao tamanho da população inicial, permitindo simular países grandes sem milhões de entidades. A riqueza relativa é limitada para manter a alpha jogável.

A economia inicial tem uma base privada agregada; novas indústrias são estatais. A receita nacional contabiliza imposto mais dividendo líquido uma vez; não converte PIB diretamente em dinheiro do tesouro. O comércio e a conexão logística são agregados em nível nacional nesta versão.

Guerras, IA de outros países, diplomacia, expansão por conquista, estradas/portos individuais, cadeias industriais especializadas, multiplayer, nuvem e a simulação completa do planejamento ficam para versões seguintes. Esta é uma base funcional para testes e balanceamento, não a versão final do projeto.

## Validação realizada

- Godot 4.6.3: 236 verificações de simulação aprovadas, incluindo os 195 inícios no modo real, contabilidade de obras, cancelamento, estoques, entregas, recrutamento, pesquisa, arsenal abstrato, save/backup e continuidade após carregar.
- Navegação por todos os painéis, início de partida, posicionamento, save/load e gestos simulados; interfaces de desktop e de celular verificadas no renderizador Linux.
- APK: integridade ZIP, assinatura v2/v3, pacote e arquiteturas ARM conferidos.
- Windows: arquivo PE x86-64 e recursos empacotados verificados. O conteúdo exportado foi aberto pela engine Linux.
- **Não foi executado nativamente em um Windows ou celular Android físico nesta sessão. Instalação, compatibilidade real, desempenho e consumo de bateria precisam ser medidos nesses aparelhos.** O FPS de capturas com renderização por software não representa o desempenho do Poco F7.

## Código e recompilação

Abra o projeto no Godot 4.6.3 padrão (sem .NET). Instale os export templates da mesma versão. Os presets do pacote de código usam os templates padrão; configure SDK Android, Java e chave de assinatura no editor para recompilar o APK. O artefato fornecido utiliza os templates oficiais 4.6.3.

Arquitetura: `sim.gd` contém a simulação diária e o save; `map.gd` desenha e navega pelas coordenadas; `main.gd` apresenta os painéis. Dados offline em `data/`. Testes: `godot --headless --path . --script res://tests.gd`.

## Fontes e licenças

- Fronteiras e nomes: Natural Earth, domínio público: https://github.com/nvkelso/natural-earth-vector — `ne_50m_admin_0_countries.geojson`.
- População: https://github.com/datasets/population — fonte Banco Mundial, datas preservadas.
- PIB: https://github.com/datasets/gdp — fonte Banco Mundial, datas preservadas.
- Catálogo ISO/capitais: https://github.com/datasets/country-codes — dados tabulares abertos, identificadores preservados.
- Godot Engine 4.6.3, licença MIT: ver `GODOT-LICENSE.txt`.

Nome Atlas Nações é provisório. O código e os ícones criados para este protótipo acompanham o pacote para continuidade do projeto.

## Alterações 0.1.1

Construções usam marcadores compactos com cor e sigla, substituindo os desenhos de miniaturas. Instrução de posicionamento fica abaixo dos botões do mapa. Mantém o mesmo formato de save e o pacote Android; pode atualizar a instalação anterior. Interface conferida novamente no renderizador Linux; validação em aparelhos reais continua pendente.
