# The Dark Queen of Mortholme — análise e primeiro APK

A viabilidade técnica é alta. O executável fornecido contém um projeto Godot 4.2.1 exportado, com scripts GDScript em texto e pacote PCK v2 sem criptografia. Foi possível montar um primeiro APK com runtime Godot Android ARM64 oficial da mesma versão e os recursos originais. É um teste inicial, sem validação em telefone nesta sessão.

## O que foi identificado

Arquivo de entrada: The Dark Queen of Mortholme.exe, 157.640.432 bytes, SHA-256 57debcbe05b200279c86ecada41edf531186d39d84a9c62dcd6e67493defb80e. PE Windows x86-64 e PCK embutido de 88.763.108 bytes. As 2.868 entradas passaram na verificação MD5 registrada no pacote. Foram encontrados 86 scripts .gd, 52 cenas binárias .scn, 1.188 texturas .ctex, 110 samples, três streams MP3, 27 arquivos de tradução e seis shaders. Não foram encontradas DLLs, GDExtensions ou scripts bytecode .gdc como dependências do projeto.

O código de jogo está em GDScript e o áudio usa os recursos da própria Godot. Não foi necessário integrar FMOD. O port reutiliza scripts, cenas, arte, diálogos e áudio exportados; não é uma reconstrução das fases. O EXE Windows não é colocado no APK: foram usados os dados do PCK e o runtime Android.

## Adaptações da v0.1

Godot 4.2.1 Android, ARM64, GLES 3, orientação paisagem. Mesmo sistema de diálogos da versão recebida. Configurações ajustadas para renderizador GL Compatibility também no perfil mobile, limite inicial de 60 FPS, tratamento de Voltar e autoload de controles. Plugins de editor foram desativados. Ícone extraído dos recursos originais do jogo. Pacote independente org.mortholme.experimental.port, versionCode 1, versionName 0.1-mobile-test, assinado com certificado de teste.

TouchScreenButton nativo: esquerda/direita e cima/baixo para menus; I para ataque básico; II para investida; III para magia; OK para menus/diálogos; botão superior direito para pausa. Ataques adicionais respeitam os desbloqueios do próprio jogo. Botões de combate somem no menu e durante a pausa. Mapeamentos físicos originais permanecem, mas controles físicos não foram exercitados nesta sessão.

Todas as 2.868 entradas originais permanecem no APK. Das entradas originais, 2.867 mantêm exatamente os bytes originais, conferidos por hash; somente project.binary mudou para configurações Android. Acrescentado mobile/mobile_controls.gd. Nenhuma cena, textura, áudio, idioma ou mecânica foi removido. Bibliotecas ARM64 coincidem com as do template oficial Godot 4.2.1.

## Verificações realizadas

- Leitura e integridade do PCK original e dos assets do APK.
- 50 cenas exportadas retornaram PackedScene em carga headless, fora dos dois utilitários Windows de criação/substituição de ícones do editor. Isso é carga de recursos, não progressão de todas as cenas.
- Teste gráfico em Linux/Mesa por software: título, transição à cena inicial, presença da Queen, avanço de diálogos por eventos dos botões touch, saída do tutorial, movimento, sinal do ataque básico e pausa/retomada. Capturas em title-mobile.png e game-action.png. Não foi execução Android nem benchmark.
- APK íntegro, alinhamento ZIP verificado, assinaturas v1/v2/v3 válidas, package/version/minSdk/ABI conferidos. Dados ficam dentro do APK, sem ZIP/OBB separado.

## Limites encontrados

1. O EXE recebido referencia 12 texturas que não estão no seu PCK (queendashFX_Layer-20-copy-0..11). A mesma ausência apareceu com o runtime original 4.2.1, antes das adaptações. Nenhum recurso substituto foi inventado; avaliar o impacto nos efeitos ao jogar ou recuperar essas imagens de uma fonte completa/autorizada.
2. Um teste com Godot 4.6.3 apresentou erros no plugin de diálogos original. Por isso esta primeira versão usa 4.2.1; migrar engine exige corrigir compatibilidade e repetir validação.
3. Os dois utilitários de ícone do editor incluídos no pacote apresentam erros de anotações ao carregá-los isoladamente; não são ativados no runtime Android. Permanecem preservados.
4. As bibliotecas Android deste template têm alinhamento ELF de 4 KB. Execução nativa em aparelhos que exigem páginas de 16 KB ainda não é garantida. Um caminho suportado para isso requer atualizar/recompilar runtime e validar os diálogos.
5. História completa, ramificações/finais, combate avançado, áudio real, suspensão/retomada, layout no aparelho, outros modelos e desempenho sustentado ainda precisam de teste físico. O teste gráfico usou áudio dummy; não certifica áudio Android. O encerramento de testes desktop reportou recursos/objetos ainda em uso, a investigar em testes de ciclos longos.

Base declarada pelo APK: Android API 21+, ARM64, GLES 3; target API 33. Isso não é certificação de todos esses aparelhos. No POCO F7, o próximo passo é instalar e verificar abertura, menu, diálogos, movimentação, ataque, pausa e som. O APK usa armazenamento privado próprio; Celeste permanece em outro package.

## Atualização v0.2

Mesmo runtime, dados, identidade e certificado; versionCode 2, versionName 0.2-mobile-test. Corrigida a busca do menu de pausa na hierarquia real da cena, liberação de dedos em transições/interrupções e envio de Voltar no início do processamento. Botões compartilham duas texturas, sem mudar as artes originais.

A regressão Linux/Mesa com Godot 4.2.1 passou: menu/tutorial, deslocamento, sinal de ataque, pausa/retomada, dois dedos simultâneos, liberação de ações/botões na perda de foco, esconder controles em segundo plano, preservar pausa ao voltar e simulação de Voltar. Registro: lifecycle-proof.json. A simulação não comprova o comportamento real do sistema Android. Permanecem pendentes áudio/dispositivo/campanha/16 KB e investigação dos avisos de recursos em uso ao encerrar.

## Atualização v0.3 — interface mobile

versionCode3, mesmo certificado, Godot4.2.1 e assets. Acrescentado mobile/mobile_ui.gd, editor de controles e menu MOBILE no título/pausa. Configuração em user://mobile_settings.cfg, com gravação temporária e renomeação. Controles têm posição normalizada, escala0.65–1.5, opacidade0.25–1, texto até8caracteres e3estilos, além de presets padrão/espelhado/compacto. A edição pausa a árvore, desliga processamento do menu de pausa original temporariamente e esvazia ações dos TouchScreenButtons até encerrar. Preserva pausa anterior.

Desempenho e log ativáveis no menu, inicialmente ocultos. Painéis arrastáveis com X e posição persistida. FPS da engine, RSS de /proc/self/status quando permitido, tempo de quadro Performance.TIME_PROCESS e memória gráfica Performance.RENDER_VIDEO_MEM_USED quando disponível. Não são medições de utilização percentual CPU/GPU, que aparecem N/D. Coleta somente com painéis visíveis, a cada0.5s. Leitura de log limitada a8KiB, eliminando linha inicial parcial antes de decodificar UTF-8. Logging do runtime ativado, arquivos configurados em512KiB com retenção3.

17 verificações UI passaram, incluindo eventos GUI reais no atalho/X, arraste touch, salvar/cancelar, estilos, presets, movimento do painel e interrupção de coleta oculta. Regressão de gameplay e integração de abrir/editar/fechar pela pausa também passaram. Capturas são Linux/Mesa, não execução nem benchmark Android. Permanecem todos os limites de campanha/áudio real/compatibilidade nativa16KB do relatório inicial.

## Atualização v0.4 — skin pixel art, ergonomia e compatibilidade

versionCode4, mesmo runtime e certificado. Novo mobile/mobile_skin.gd desenha sprites pequenos de cada ação, com cores discretas, ampliação nearest e cache por ação/estilo/estado. Fonte original .fontdata usada sem modificar o arquivo. StyleBoxTexture com molduras pixeladas para menus, botões, abas, sliders, checks e painéis. Mapeamento de ações e progressão originais preservados; ícones mobile são próprios, não recursos originais fictícios.

Direcional TouchScreenButton.passby_press ligado apenas nas setas permite deslize; demais botões exigem pressionar. Layout padrão levanta ataques e desloca confirmar para não cobrir a barra de vida. Layouts salvos continuam; restaurar padrão aplica o novo posicionamento. Área segura Android convertida do espaço de tela para viewport, com fallback quando o retângulo informado é inválido. Controles/editor/painéis limitados à área segura. Validação de escala/alpha não finitos.

Painel de desempenho compacto com barra de FPS (escala60, limite atual do jogo), sem inventar utilização CPU/GPU. Log com quebra de linhas, congelamento, filtro de erros/avisos e contexto, opção de não seguir rolagem e cache por tamanho/data. Atualização normal0.5s ou econômica1s, sem amostragem oculta. Texturas/molduras em cache; propriedades dos controles só atualizadas quando necessárias; identificação de cena sem strings por frame. Nenhum ganho numérico de desempenho foi medido em Android.

26checks UI passaram: arraste, salvar/cancelar, layouts, cache/nearest, tema dos menus originais, deslize nativo entre setas, área segura simulada, rejeição de NaN/Inf, congelamento/filtro e testes anteriores. Regressão gráfica repetiu menu, tutorial, movimento, ataque, multitouch, pausa/retorno de foco e editor pela pausa. Avisos de recursos em uso ao encerrar e12texturas ausentes no EXE original permanecem. Sem dispositivo Android; compatibilidade16KB, campanha completa e áudio/desempenho reais seguem pendentes.

## Atualização v0.5 — vídeo

versionCode5, mesmo certificado. Novo mobile/mobile_video.gd controla limites60/90/120, mantém física60Hz, aplica VSync ligado em60 e desligado nos alvos superiores, e solicita fullscreen. Buffer real ampliado via RenderingServer mantendo Window em CANVAS_ITEMS e a transformação lógica de input; tamanho e transformação de desenho do backend reaplicados em frame_pre_draw. Isso evita mover /root/Scene para outra viewport ou alterar scripts/cenas originais. O teste usa a imagem lida da GPU para medir dimensões, pois get_width de ViewportTexture reporta o tamanho lógico/cached da engine. Capturas reais2560×1444 e3840×2166, conteúdo lógico500×282, cliques mantidos. Testes experimentais com modo VIEWPORT apresentaram glifos invertidos e foram descartados.

Prévia20s com confirmar/reverter; fechar menu reverte prévia pendente. Preferências só persistem ao confirmar. Flag de inicialização interrompida recupera nativo/60 no próximo boot. Interface ganhou posicionamento de menu e visibilidade dos controles nos menus. Métricas indicam alvo, buffer e Hz Android quando status nativo estiver disponível. Nenhuma promessa de novos detalhes de arte ou de desempenho4K120.

Activity com.godot.game.GodotApp estendida preservando inicialização da GodotActivity e tema do template (lookup também no namespace de recursos com.godot.game). Observa apenas mobile_display.cfg no diretório privado da aplicação, que coincide com user:// na engine Android4.2.1; usa APIs públicas preferredRefreshRate, preferredDisplayModeId e Surface.setFrameRate, com guardas de versão. Modos escolhidos mantêm a resolução física. Retorna taxa informada pelo Display em arquivo JSON privado. Handler/observador limpos ao destruir. Sem polling de thread e sem novas permissões. Não foi executada em Android.

Java compilado com SDK35/min21, D8 e dexlib2. AuditDex normaliza cada classe DEX individualmente e compara hash:2.109 classes originais idênticas; Activity substituída; total final2.114classes. Bibliotecas ARM64 oficiais intactas e ainda alinhadas4KB, sem resolução da pendência16KB. Assets2868retidos,2867byteidênticos, project.binary alterado e4scriptsmobile adicionados.

26checks UI +18checks vídeo e regressão de partida passaram em Linux/Mesa. Limitador medido no teste leve500×282:59.8468/90.0032/119.5743FPS. Queen após1s:170.00012/169.99966/169.99976, sem aceleração ao elevar renderização. Isso não testa todos os ataques/finais nem certifica60/90/120 no dispositivo. Partida capturada em3840×2166 e pausa/retomada nessa resolução passaram; sem benchmark de4K. Fullscreen e mudança física de Hz Android dependem de teste real e políticas do SO.

A revisão final da Activity usa DisplayManager.DisplayListener e uma leitura adiada para atualizar os Hz após a transição, evitando exibir indefinidamente o valor anterior à solicitação. Android físico segue pendente.
