# Canine — Laboratório de Movimento 0.2

Primeira versão original para Windows 64 bits, feita em Godot 4.2.1. Abra CanineLab-v0.2.exe. Não precisa instalar a Godot ou extrair dados de outro jogo.

O personagem foi desenhado a partir da referência fornecida, com uma folha de 48 quadros. É uma interpretação animada do desenho; detalhes e poses diferem da imagem estática. Animações: parado, caminhada, corrida, agachamento, subida/queda e deslizamento. Cenário 3D de blocos com texturas de teste em grade de 1 m, sprite em plano lateral: apresentação 2.5D.

## Controles

| Ação | Teclado | DualSense (mapeamento padrão) |
|---|---|---|
| Mover | A / D ou setas | Analógico esquerdo / direcional |
| Correr | Shift | Inclinação total do analógico; R2 ou L3 para resposta mais rápida |
| Pular | Espaço / W / seta acima | × |
| Agachar | Ctrl / S / seta abaixo | ○ |
| Deslizar | C, ou agachar em corrida | □, ou ○ em corrida |
| Recomeçar | R | Create |
| Pausar | Esc | Options |
| Mostrar/ocultar ajuda | Tab / F1 | △ |
| Menu de controles | F2 ou menu de pausa | Touchpad |
| Tela cheia | F11 | — |

O controle pode ser conectado depois de abrir o jogo; o nome aparece na interface. Suporte é pelo mapeamento de gamepads da Godot/SDL. Transporte USB/Bluetooth e o modelo físico DualSense ainda precisam ser testados no Windows. Se o Steam Input duplicar comandos, use apenas uma camada de mapeamento. Não há suporte implementado para gatilhos adaptativos, áudio do controle ou feedback háptico especial.

## Movimento e física

Simulação a 120 Hz com cápsula CharacterBody3D, movimento bloqueado no eixo de profundidade, aceleração/frenagem próprias, aceleração aérea menor, chão inclinado com snap, gravidade mais forte na queda, salto com altura variável, 110 ms de coyote time e 130 ms de jump buffer. A cápsula reduz para agachar/deslizar e consulta espaço antes de levantar. Deslizamento exige velocidade mínima e tem frenagem e cooldown. A posição visual é interpolada entre passos físicos; câmera usa suavização independente da taxa de quadros.

Esses valores são voltados à resposta de um jogo de plataforma, não a biomecânica real. Não há combate, história, som, customização de teclas, plataforma móvel, subida automática de degraus ou campanha. Há vãos, degraus, uma passagem baixa e uma rampa. Cair repõe no começo.

## Verificação e limites

Testes integrados usam os corpos, colisores e cenário reais. Resultados da versão atual estão em QA-v0.2.json. Medem velocidade, frenagem, deslizamento, salto longo/curto, aterrissagem, teto baixo, buffer, coyote time, reposição, mapeamentos padrão e pausa. A validação dos botões é sintética, não um teste físico de gamepad. Capturas foram renderizadas em Linux/Mesa por software: não são benchmark de GPU Windows.

A exportação usa template Windows x86_64 oficial. O executável não foi executado nativamente em Windows neste ambiente Linux. A abertura do pacote embarcado também é verificada pela engine Linux compatível; isso valida os recursos, sem substituir o teste Windows. A versão não tem assinatura Authenticode.

## Fontes

Abra project.godot na Godot 4.2.1. Scripts legíveis em scripts/. O preset Windows usa um caminho de template deste ambiente; ajuste custom_template no export_presets.cfg ou instale os templates oficiais ao compilar em outro computador. tests/ contém os probes. get_template.py documenta aquisição do template oficial; não é necessário para jogar.

## Alterações da versão 0.2

- Textura de teste procedural com grade e marcações de 1 m, aplicada por projeção em coordenadas de mundo. Dimensões e colisões do percurso original preservadas.
- Oito ícones vetoriais nos quatro tutoriais, desenhados para este projeto no estilo da referência de botões PlayStation. Nenhum spritesheet comercial foi extraído da referência.
- Menu de controles com diagrama original do DualSense, linhas ligando botões às ações e leitura ao vivo do analógico/R2 quando conectado. Abra por F2, touchpad ou menu de pausa. Botão voltar e Esc restauram o estado de pausa anterior.
- Analógico: zona morta horizontal de 16%, curva de resposta 1,2 e transição contínua entre limites de caminhada e corrida. Inclinação máxima alcança 6,8 m/s; inclinação parcial permite passos lentos. R2/L3 aumenta a resposta para correr sem tirar a proporcionalidade do analógico. Teclado mantém Shift para correr.
- Contador de FPS e tempo médio por quadro no canto superior esquerdo, atualizado a cada 250 ms. Permanece visível no menu de controles. Engine.max_fps=0 e VSync desativado, também ao trocar tela cheia. A simulação continua em 120 Hz, independente da frequência de renderização.

A resistência motorizada dos gatilhos adaptativos do DualSense não foi implementada: o suporte desta versão usa eixos e botões convencionais. Também não há háptica avançada. USB/Bluetooth físicos e execução nativa Windows continuam pendentes de teste no aparelho do usuário.

Os FPS das capturas foram medidos em renderização por software Linux, não representam o desempenho esperado na sua GPU Windows. Drivers ou ferramentas externas ainda podem impor limites próprios.
