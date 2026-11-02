# Canine — Laboratório de Movimento 0.4

Extraia o ZIP Windows e abra CanineLab-v0.4.exe. Projeto original em Godot 4.2.1 para Windows 64 bits. Os recursos estão embutidos no executável.

## O que mudou

Esta versão usa cenário, câmera, desenho e colisões **inteiramente 2D**. A aparência 2.5D vem de faces desenhadas, contraste, sombras de contato e camadas com paralaxe; não há Node3D ou câmera 3D na cena.

A arte da personagem foi revisada a partir do desenho anterior. A renderização descarta pixels de alfa abaixo de 0,88, removendo franjas e pixels semitransparentes ao redor do contorno. A amostragem permanece nearest para preservar pixel art. A posição dos pés é registrada por quadro, evitando saltos do sprite por margens inconsistentes. Uma folha separada de oito poses foi criada para **andar agachada**: os pés e braços alternam e a postura permanece baixa. A pose agachada parada é uma animação distinta. Esses assets foram gerados e não equivalem a animação artesanal quadro a quadro.

Os menus inicial, de pausa, controles e opções usam um padrão único inspirado nas referências: azul-petróleo escuro, cantos arredondados, borda discreta, texto creme, títulos serifados e seleção em pêssego. O menu de pausa inclui Continuar, Controles, Opções, Voltar ao início do mapa e Menu inicial. HUD de FPS, cartões de tutorial e ícones seguem a mesma paleta. A imagem detalhada do DualSense foi mantida.

## Controles

| Ação | Teclado | DualSense padrão |
|---|---|---|
| Mover | A/D ou setas | Analógico esquerdo / direcional |
| Correr | Shift | Inclinação completa; R2/L3 para resposta rápida |
| Pular | Espaço / W / seta acima | × |
| Agachar / andar agachada | Ctrl / S / seta abaixo + direção | ○ + direção |
| Deslizar | C em movimento | □ em movimento |
| Pausar | Esc | Options |
| Controles | F2 | Touchpad |
| Reiniciar | R | Create |
| Tutoriais | Tab/F1 | △ |
| Tela cheia | F11 ou Opções | Opções |

Menus funcionam com mouse, teclado e navegação padrão de gamepad. As ações de controle foram verificadas sinteticamente; USB/Bluetooth com um DualSense físico ainda não foram testados. Gatilhos adaptativos motorizados e háptica avançada não estão implementados.

## Física e opções

Simulação a 120 Hz. Escala de 72 pixels por metro; caminhada 3,2 m/s, corrida 6,8 m/s, agachamento 1,5 m/s. Cápsula reduzida para agachar/deslizar, consulta de teto antes de levantar, aceleração e frenagem, controle aéreo menor, salto variável, coyote time de 110 ms e buffer de salto de 130 ms. Movimentos e câmera são suavizados por tempo. Entrar ou sair de menus aplica uma breve proteção contra um salto acidental com o mesmo botão de confirmação.

Renderização sem limite de FPS e VSync desligado. Opções permitem ocultar FPS e alternar tela cheia. A física não é acelerada por FPS mais alto. O contador mede uma janela de 250 ms. As preferências valem para a sessão; ainda não há salvamento de opções, som, combate ou campanha.

## Verificações e vídeo

35 verificações integradas, incluindo ausência de nós 3D, velocidades, salto longo/curto, animação agachada com oito quadros, teto baixo, buffer/coyote, pausa e menus, mapeamentos de controle e recorte de alfa. QA.json e tests/probe.gd registram os resultados.

O executável foi exportado com template Windows oficial; seus recursos embutidos foram carregados pela engine Linux compatível para validação e gravação. **Não houve execução nativa em Windows ou teste com controle físico.** O exportador apresentou avisos de liberação de recursos ao encerrar; não houve erro de script na execução verificada.

O vídeo é uma captura contínua da engine, controlada por um agente de regras. Mostra título, pausa, controles e o percurso. Captura fixa de 60 fps: não representa benchmark nem um limite no jogo distribuído. Não há áudio nesta versão.

## Fontes e compilação

Abra project.godot em Godot 4.2.1. O preset usa um caminho de template deste ambiente; ajuste custom_template ou instale os templates oficiais no seu computador. As pastas assets/ e scripts/ são suficientes para reimportar os recursos. O cache .godot/ não é necessário e não acompanha as fontes. GODOT-LICENSES.txt contém as licenças da engine.
