# Canine — Laboratório de Movimento 0.1

Primeira versão original para Windows 64 bits, feita em Godot 4.2.1. Abra CanineLab.exe. Não precisa instalar a Godot ou extrair dados de outro jogo.

O personagem foi desenhado a partir da referência fornecida, com uma folha de 48 quadros. É uma interpretação animada do desenho; detalhes e poses diferem da imagem estática. Animações: parado, caminhada, corrida, agachamento, subida/queda e deslizamento. Cenário 3D de blocos sem texturas, sprite em plano lateral: apresentação 2.5D.

## Controles

| Ação | Teclado | DualSense (mapeamento padrão) |
|---|---|---|
| Mover | A / D ou setas | Analógico esquerdo / direcional |
| Correr | Shift | R2 ou L3 pressionado |
| Pular | Espaço / W / seta acima | × |
| Agachar | Ctrl / S / seta abaixo | ○ |
| Deslizar | C, ou agachar em corrida | □, ou ○ em corrida |
| Recomeçar | R | Create |
| Pausar | Esc | Options |
| Mostrar/ocultar ajuda | Tab / F1 | △ |
| Tela cheia | F11 | — |

O controle pode ser conectado depois de abrir o jogo; o nome aparece na interface. Suporte é pelo mapeamento de gamepads da Godot/SDL. Transporte USB/Bluetooth e o modelo físico DualSense ainda precisam ser testados no Windows. Se o Steam Input duplicar comandos, use apenas uma camada de mapeamento. Não há suporte implementado para gatilhos adaptativos, áudio do controle ou feedback háptico especial.

## Movimento e física

Simulação a 120 Hz com cápsula CharacterBody3D, movimento bloqueado no eixo de profundidade, aceleração/frenagem próprias, aceleração aérea menor, chão inclinado com snap, gravidade mais forte na queda, salto com altura variável, 110 ms de coyote time e 130 ms de jump buffer. A cápsula reduz para agachar/deslizar e consulta espaço antes de levantar. Deslizamento exige velocidade mínima e tem frenagem e cooldown. A posição visual é interpolada entre passos físicos; câmera usa suavização independente da taxa de quadros.

Esses valores são voltados à resposta de um jogo de plataforma, não a biomecânica real. Não há combate, história, som, customização de teclas, plataforma móvel, subida automática de degraus ou campanha. Há vãos, degraus, uma passagem baixa e uma rampa. Cair repõe no começo.

## Verificação e limites

Testes integrados usam os corpos, colisores e cenário reais. Resultados estão em QA.json. Medem velocidade, frenagem, deslizamento, salto longo/curto, aterrissagem, teto baixo, buffer, coyote time, reposição, mapeamentos padrão e pausa. A validação dos botões é sintética, não um teste físico de gamepad. Capturas foram renderizadas em Linux/Mesa por software: não são benchmark de GPU Windows.

A exportação usa template Windows x86_64 oficial. O executável não foi executado nativamente em Windows neste ambiente Linux. A abertura do pacote embarcado também é verificada pela engine Linux compatível; isso valida os recursos, sem substituir o teste Windows. A versão não tem assinatura Authenticode.

## Fontes

Abra project.godot na Godot 4.2.1. Scripts legíveis em scripts/. O preset Windows usa um caminho de template deste ambiente; ajuste custom_template no export_presets.cfg ou instale os templates oficiais ao compilar em outro computador. tests/ contém os probes. get_template.py documenta aquisição do template oficial; não é necessário para jogar.
