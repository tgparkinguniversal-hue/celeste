# Celeste Android — v0.14 experimental

[Baixar APK v0.14](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/celeste-download/celeste-android-mobile-test-v0.14.apk) · aproximadamente 93 MB

Instale por cima da versão anterior, sem desinstalar. Mesmo ZIP de dados e progresso. Novo ícone de morango original e tela inicial temática com montanhas, cards e botão Jogar. O seletor sem áudio foi removido; Jogar usa o FMOD.

## Personalizar controles

No início, escolha Personalizar controles na tela. Toque e arraste cada controle; ajuste o tamanho individual; Salvar layout aplica, Cancelar descarta e Restaurar retorna ao padrão antes de salvar. Durante o jogo, EDITAR abre o mesmo editor e suspende a partida; ao voltar o layout é recarregado. Tamanho/opacidade globais e agarrar por toque continuam em Vídeo e preferências. A/X/LT/RT mantêm o mapeamento da v0.9.

## Monitor

FPS abre o monitor compacto de texto monospace, com gráfico de frame time recente, média/P95, CPU do processo, RAM PSS, frequência da lógica e saída. GPU é N/D: não há percentual confiável integrado. Antes de Jogar, abra **FPS, LOG e layout antes de jogar**. Marque **Abrir LOG ao iniciar o jogo** e/ou **Abrir monitor FPS ao iniciar o jogo**, configure e toque **Salvar**. Escolha métricas, fonte, cor, transparência, atualização e canto inicial; LOG fica no lado oposto ao monitor. Manter posições salvas conserva os arrastes. ⚙ durante a partida aplica a aparência imediatamente; as opções de abertura valem para a próxima partida. Painéis e barra de atalhos são arrastáveis; posições persistidas. × fecha e FPS/LOG reabrem.

## Vídeo e compatibilidade

Novas instalações começam em 60 FPS; escolhas explícitas anteriores são mantidas. Opções 60/90/120, nativa/720p/1080p/1440p/2160p e precisão de blur Original/Equilibrada/Desempenho continuam. A lógica permanece 60 Hz sem interpolação de movimento; pixel art interna original 320×180. Saída maior que limite de GPU conhecido retorna a nativa; inicialização interrompida pode restaurar vídeo nativo/60, sem alterar saves.

ARM64, Android 7/API 24+, OpenGL ES 3. Outras famílias de GPU/aparelhos ainda requerem teste físico; não é certificação universal. 195 checks existentes, incluindo oito novos de layout, e sete verificações do monitor (serviços Android stubados) e assinatura/integridade do APK passaram; provas gráficas da v0.10 continuam como evidência anterior, sem repetir benchmark; aparência e gestos da UI Android ainda precisam validação no aparelho.

## Dados e suporte

Se já importou, não baixe novamente. Para instalação nova, a [página de downloads](https://tgparkinguniversal-hue.github.io/celeste/celeste-download/) reúne as 19 partes em ZIP com hashes; use Importar dados do jogo e não extraia o ZIP. Exportar relatório inclui versão, driver/configuração e logs.

[Plano completo de conclusão](PLANO-COMPLETO-v0.9.md). Backups agora disponíveis; validação de campanha completa e compatibilidade ampliada continuam pendentes. Nenhum conteúdo de fase/arte/mecânica foi removido nesta atualização.

FMOD Studio — Firelight Technologies Pty Ltd. Atribuição no aplicativo e EULA embutida. SDK completo não redistribuído.

Desde a v0.11, o monitor evita coleta de histórico quando fechado, mantém opções em memória e suspende atualizações ao ficar em segundo plano. Não há medição de ganho de FPS em aparelho nesta sessão. Nenhum conteúdo do jogo foi removido.

## Backup do progresso (desde v0.12)

Antes de Jogar, escolha **Exportar backup do progresso** e salve o ZIP fora do app. **Restaurar backup do progresso** valida um ZIP exportado por este recurso, lista arquivos e pede confirmação antes de substituir. Outros slots são mantidos se ausentes do arquivo. Exporte seu progresso atual antes de restaurar um mais antigo. Não desinstale para atualizar. O ZIP de saves é separado do ZIP de Content; não inclui layouts Android ou estatísticas locais. Arquivos inválidos são rejeitados e restauração interrompida tem rollback no próximo launcher. Validação em aparelho ainda necessária; [detalhes dos backups](ANDROID-v0.12.md).

## Salvamento e retomada (desde v0.13)

Save validado antes de escrever, temporários com substituição por renomeação e acesso serializado com o backup ZIP. Principal existente corrompido tenta backup válido, mantendo o arquivo original; slot apagado não volta. XML serializers reutilizados. Reset de tempo na retomada aplicado na thread do jogo. [Detalhes dos saves](ANDROID-v0.13.md). Não adiciona autosave ao suspender. Retomada/ganho de desempenho ainda requerem teste físico.

## Editor e validação v0.14

Editor com lista para selecionar botões encobertos, aviso/confirmação de sobreposição, arraste sem salto e botão Espelhar. Layouts anteriores mantidos. Menu **Checklist de testes neste celular** registra Pendente/Passou/Falhou e a versão; os registros entram no relatório exportado. São observações manuais, não certificação automática. [Matriz de conclusão e roteiro](VALIDACAO-v0.14.md), [auditoria estática](content-audit-v0.14.json) e [detalhes desta versão](ANDROID-v0.14.md).
