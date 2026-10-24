# 1.0.0-rc2 — ferramentas removíveis e ZIP otimizado

## Tela livre

FPS, LOG e layout antes de jogar permite desativar “Mostrar ferramentas na partida (barra, LOG e FPS)”. Isso oculta toda a barra e os dois painéis, sem deixar alça, × ou botão flutuante. O × da própria barra aplica e salva essa escolha imediatamente. Atalhos LOG/FPS/TOQUE/EDITAR/configurações podem ser ocultados individualmente; largura/padding da barra se ajustam. Os × dos painéis continuam fechando apenas o respectivo painel.

Para reativar em uma fase, abra Pausa → Ferramentas mobile. Essa entrada abre as mesmas preferências sem exigir a barra; jogo fica pausado e comandos touch são limpos. Também pode reativar no launcher antes de Jogar. Não adiciona entrada em menus mínimos de confirmação. A ação mobile é ligada somente no Android e removida no destroy; o desktop não ganha botão sem esse callback.

Mostrar controles touch ao iniciar é uma preferência separada, padrão ativada. Desativá-la é adequado a quem usa controle físico. Para tela só com o jogo: ferramentas desativadas e touch inicial desativado. No jogo, TOQUE continua alternando temporariamente os controles; não altera a preferência de abertura. Reativação das ferramentas depende de acessar o menu inicial ou pausar com o controle quando touch está escondido.

Quando ferramentas estão ocultas ou ambos os painéis fechados, não ficam callbacks periódicos de atualização; contadores do monitor também param. Captura do log diagnóstico mantém ring buffer limitado para exportação. Nenhuma mecânica/fase/arte/áudio removido.

## ZIP sem perdas

ZIP original: 893.967.893 bytes. Novo ZIP: 865.649.644 bytes. Economia: 28.318.249 bytes (3,17%). Descompactado continua 1.158.620.133 bytes, 1.211 arquivos. Recompressão DEFLATE nível 9 por entrada; mantém stream original quando ele é menor. Sem conversão ou alteração de bancos/texturas, sem remover idiomas/arquivos. Cabeçalhos/diretório ZIP reconstruídos no formato padrão, com nomes UTF-8 e CRC. SHA-256 do ZIP completo: fe80432cb0e50ae84f3255dc1b543e9ee67279a195ee7e7aeef2e93131267ae8.

Verificação pós-gravação em Python e independentemente em .NET ZipArchive: hashes SHA-256 e tamanhos dos 1.211 arquivos conferem com catálogo original. 19 partes têm hashes próprios; página reúne em ordem em um ZIP. O importador atual aceita esse formato, sem mudar catálogo. Se já tem Content importado, só atualizar APK; não precisa reimportar para obter recursos novos, pois arquivos são idênticos.

Página usa armazenamento temporário OPFS do navegador quando disponível, em vez de manter todo o ZIP em ArrayBuffers. Cada parte de 45 MiB ainda é verificada em memória antes de gravar. Não prometer pico exato de RAM. Alternativa em memória continua; limpeza do cache é manual depois do download para não invalidá-lo em andamento. ZIP anterior e partes originais preservados em legacy-download.html/parts.json. A cópia local derivada do ZIP antigo foi removida após verificar que as 19 partes originais o reconstruíam byte a byte (SHA original 0068169de076e2840647294ced492d3c2a3d2852e15f182aeb9c8e2512147457); RAR original e jogo extraído preservados. Instruções de reconstrução em artifacts/*.REBUILD.md.

## Verificações e limites

199 checks existentes reexecutados (Debug e Release); build Android zero erros/52 avisos. Cinco checks do módulo de transferência: ordem/bytes, hash inválido, tamanho inválido, HTTP e falha de escrita. Seis checks em Chromium headless com ZIP pequeno: elementos ocultos, OPFS/bytes, limpeza, modo memória/bytes, corrupção recusada e ausência de erro JavaScript. Isso não é teste de download completo no Android. Assinatura v2/v3, zipalign, versão 16, integridade ZIP, licenças e runtimes FMOD binariamente preservados conferidos.

Release de aprox. 26 MB, mesmo package/certificado anterior. Validação física da interface e do menu de pausa nesta versão ainda pendente; sete provas gráficas RC1 e auditorias anteriores permanecem evidência anterior. Campanha completa e suporte nativo 16 KB do runtime seguem pendentes, conforme notas RC1. Não declarar estabilidade final universal.

A cópia do site Pages exclui somente payloads grandes de Celeste (APKs/partes), pois todos esses downloads usam raw.githubusercontent.com; evita incluir vários GB no site. Arquivos continuam no Git. Download público de todas as 19 partes foi realizado e os hashes bateram. Leitura direta do domínio github.io neste ambiente retornou 403; página foi exercitada localmente em Chromium com fixture, sem afirmar certificação do deploy/Android completo.
