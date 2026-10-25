# The Dark Queen of Mortholme — teste Android v0.3

[Baixar APK — aproximadamente 93 MB](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/mortholme-download/mortholme-android-test-v0.3.apk)

Os dados já estão dentro do APK. Não precisa importar ZIP ou OBB. É aplicativo separado do Celeste. ARM64, Android API 21+, OpenGL ES 3, target 33; compatibilidade real ainda precisa teste em aparelho.

Viabilidade alta: Godot 4.2.1 original, scripts GDScript recuperáveis, recursos preservados, sem dependência FMOD. Primeiro APK com runtime Android da própria engine. As 2.868 entradas originais foram mantidas; 2.867 permanecem byte a byte e project.binary recebeu ajustes de plataforma. Acrescentados controles touch, sem substituir cenas/arte/diálogos por recriação.

- Setas: movimentação e navegação.
- I: ataque básico; II: investida; III: magia, conforme desbloqueio original.
- OK: confirmar/avançar diálogos após o texto terminar.
- Botão superior direito: pausa.

Testado em Linux/Mesa: menu, início, diálogo, movimento, ataque e pausa/retomada por eventos dos botões. Ainda sem execução Android ou campanha completa. O arquivo recebido já referencia 12 texturas ausentes do pacote. Godot 4.6 precisa adaptação no plugin de diálogo; esta versão mantém 4.2.1. Compatibilidade nativa com páginas de 16 KB permanece pendente. [Análise completa e limites](ANALISE-ANDROID.md), [auditoria do APK](apk-audit.json).

Capturas do teste desktop, com interface touch: [menu](title-mobile.png), [partida](game-action.png). Créditos e recursos do jogo original preservados. Compilação experimental com assinatura de teste; não representa lançamento oficial.

## Correções da v0.2

- Pausa automática ao trocar de aplicativo/perder foco, procurando o menu na hierarquia real do jogo. O retorno mantém a batalha pausada até confirmação do jogador.
- Liberação dos dedos nativos ao perder foco, trocar de cena ou entrar/sair da pausa, evitando toques pendurados nos botões.
- Voltar do Android enviado no início de um frame de processamento e mantido por 120 ms para o menu original reconhecer o comando.
- Ícone de pausa distinguível do ataque II; duas texturas compartilhadas pelos nove botões, em vez de gerar texturas iguais para cada um.

[Teste de regressão desktop](lifecycle-proof.json): menu, tutorial, movimento, ataque, pausa, dois dedos, perda/retorno de foco e simulação do botão Voltar passaram. Notificações Android foram simuladas em Linux; não substituem teste físico.

Instale sobre a v0.1: mesmo pacote e certificado, versionCode 2. Não é necessário desinstalar nem importar dados. A v0.1 continua disponível no histórico de downloads.

No celular, verificar: som, movimento junto com ataque, pausar, sair para outro app e voltar, usar Voltar para retomar. Se houver falha, informar versão Android, etapa e mensagem/captura. Ainda existem as mesmas 12 texturas ausentes no EXE recebido e a pendência de suporte nativo a páginas de 16 KB.

## Novidades da v0.3 — controles e diagnóstico

Abra **MOBILE** na tela de título, antes de começar a partida, ou depois de abrir a pausa original.

- **Controles → Personalizar na tela**: arraste os botões; escolha o botão na lista para ajustar tamanho, opacidade, nome e estilo (círculo, anel ou quadrado). Salvar mantém as mudanças no aparelho; Cancelar restaura o estado anterior à edição.
- Layouts prontos: padrão, espelhado (direcional troca de lado mantendo esquerda/direita) e compacto. Padrão também recupera um layout que ficou difícil de usar.
- **Painéis**: ative desempenho e/ou log. Selecione FPS, RAM, processamento e GPU. Arraste pelo título e feche pelo X; reative pelo menu. Os painéis começam desligados numa instalação nova.
- RAM mostra RSS do aplicativo, quando o sistema permite a leitura. O tempo de quadro é medido pela engine, não um percentual de uso da CPU. A memória gráfica vem do contador da engine; uso CPU/GPU em porcentagem aparece N/D porque este runtime não fornece essas medições. Zero/ausência de contador gráfico aparece N/D.
- O log mostra a parte final do arquivo real do runtime, com leitura limitada a 8 KiB por atualização e tratamento de UTF-8. Arquivos de log têm limite configurado de 512 KiB e retenção de 3 arquivos. A atualização dos painéis ocorre a cada 0,5 s; sem leitura/coleta quando ocultos.

A edição mantém a partida pausada e bloqueia os comandos touch do jogo. Fechar os ajustes abertos pela pausa não retoma a batalha sozinho. Configurações ficam no armazenamento privado do aplicativo, sem alterar os arquivos originais.

Verificações: [17 casos da interface](ui-proof.json), regressão de combate/pausa/segundo plano e integração do editor pela pausa original em [lifecycle-proof.json](lifecycle-proof.json), integridade e assinatura do APK. Todos os testes de execução foram em Linux/Mesa; **Android físico, áudio real, campanha completa e suporte nativo 16 KB permanecem pendentes**.

Pode instalar sobre a v0.2: mesmo pacote e certificado, versionCode 3. [Menu](settings-menu.png), [editor](touch-editor.png) e [painéis](diagnostics-panels.png) são capturas do teste desktop, não benchmarks do celular.
