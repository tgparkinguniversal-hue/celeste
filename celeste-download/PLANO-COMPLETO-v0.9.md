# Plano de conclusão e melhoria do port Android de Celeste

Referência: v0.9-mobile-test, versionCode 9, 24/10/2026. Dispositivo principal: POCO F7, Snapdragon 8s Gen 4, 12 GB, Android API 36 observado no relatório. Este plano substitui a descrição técnica do plano inicial; relatórios antigos continuam como histórico. Prioridades podem mudar com novos relatórios do aparelho. As versões futuras citadas abaixo são marcos propostos, não entregas já implementadas nem promessas de prazo.

## 1. Estado e objetivo

Objetivo: preservar conteúdo, história, mapas, mecânicas, áudio e aparência do Celeste PC 1.4.0.0, adaptando plataforma e controles para Android. Não é preciso recriar as fases incluídas; é preciso validar sua execução e corrigir incompatibilidades. Otimizações devem manter uma opção Original, sem reduzir ou remover conteúdo para esconder falhas.

Implementado: boot original, renderização MonoGame/GLSL, importação de Content com catálogo/hashes, touch, controles HID, FMOD Android, logs, métricas básicas, opções de apresentação/saída/blur. Fonte de referência recuperada preservada separadamente.

Evidência no aparelho: usuário confirmou funcionamento geral da v0.8 depois de integrar FMOD e alterar controles; apontou dash/agarrar especificamente no touch. v0.9 publicada com ajustes touch e vídeo, ainda sem novo resultado do usuário. Isso não certifica toda música, todo controle ou toda campanha.

Evidência local: 149 checks selecionados; parser lê 27 mapas/824 salas; início dos 27 mapas/lados renderizado em OpenGL desktop por software; provas da fase em cinco saídas, incluindo 4K. Não equivale a jogar 824 salas no Android, nem a provar 120 FPS, fidelidade integral, todos os saves ou todos os drivers.

Limites atuais: 120 apresentações com lógica 60 Hz e sem interpolação; saídas 1440p/2160p preservam pixel art interna 320×180; qualidade muda precisão de blur, não representa um pacote de texturas novo; indicador FPS conta Draw concluído, não uma medição independente do compositor; utilização da GPU indisponível.

## 2. P0 — Estabilidade da base e relato reproduzível

- Preservar v0.8 e v0.9 como alternativas; usar APK/versionCode distintos, mesma identidade/chave para atualizar sem apagar dados.
- Vincular cada APK ao código, patch, toolchain, hashes de dados/shaders/bibliotecas e resultados de verificação. Não atualizar um binário já entregue mantendo o mesmo nome/versão.
- Fazer instalação limpa e atualização com dados/saves existentes; verificar recuperação após falha e retomada da importação.
- Corrigir textos de diagnóstico antigos (por exemplo, rótulo residual sem áudio no manifest-fonte) quando necessário; conferir o manifest final, sem presumir que o rótulo da Activity é o de todos os componentes.
- Classificar cada problema com passos, capítulo/sala, versão, configuração, entrada, resultado esperado e log. Corrigir primeiro crash, bloqueio de progresso, perda de save e entrada presa.
- Revisar exceções de suporte nos caminhos realmente utilizados. Grid/ColliderList setters e Grid.Collide(Grid), Camera.Right/Bottom setters e Atlas/formato não suportado contêm throws. Comparar à referência e provar alcance antes de chamar de bug ou implementar semântica nova; parte pode ser limitação intencional do original. BinaryFormatter permanece bloqueado para uso legado não necessário ao save XML.

Aceite: o APK abre/reabre, atualiza e retorna do background sem crash ou perda de dados; todo bloqueio observado tem correção/regressão verificável. Zero erros no build, avisos relevantes classificados, não necessariamente todos os avisos herdados eliminados.

## 3. P0 — Touch confiável antes de expandir a interface

- Testar A, X, LT/RT, direcional/analógico, pausa e voltar em menus e fases; medir também bordas dos botões, dedos rápidos e pequenas telas.
- Testar direção + pulo + dash + agarrar, diagonais de dash, trocar A -> X pelo mesmo dedo, dois ombros simultâneos e soltar apenas um dedo.
- Validar agarrar segurando e por toque, stamina/escalada, queda, morte, respawn, transição, cutscene e input desabilitado. Não habilitar dash antes de quando o jogo original permite.
- Validar cancelamento por chamada/notificação, gestos Android, tela bloqueada, troca de app, esconder TOQUE e reconexão de controle. Nenhum comando pode ficar preso.
- Confirmar cutouts, barras, proporção e escala em todas as opções de tamanho/opacidade. Aumentar área de toque somente com geometria consistente e sem sobreposição ambígua.

Aceite: usuário completa um trecho com salto/dash/escalada de modo repetível; todas as combinações acima funcionam, inclusive depois de suspensão. Criar testes do bug concreto, não apenas repetir a fórmula de implementação.

## 4. P0 — Saves, backups e progressão

- Exercitar SaveData real, criação/seleção de slots, nome, capítulo, checkpoints, mortes, morangos, fitas, corações, assistência e progresso B/C/Farewell. Os checks XML atuais não provam toda essa progressão no telefone.
- Salvar, fechar normalmente, encerrar processo pelo sistema, reabrir e atualizar APK mantendo estado. Não presumir gravação garantida durante morte do processo; garantir consistência do último commit de save.
- Auditar gravação temporária/rename/flush e recuperação de backups com dados corrompidos ou espaço insuficiente. Manter arquivo original e diagnóstico, sem sobrescrevê-lo silenciosamente.
- Adicionar exportar/importar saves via SAF, com versão, validação, backup anterior e tratamento claro de conflito. Não misturar saves ao diretório Content ou exigir acesso amplo ao armazenamento.
- Explicar que desinstalar remove dados privados e oferecer backup antes de operações destrutivas. Android allowBackup está false no manifest atual; isso torna a exportação manual especialmente importante.

Aceite: matriz de progressão sobrevive a reabertura/atualização, save inválido é recuperável e usuário consegue exportar/importar um backup real.

## 5. P0 — Fidelidade da campanha, história e mecânicas

Manter uma matriz de cobertura por capítulo/lado/sala: não iniciado, abriu, visitado, concluído, comparado à referência, problema aberto. Os 27 testes de primeira sala não devem marcar um capítulo inteiro como concluído.

Validar na ordem:
1. Prólogo e Cidade Abandonada: tutorial, movimentos básicos, checkpoint, morte/respawn, fim da fase e continuar.
2. Local Antigo e Resort: dream blocks, perseguições, elevadores, poeira, NPCs e cutscenes.
3. Pico Dourado e Templo: vento, plataformas, bolhas, espelhos, seekers, Theo e transições.
4. Reflexão e Cume: penas, água, chefe Badeline, sequências longas e encerramento.
5. Epílogo e Núcleo: estados quente/frio, lava/gelo e desbloqueios.
6. Todos os lados B/C, salas de fita e Farewell: blocos de ritmo, jellyfish, pufferfish, mecânicas avançadas e sequências finais.

Cruzar isso com morangos, corações, fitas, colecionáveis especiais, diálogo/idiomas, journal, pico-8, assistência/variantes e speedrun timer, conforme conteúdo da versão original. Testar desbloqueio legítimo e fim de jogo; atalhos/debug apenas em cópias de saves de teste, sem alterar o progresso do usuário.

Aceite: campanha e extras do escopo concluídos no Android, sem bloqueios conhecidos; discrepâncias visuais/temporais restantes listadas explicitamente. Não declarar 100% por contagem de arquivos ou por ausência de crash inicial.

## 6. P1 — FMOD além de simplesmente produzir som

- Registrar versão do runtime carregado e resultado dos sete bancos, eventos, loops, transições e memória. Header C# 0x11014 e runtime SDK 0x11020 são patches distintos da linha 1.10; não chamar de idênticos.
- Comparar música/SFX, volumes, parâmetros, snapshots, reverb, fade, underwater, panorâmica/listener e sons posicionais com a referência.
- Testar ritmo das fitas, transições/cutscenes e pausas. O gerenciador de blocos usa relógio do jogo; isso não elimina a necessidade de sincronizar a música que o acompanha.
- Testar alto-falante, fone com fio/USB quando disponível e Bluetooth; mudança de saída durante o jogo, áudio de outro aplicativo e perda/retomada de foco.
- Tratar foco de áudio Android e interrupções com política previsível; validar mixer suspend/resume e encerramento, inclusive ao alternar COM/SEM ÁUDIO.
- Medir carregamento/streaming/decodificação antes de mudar bancos, canais ou buffers. Ajustar latência/buffers só com medidas de underrun e comparação; não atualizar FMOD nem reconstruir bancos sem prova de compatibilidade.
- Manter atribuição e licença do runtime no aplicativo. Se houver migração futura, manter bancos originais até a nova rota ser validada.

Aceite: músicas, efeitos e sincronização preservados nas cenas da matriz, sem travar/ficar mudo após retomada ou mudança de saída; sem crescimento contínuo de memória/handles em ciclos de abertura.

## 7. P1 — Gráficos, efeitos e resoluções

- Comparar capturas PC/Android em iluminação, sombras, bloom, color grading, distorção, glitch, reflexos, montanha 3D, neve, partículas, wipes e HUD; usar mesmo trecho/estado e controlar animação/aleatoriedade ao comparar.
- Verificar todos os efeitos/técnicas realmente usados em cenas tardias, não apenas os treze arquivos carregarem. Testar preshaders, matrizes, samplers, stencil/depth e precisão GLES.
- Validar saída nativa/720p/1080p/1440p/2160p, qualidade 9/5/3 amostras, proporção, alinhamento da pixel art, textos, pico-8, espelho da assistência e menus.
- Exercitar recriação do contexto gráfico, background, reaberturas e mudanças de configuração; detectar recursos perdidos, texturas negras e vazamentos de RenderTarget.
- Confirmar fallback real quando alocação falhar e mostrar resolução efetiva, não apenas a solicitada. Medir memória do alvo 4K e custo do passe extra de composição.
- Avaliar perfis separados para qualidade/pixel scaling se houver demanda, mantendo Original como referência. Não vender saída 4K como texturas 4K ou render interno do gameplay redesenhado.

Aceite: composição correta em cenas representativas e retorno seguro à configuração estável; nenhuma opção muda câmera, colisões, tamanho das fases ou disponibilidade de conteúdo.

## 8. P1 — Desempenho medido e otimizações

Primeiro medir no POCO, depois alterar. Separar carregamento de gameplay, processo frio de execução aquecida e debug de build release.

- Capturar frame times, mediana, percentis 95/99, 1% low, engasgos, RAM PSS/picos, alocações/GC, CPU do processo, tempo de carga, consumo/temperatura quando disponíveis e clock/estado térmico por APIs autorizadas.
- Correlacionar Draw do app com apresentação real quando houver ferramenta compatível. Usar Perfetto/ADB/profiler numa sessão autorizada; não inventar GPU%, VRAM ou FPS do compositor se não disponíveis.
- Orçamentos de referência: 16,67 ms em 60 FPS, 11,11 ms em 90 e 8,33 ms em 120. Avaliar gargalos CPU/GPU e irregularidade, sem prometer 4K120 sustentado.
- Iniciar com nativa/1080p60 Original como referência, depois nativa120, 1440p60/120, 4K60/120 e 720p60 Desempenho. Ampliar para combinações adicionais se houver diferença, evitando testar todo produto cartesiano sem objetivo.
- Usar cenas leves e pesadas: montanha/menu, Resort, Templo/espelhos, chefe, Cume com neve e Farewell. Rodadas iniciais de 2–5 minutos; sessão de 30–60 minutos nas configurações sustentáveis para investigar throttling e crescimento de memória.
- Otimizar as alocações dominantes, carga/decodificação de texturas, cache de estados, uniformes/preshaders CPU, mudanças de alvo, passes redundantes e logging por frame somente após perfil. Evitar mudanças na ordem de atualização/colisão ou cortes de entidades/partículas para ocultar gargalos.
- Avaliar AOT, linking e release stripping em experimento separado: custo de APK/inicialização/RAM, reflexão, serialização, JNI e callbacks FMOD precisam de regressão. Não ligar trimming agressivo de uma vez.

Aceite: ganho medido no mesmo cenário/configuração, sem regressão funcional/visual e sem aquecimento ou memória progressivamente piores. Publicar o perfil recomendado como resultado de medição, não como garantia prévia.

## 9. P1/P2 — 120 Hz e fluidez visual

- Confirmar preferência de refresh, frame pacing, VSync, economia de bateria/HyperOS e taxa efetivamente alcançada. Mostrar alvo vs medido.
- Verificar que movimento, dash, queda, plataformas, timers, cutscenes, música, stamina e input permanecem equivalentes a 60 Hz de lógica para cada frequência de apresentação, inclusive frames atrasados.
- Testar pausa/resume e catch-up sem aceleração. Auditar efeitos/rotinas que alterem estado durante Render, porque desenhar duas vezes por atualização pode revelar efeitos dependentes da frequência.
- Interpolação visual é uma etapa opcional de pesquisa: separar estados anterior/atual, câmera, entidades, cabelo, partículas e HUD sem escrever estado interpolado na física; considerar descontinuidades em teleporte, morte, dash, cutscene e pixel snapping. Medir latência adicionada e preservar opção desativada.

Aceite da base: apresentação estável com lógica original. Aceite de interpolação, se implementada: suavidade perceptível sem colisões/tempos diferentes, sem ghosting e sem contaminar estado do jogo. Interpolação não é requisito para corrigir bugs básicos nem prova de port completo.

## 10. P2 — Controle físico e acessibilidade

- Matriz física: Xbox, DualShock 4, DualSense e genéricos identificados; Bluetooth e USB quando disponíveis. Incluir conectados antes/depois do boot, remover/reconectar e alternar dispositivos.
- Validar botões, sticks, hat/dpad, gatilhos de intervalo 0–1/-1–1, stick drift, inversão e conflitos com dispositivos virtuais. Não presumir todo genérico compatível pelo nome.
- Interface de diagnóstico/remapeamento persistente, restauração de padrão e ícones Xbox/PlayStation selecionáveis ou detectados com fallback claro. Manter mapeamento original disponível.
- Vibração/rumble só onde houver API e hardware verificados, com desligamento na pausa/desconexão. Não anunciar suporte apenas por uma chamada retornar sem erro.
- Melhorar acessibilidade touch: reposicionar botões, canhoto, perfis, tamanho mínimo, contraste, opacidade, restaurar layout e configuração por orientação. Manter opções de assistência originais separadas das opções de plataforma.

Aceite: combinações fundamentais funcionam nos modelos testados e incompatibilidades restantes são identificáveis/remapeáveis, sem comando preso ou perda da opção touch.

## 11. P2 — Interface, Android e instalação

- Tornar vídeo/touch acessíveis também durante o jogo, com explicação de aplicação imediata vs reinício. Fazer transações gráficas apenas no thread/contexto correto, com confirmação/retorno à configuração anterior quando houver mudança problemática.
- Melhorar feedback do importador: progresso em bytes/arquivos, duração estimada só quando mensurável, espaço necessário/temporário e limpeza segura. Validar interrupção, ZIP errado, falta de espaço e dados corrompidos.
- Simplificar entrega do ZIP: o navegador atualmente reúne 19 partes em memória. Investigar fluxo com gravação incremental suportada, alternativa por computador ou importação por partes no app, com retomada e hashes. Não considerar o site uma solução robusta só porque funcionou uma vez.
- Avaliar pacote único/apk+dados apenas conforme limites reais de distribuição/armazenamento; evitar duplicar gigabytes na atualização ou exigir permissões amplas.
- Tratar gestos Voltar, fullscreen, cutout, dialogs, idioma PT-BR, texto legível, toque acidental, economia de energia e destruição do processo. Separar jogo de serviços desktop que não fazem sentido na UI mobile.
- Polir LOG/FPS: mover também os atalhos, guardar posição, limpar/exportar, rolagem útil, limite do arquivo persistente, distinguir métricas reais/estimadas/indisponíveis e registrar build/configuração/sala sem credenciais ou identificadores desnecessários.

Aceite: instalar/atualizar/configurar/importar/jogar/exportar relatório e saves é compreensível no celular, com recuperação das falhas comuns.

## 12. P2 — Build, manutenção e distribuição

- Versionar o código/adaptações de forma revisável no destino adequado, preservar originais imutáveis e os arquivos locais existentes; o repositório de entrega atual contém principalmente binários, não deve ser tratado automaticamente como fonte de build completa.
- Documentar e automatizar bootstrap do .NET/Android/JDK, patch MonoGame, shaders e SDK necessário, com versões/hashes e licenças preservados; verificar build em ambiente limpo.
- Renovar patch/manifesto de alterações frente à referência para não depender de relatórios obsoletos. Atualizar instruções persistentes do ambiente quando o estado mudar.
- Planejar migração de toolchain/target API em versão separada com regressão, considerando Android recente, bibliotecas nativas e páginas 16 KB. ELF alinhado não basta: conferir zip alignment/instalação no aparelho. Foco atual continua ARM64/POCO; compatibilidade ampla é outra etapa.
- Passar para build release testado e chave persistente de assinatura com armazenamento seguro, preservando um caminho de migração dos saves. Trocar chave não é uma atualização transparente do APK de debug atual; prever exportação/novo pacote ou procedimento compatível.
- Melhorar hospedagem de artefatos e checksums; muitos APKs e dados grandes acumulam histórico Git. Releases continuam com histórico de erro de autenticação no upload; resolver a integração antes de adotar como entrega. Nunca publicar link antes de conferir arquivo, tamanho e resposta.
- Manter SDK FMOD completo fora da entrega; preservar atribuições do runtime e demais componentes. Delimitar direitos/escopo antes de ampliar distribuição ou comercialização; isso não é impedimento técnico para os testes já autorizados.

Aceite: uma versão pode ser reconstruída, identificada, instalada e recuperada sem depender da memória da conversa; diferenças em dados/toolchain são explícitas.

## 13. Marcos propostos

| Marco | Resultado esperado | Condição para avançar |
|---|---|---|
| A — Base confiável | Touch v0.9 validado, saves/backup, ciclo de vida e relatório reproduzível | Sem crash/perda de progresso nos fluxos básicos |
| B — Beta da campanha | Progressão principal e mecânicas por capítulo no aparelho, FMOD/efeitos comparados | Campanha principal concluída; cobertura publicada |
| C — Extras e desempenho | B/C/Farewell, benchmarks e presets sustentáveis | Sem bloqueios; ganhos medidos sem cortes de conteúdo |
| D — Acabamento | Layout editável, remapeamento/ícones, instalação e backup amigáveis | Uso contínuo sem suporte manual para tarefas comuns |
| E — Candidato estável | Build reproduzível/release, distribuição e regressão final | Lista de problemas materiais resolvida ou limites declarados |

Não vincular todos os itens a um único APK gigante. Preferir incrementos pequenos com hipótese, mudança, verificação e possibilidade de voltar à versão anterior. Datas dependem dos resultados no aparelho e da quantidade de correções encontradas; não existe estimativa honesta de conclusão só a partir de arquivos incluídos.

## 14. Próxima rodada concreta

1. Receber resultado da v0.9 no POCO: dash/hold/toggle de grab, FPS medido junto com frequência da lógica, resolução efetiva e configuração usada.
2. Reproduzir/corrigir qualquer problema de controle/pausa antes de otimizações adicionais.
3. Implementar e validar exportação/importação de saves e testes de progressão/reabertura.
4. Registrar benchmarks de referência nativa/1080p60 e nativa120; comparar depois 1440p/4K.
5. Iniciar matriz de campanha por Prólogo/Cidade e avançar por capítulos, corrigindo os casos reais encontrados.

Definição de concluído: conteúdo do escopo jogável e validado de ponta a ponta no Android, progresso confiável, entrada previsível, áudio/efeitos comparados e desempenho sustentado documentado. Ter arquivos, compilar ou abrir o menu não basta.
