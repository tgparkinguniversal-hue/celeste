# Celeste Android 1.0.0-rc1 — candidata a versão final

## Pacote e desempenho

Primeira compilação Release distribuída: C# otimizado, assemblies comprimidos/armazenados em assembly store, sem PDBs, debugger nativo, hot reload ou helper de debug. AndroidLinkMode=None e AOT desativado para preservar reflexão/serialização e a base funcional. APK 25.790.346 bytes (aprox. 26 MB), 72,26% menor que v0.14 (92.980.113 bytes). Isso mede download/armazenamento do pacote; não representa aumento medido de FPS ou redução equivalente da RAM em execução. Nenhum Content, banco FMOD, mapa, arte ou mecânica removido.

Mesmo package org.celeste.experimental.port e certificado anterior, versionCode 15, versionName 1.0.0-rc1. Configuração Release não é debuggable. A assinatura continua usando o certificado debug preexistente para permitir atualização em cima dos APKs já instalados; não é gestão de chaves de um lançamento comercial. build.sh android-release reproduz o perfil. Símbolos não vão no APK, portanto relatórios podem ter menos linhas de fonte; nomes/exceções/diagnóstico continuam.

## Compatibilidade e recuperação

Base mantida: ARM64, Android API 24+ e GLES 3.0. Preflight recusa GLES abaixo de 3.0 quando o Android fornece um valor conhecido. Informações locais de ABI/API/GLES/RAM disponível/total/low-RAM/page size ficam acessíveis no menu e no relatório. O botão Vídeo seguro ajusta nativo/60/desfoque Desempenho para a próxima partida, sem mexer em saves/touch. Opções de 90/120 e saídas até 4K continuam; simulação original 60 Hz sem interpolação.

Callbacks Android de memória crítica apenas sinalizam. Na próxima Update, a thread do jogo libera o target opcional de alta resolução e usa nativo; não descarrega assets, não elimina efeitos, não força GC e não persiste a redução por cima da preferência escolhida. Pressão de memória ainda pode encerrar o processo: essa defesa reduz a alocação opcional e não promete impedir todo OOM. Descrição de saída nativa passa a ser reutilizada enquanto o tamanho não muda, evitando construir uma string a cada frame. Fit/Present lidam com superfícies sem tamanho válido. Backdrop do launcher recria recursos ao ser reanexado. Falha ao criar/gravar logs de inicialização é capturada para não substituir a falha original por outra exceção de diagnóstico.

## Limite identificado: páginas de 16 KB

Auditoria ELF de todas as bibliotecas do APK: FMOD e xamarin-app têm alinhamento suficiente; seis bibliotecas do runtime .NET/Mono ainda têm PT_LOAD de 4 KB (lista em native-compatibility-rc1.json). Não há garantia de execução nativa em dispositivos 16 KB que exijam esse alinhamento. Modo de compatibilidade do sistema, quando disponível, não foi testado. Resolver de forma suportada requer migrar/recompilar o toolchain/runtime e repetir testes; alterar apenas números do ELF não é solução validada. Não é uma falha atribuída ao FMOD. A instalação pode falhar antes de abrir a tela de diagnóstico nesses aparelhos. Não há APK de 32 bits nem certificação Mali/Adreno universal.

## Evidência

- 199 checks passaram em Debug e Release (quatro novos para dimensões inválidas).
- Seis checks do patch MonoGame (cinco blends e rejeição de valor inválido).
- Sete casos gráficos desktop/Mesa: saídas 720/1080/1440/2160/nativa, fallback forçado por limite de GPU e fallback por pressão de memória simulada. Cena original intro carregou e apresentou pixels visíveis em todos os casos. Sem benchmark ou execução Android nesta prova.
- APK ZIP íntegro, zipalign 4, assinatura v2/v3, mesmo certificado, FMOD nativo binariamente inalterado, classe Java FMOD e licença presentes. Sem PDBs/debugger/hot reload no APK.
- Auditoria de conteúdo v0.14 e provas anteriores de 27 salas iniciais continuam evidência anterior; campanha completa Android não foi exercitada.

## Encerramento da validação

Campanha A/B/C/Farewell, cutscenes, áudio rítmico, saves, sessão prolongada, controles/reconexão e retomada desta Release precisam ser testados em aparelho. Checklist manual e exportação de relatório permanecem; resultados anteriores conservam sua versão. Compatibilidade 16 KB e matriz de outros celulares continuam pendentes. Essa candidata consolida implementação e verificações disponíveis; estado de versão final estável depende dos resultados reais, sem marcar testes pendentes como aprovados.

Instalar por cima, exportar backup fora do app e usar o Content já importado. Não desinstalar para atualizar. Começar por nativo/60 e comparar configurações depois. Em caso de regressão Release, preservar relatório e progresso; APKs anteriores continuam disponíveis, mas downgrade pode ser bloqueado pelo Android e não se deve desinstalar para contornar sem backup.
