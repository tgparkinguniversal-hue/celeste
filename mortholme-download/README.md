# The Dark Queen of Mortholme — teste Android v0.6

[Baixar APK — aproximadamente 93 MB](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/mortholme-download/mortholme-android-test-v0.6.apk)

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

## Novidades da v0.4 — pixel art e ergonomia

Controles agora usam sprites pixelados próprios para setas, ataque, investida, magia, confirmação/interação e pausa, com placas em tons de vinho, pedra e ouro. Os menus mobile usam a fonte original e molduras pixeladas; os botões dos menus originais também recebem o tema e uma altura mínima para toque. Os estilos personalizáveis agora são Brasão, Contorno e Placa. Nomes, posições, tamanho e transparência existentes são preservados.

O novo layout padrão coloca interação acima dos ataques e eleva os botões de combate para liberar a barra de vida. Para aplicar em um aparelho com layout antigo salvo, abra MOBILE → Controles → Layout padrão. O direcional aceita deslizar o mesmo dedo entre setas; os ataques continuam sem ativação por simples passagem do dedo.

Os painéis têm tema pixelado, barra visual de FPS, texto compacto e log com quebra de linha. Congelar/Continuar pausa a leitura; Só erros/Todos filtra erros e avisos mantendo linhas de contexto; Seguir controla a rolagem automática. Posição e filtro ficam salvos. O X oculta e a aba Painéis reativa. A opção Painéis econômicos reduz a atualização para uma vez por segundo.

Otimizações: sprites e molduras reaproveitados em cache, sem gerar SVGs para os controles; atualizações de ações/visibilidade apenas quando mudam; remoção da criação de identificadores de cena em texto a cada frame; log sem releitura do conteúdo quando tamanho/data não mudaram, sem leitura congelado e sem coleta oculta. Não houve benchmark em celular para quantificar ganho de FPS/bateria.

Compatibilidade: controles, editor e painéis consideram a área segura fornecida pelo Android e limitam posições à área disponível; dados de escala/transparência não finitos são descartados ao carregar. Testes com área segura simulada passaram. Isso não certifica todos os recortes, proporções ou modelos. ARM64/GLES3 continuam necessários, e compatibilidade nativa com páginas de16KB segue pendente.

Passaram [26 verificações de interface](ui-proof.json) e a [regressão da partida](lifecycle-proof.json). Capturas desktop: [controles na partida](lifecycle-action.png), [menu](settings-menu.png), [editor](touch-editor.png), [painéis](diagnostics-panels.png). Áudio real, campanha completa, desempenho e estabilidade Android ainda precisam de aparelho. Instale sobre a0.3, sem desinstalar: mesmo pacote/certificado, versionCode4.

## Novidades da v0.5 — vídeo, tela cheia e taxas de quadros

Abra **MOBILE → Vídeo**. Escolha a resolução, os FPS e tela cheia; pressione **Testar configurações (20 s)** e depois **Manter**. Sem confirmação, o vídeo anterior retorna. Fechar os ajustes durante a prévia também reverte. Há um botão para recuperar nativo/60FPS. Uma inicialização interrompida durante a etapa de vídeo retorna a nativo/60FPS no próximo lançamento.

- Nativo/automático usa a área de renderização da janela.
- 2K e4K usam buffers de largura2560 e3840. No aspecto original, os tamanhos capturados foram **2560×1444** e **3840×2166**. As alturas seguem a proporção do jogo; não esticam para1440/2160. Texturas, sprites e pixel art permanecem originais; a ampliação não cria detalhes novos. Uma tela de resolução menor recebe a imagem redimensionada.
- 60/90/120 alteram o limite real da engine. A física permanece em60Hz e as animações conservam os quadros originais. O painel distingue alvo, FPS medidos e Hz informados pelo Android, quando disponíveis.
- Uma extensão da Activity solicita a taxa ao Android usando preferredRefreshRate, preferredDisplayModeId e Surface.setFrameRate quando suportados. Escolhe modos da mesma resolução física da tela. O Android pode limitar a solicitação por painel, bateria, temperatura ou política do fabricante; **não há garantia de120FPS em4K**.
- Tela cheia solicita ocultar barras do sistema; desligar volta a mostrá-las. O comportamento efetivo das barras e da taxa do painel ainda precisa teste Android.

Na aba **Interface**, escolha menu centralizado/lateral, oculte as setas/OK nos menus e restaure a posição dos painéis. A personalização da partida permanece.

Verificações: [26checks UI](ui-proof.json), [18checks de vídeo](video-proof.json) e regressão com partida/pausa em4K. O teste leve de500×282 em Linux/Mesa mediu **59,8 /90,0 /119,6 FPS**; isso verifica o limitador, não é benchmark do celular ou de4K. A Queen percorreu a mesma distância em1s nas três taxas. Buffers reais e cliques de GUI em2K/4K foram verificados. [Menu de vídeo](video-menu.png), [captura da partida4K](game-4k.png).

A Activity Android foi compilada e auditada, **sem execução em aparelho**;2.109 classes originais foram preservadas na comparação DEX normalizada. Só a Activity do template foi substituída, com auxiliares adicionados, sem novas permissões. Bibliotecas nativas e recursos do jogo preservados. Continuidade da campanha, áudio real, estabilidade Android e compatibilidade nativa16KB permanecem pendentes. Mesma assinatura, versionCode5: instale sobre a0.4.

A revisão final da Activity usa DisplayManager.DisplayListener e uma leitura adiada para atualizar os Hz após a transição, evitando exibir indefinidamente o valor anterior à solicitação. Android físico segue pendente.

## v0.6 — menus originais restaurados

Os menus originais de título e pausa voltaram a usar seus temas, fontes, tamanhos e posições. Removida a aplicação da skin mobile nesses menus. [Captura do título original](original-menu.png).

O sistema de checkpoint foi cancelado por solicitação do usuário e **não está incluído**. Não há novas opções de salvar/carregar no jogo. As preferências de controles/vídeo continuam sendo gravadas como antes; isso não é salvamento de progresso.

MOBILE permanece separado, com controles touch, painéis,2K/4K,60/90/120FPS e tela cheia. Bibliotecas/Activity Android da0.5 preservadas. 26checks UI, incluindo menu original, e regressão de partida/pausa/4K passaram em Linux/Mesa. Android físico, campanha completa e16KB permanecem pendentes. Mesmo certificado, versionCode6: instale sobre a0.5.
