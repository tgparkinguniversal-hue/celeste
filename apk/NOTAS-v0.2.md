# Hollow Knight — reconstrução experimental Godot 0.2

APK de teste não oficial em Godot 4.6.3. Usa recursos do jogo fornecido pelo usuário e reconstrução de sistemas. Não equivale a um porte completo ou idêntico ao original.

## Novidades da versão 0.2

- Caminho do Rei com 2.788 elementos visuais estáticos, 87 colisores de terreno, oito perigos e 11 regiões de reaparecimento recuperados da cena Tutorial_01. Câmera com deslocamento horizontal/vertical e escala baseada na configuração recuperada.
- Grande porta reage aos golpes e abre no 13º acerto, conforme o limiar recuperado do FSM. As saídas para Town e Cliffs estão identificadas; os destinos ainda não foram importados.
- Corridas, saltos, dash e ataques usam ordem de quadros, FPS e seções de repetição recuperados. HUD com máscaras, Geo e fonte originais. Ambiência de caverna na cena recuperada.
- Velocidade, gravidade, salto, dash e intervalos de ataque ajustados a constantes recuperadas, convertidas para pixels. Não há dash, salto duplo, salto de parede ou magia liberados no início normal; o laboratório permite testá-los.
- Dash comum vulnerável, banco sem recarga artificial de alma, dano interrompe ações, Sombra derrotável em combate e capacidade de alma reduzida enquanto ela existir.
- Salvamento atômico com migração da versão anterior e preservação de habilidades e estado da porta. Opção de salvar posição de exploração é ferramenta de teste, não mecânica original.
- Controles multitouch com opção para canhotos, ajuste de tamanho e opacidade; botões de habilidades bloqueadas identificados. Correções de câmera, pivôs dos sprites e eventos de mouse sintetizados no Android.

Menu com exploração da cena recuperada, campanha de três salas reconstruídas e laboratório. Pausa, mapa, inventário informativo e opções continuam disponíveis. O mapa usa contornos do terreno recuperado.

## Limitações

NPCs, missões, amuletos, progressão completa, chefes, transições para outras cenas e todos os FSMs do Unity ainda não foram portados. A IA dos crawlers é simplificada. A renderização usa quads estáticos e não reproduz todos os shaders, partículas, máscaras e oclusões do Unity. A campanha reconstruída é um laboratório e seu inimigo resistente não representa um chefe original. A física foi aproximada a partir de constantes; isso não demonstra equivalência quadro a quadro.

## Compilação e validação

Android API 24+/7.0, ARM64 e x86_64, OpenGL ES 3. Pacote `com.private.hkprototype.godot`, versionCode 2, `0.2.0-test`, assinado com chave de debug. Instalação pode atualizar a versão 0.1 assinada com a mesma chave.

65 verificações automatizadas: 23 de gameplay, 17 de regressão e 25 da cena recuperada. Cena renderizada e inspecionada em OpenGL por software. Assinatura e conteúdo do APK conferidos separadamente. Ainda sem teste em celular físico ou emulador Android; áudio e desempenho em hardware precisam de validação.

```sh
export XDG_CACHE_HOME=/workspace/godot-cache
export XDG_DATA_HOME=/workspace/godot-data
export XDG_CONFIG_HOME=/workspace/godot-config
export JAVA_HOME=/workspace/tools/jdk
export ANDROID_USER_HOME=/workspace/android-user
cd /workspace/celeste/godot-mobile
godot --headless --editor --import --quit
godot --headless --script res://tests/smoke.gd
godot --headless --script res://tests/regressions.gd
godot --headless --script res://tests/original.gd
godot --headless --export-debug Android /workspace/artifacts/hk-godot-test-v0.2.apk
```

`tools/extract_art.py` extrai atlas tk2d e metadados de animação; `tools/import_original_level.py` recupera a cena estática e colisores. `data/original_physics.json` registra valores e origens; `data/scene-import-report.json` registra contagens e exclusões. Os recursos originais pertencem aos respectivos titulares; esta publicação não concede licença sobre eles.
