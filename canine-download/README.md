# Canine — Laboratório de Movimento 0.6

Extraia o ZIP Windows e abra CanineLab-v0.6.exe. Projeto original em Godot 4.2.1 para Windows 64 bits. Os recursos estão embutidos no executável.

## O que mudou

Esta versão usa cenário, câmera, desenho e colisões **inteiramente 2D**. A aparência 2.5D vem de faces desenhadas, contraste, sombras de contato e camadas com paralaxe; não há Node3D ou câmera 3D na cena.

A animação da personagem foi substituída por um **esqueleto 2D com peças rígidas** (Skeleton2D/Bone2D). Cabeça, tronco, braços, pernas, pés, cauda e cachecol são articulados; a mesma arte da cabeça é usada em todas as ações. O tamanho das peças e o comprimento dos membros permanecem fixos. A arte foi recriada para permitir sobreposição nos pivôs, incluindo um tronco sem mangas duplicadas. As folhas antigas são preservadas nas fontes, mas não são usadas nem incluídas no executável.

Pernas usam cinemática inversa de dois segmentos e tornozelos independentes para orientar as solas; agachar e deslizar dobram as pernas e abaixam a bacia. Há transições por tempo, balanço dos braços, respiração, reação ao pouso e movimento secundário de cauda/cachecol. A pose de segurar objetos estende os braços. Não há redimensionamento de cabeça/corpo entre estados nem troca de quadros completos. O estilo é de recortes articulados e ainda pode receber refinamento artístico e ajuste do contato dos pés, principalmente em rampas: não há sensor individual de terreno por pé nesta versão.

Os menus inicial, de pausa, controles e opções usam um padrão único inspirado nas referências: azul-petróleo escuro, cantos arredondados, borda discreta, texto creme, títulos serifados e seleção em pêssego. O menu de pausa inclui Continuar, Controles, Opções, Voltar ao início do mapa e Menu inicial. HUD de FPS, cartões de tutorial e ícones seguem a mesma paleta. A imagem detalhada do DualSense foi mantida.

## Controles

| Ação | Teclado | DualSense padrão |
|---|---|---|
| Mover | A/D ou setas | Analógico esquerdo / direcional |
| Correr | Shift | Inclinação completa; R2/L3 para resposta rápida |
| Pular | Espaço / W / seta acima | × |
| Agachar / andar agachada | Ctrl / S / seta abaixo + direção | ○ + direção |
| Deslizar | C em movimento | □ em movimento |
| Segurar / puxar objeto | E + direção | R1 + direção |
| Arrastar / levantar objeto | Clique esquerdo + mouse | — |
| Pausar | Esc | Options |
| Controles | F2 | Touchpad |
| Reiniciar | R | Create |
| Tutoriais | Tab/F1 | △ |
| Tela cheia | F11 ou Opções | Opções |

Menus funcionam com mouse, teclado e navegação padrão de gamepad. As ações de controle foram verificadas sinteticamente; USB/Bluetooth com um DualSense físico ainda não foram testados. Gatilhos adaptativos motorizados e háptica avançada não estão implementados.

## Física e opções

Simulação a 120 Hz. Escala de 72 pixels por metro; caminhada 3,2 m/s, corrida 6,8 m/s, agachamento 1,5 m/s. Cápsula reduzida para agachar/deslizar, consulta de teto antes de levantar, aceleração e frenagem, controle aéreo menor, salto variável, coyote time de 110 ms e buffer de salto de 130 ms. Movimentos e câmera são suavizados por tempo. Entrar ou sair de menus aplica uma breve proteção contra um salto acidental com o mesmo botão de confirmação.

O mapa foi ampliado até 73 metros: seis corpos rígidos (caixas empilháveis de 8/12/24 kg e bolas de 6/9 kg), plataforma móvel e novos degraus. Objetos respondem a gravidade, atrito, colisões, torque e forças de arrasto; E/R1 permite puxar horizontalmente, e o mouse arrasta/levanta. Pausa congela os corpos; reiniciar restaura os objetos no passo da física.

Renderização sem limite de FPS e VSync desligado. Em Opções, escolha Full HD (1920×1080) ou 2K/QHD (2560×1440). São alvos internos reais, com área lógica 1280×720 estável e ajuste 16:9 à janela. Em uma tela menor há redução da imagem; para ver todos os pixels use uma tela correspondente. Resolução maior aumenta a definição de UI/geometria, não inventa detalhe nas sprites. Opções permitem ocultar FPS e alternar tela cheia. A física não é acelerada por FPS mais alto. O contador mede uma janela de 250 ms. As preferências valem para a sessão; ainda não há salvamento de opções, som, combate ou campanha.

## Verificações e vídeo

59 verificações passaram: 35 de movimentação/menus, 15 de resoluções/entrada/objetos e 9 do rig. Os testes do rig cobrem dimensões e texturas fixas, conexões dos membros, alcance das pernas, orientação dos pés ao espelhar, transições e consistência a 30/60/120 FPS. A cabeça não muda de escala, mas pode mover-se verticalmente por postura e respiração. QA.json e tests/ registram os resultados. Não houve benchmark de GPU: este ambiente usa renderização por software.

O executável foi exportado com template Windows oficial; seus recursos embutidos foram carregados pela engine Linux compatível para validação e gravação. **Não houve execução nativa em Windows ou teste com controle físico.** A execução de teste não apresentou erros de script.

O vídeo é uma captura contínua da engine, controlada por um agente de regras. Mostra título, pausa, controles, percurso e interação com caixas, além das opções de resolução. Captura fixa de 60 fps: não representa benchmark nem um limite no jogo distribuído. Não há áudio nesta versão.

## Fontes e compilação

Abra project.godot em Godot 4.2.1. O preset usa um caminho de template deste ambiente; ajuste custom_template ou instale os templates oficiais no seu computador. O recurso assets/rig_parts.res já acompanha as fontes. Para reconstruí-lo após alterar rig_sheet.png ou rig_torso.png, execute `godot --headless --path . --script tests/bake_rig.gd`. O jogo usa somente o banco pronto; o processamento da arte não é executado durante a partida. As antigas folhas e seu banco são arquivos de referência preservados. O cache .godot/ não é necessário e não acompanha as fontes. GODOT-LICENSES.txt contém as licenças da engine.
