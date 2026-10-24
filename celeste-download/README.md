# Celeste Android — v0.10 experimental

[Baixar APK v0.10](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/celeste-download/celeste-android-mobile-test-v0.10.apk) · aproximadamente 93 MB

Instale por cima da versão anterior, sem desinstalar. Mesmo ZIP de dados e progresso. Novo ícone de morango original e tela inicial temática com montanhas, cards e botão Jogar. O seletor sem áudio foi removido; Jogar usa o FMOD.

## Personalizar controles

No início, escolha Personalizar controles na tela. Toque e arraste cada controle; ajuste o tamanho individual; Salvar layout aplica, Cancelar descarta e Restaurar retorna ao padrão antes de salvar. Durante o jogo, EDITAR abre o mesmo editor e suspende a partida; ao voltar o layout é recarregado. Tamanho/opacidade globais e agarrar por toque continuam em Vídeo e preferências. A/X/LT/RT mantêm o mapeamento da v0.9.

## Monitor

FPS abre o monitor compacto de texto monospace, com gráfico de frame time recente, média/P95, CPU do processo, RAM PSS, frequência da lógica e saída. GPU é N/D: não há percentual confiável integrado. ⚙ ou Personalizar monitor de desempenho permite escolher métricas, fonte, cor, transparência e atualização. Painéis e barra de atalhos são arrastáveis; posições persistidas. × fecha e FPS/LOG reabrem.

## Vídeo e compatibilidade

Novas instalações começam em 60 FPS; escolhas explícitas anteriores são mantidas. Opções 60/90/120, nativa/720p/1080p/1440p/2160p e precisão de blur Original/Equilibrada/Desempenho continuam. A lógica permanece 60 Hz sem interpolação de movimento; pixel art interna original 320×180. Saída maior que limite de GPU conhecido retorna a nativa; inicialização interrompida pode restaurar vídeo nativo/60, sem alterar saves.

ARM64, Android 7/API 24+, OpenGL ES 3. Outras famílias de GPU/aparelhos ainda requerem teste físico; não é certificação universal. 159 checks locais e prova gráfica desktop de composição/fallback passaram; aparência e gestos da UI Android ainda precisam validação no aparelho.

## Dados e suporte

Se já importou, não baixe novamente. Para instalação nova, a [página de downloads](https://tgparkinguniversal-hue.github.io/celeste/celeste-download/) reúne as 19 partes em ZIP com hashes; use Importar dados do jogo e não extraia o ZIP. Exportar relatório inclui versão, driver/configuração e logs.

[Plano completo de conclusão](PLANO-COMPLETO-v0.9.md). Backups de saves, campanha completa e compatibilidade ampliada continuam pendentes. Nenhum conteúdo de fase/arte/mecânica foi removido nesta atualização.

FMOD Studio — Firelight Technologies Pty Ltd. Atribuição no aplicativo e EULA embutida. SDK completo não redistribuído.
