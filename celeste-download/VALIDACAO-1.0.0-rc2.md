# Validação do port — 1.0.0-rc2

Este documento separa evidência automática e teste físico. Nenhuma caixa de gameplay foi preenchida automaticamente. A confirmação anterior do usuário demonstra trechos funcionando no POCO F7, não todos os capítulos.

## Evidência disponível

- 199 checks de dados, bindings, layout, saves e importação em host, executados em Debug e Release.
- Sete provas gráficas RC1 em Mesa/software, incluindo fallback por pressão de memória simulada.
- Pacote Release de 25.790.346 bytes, assinatura/integridade verificadas; nenhuma execução Android da Release nesta sessão.
- Auditoria ELF identificou seis bibliotecas .NET/Mono com alinhamento de 4 KB. Suporte nativo 16 KB pendente.
- Sete verificações adicionais de monitor com serviços Android stubados (v0.11).
- Prova anterior de carga/desenho da sala inicial de cada um dos 27 mapas, em OpenGL desktop por software; não reexecutada nesta versão.
- Auditoria v0.14: 27 mapas, 824 salas, 56.440 entidades, 1.274 gatilhos; nenhum case de Level perdido versus baseline.
- FMOD Android integrado, usuário confirmou funcionamento geral anteriormente; cobertura de bancos/cenas segue pendente.

## Matriz de campanha

Carregamento inicial desktop é evidência anterior e limitada à primeira sala. Pendência não significa bug confirmado. Preencher a matriz por mapa após testes reais; checklist do aplicativo registra resumo por família A/B/C/Farewell.

| Mapa | Salas | Inicial desktop anterior | Progressão Android | Áudio/ritmo Android | Progresso salvo Android |
|---|---:|---|---|---|---|
| 0-Intro.bin | 7 | Verificado | Pendente | Pendente | Pendente |
| 1-ForsakenCity.bin | 38 | Verificado | Pendente | Pendente | Pendente |
| 1H-ForsakenCity.bin | 16 | Verificado | Pendente | Pendente | Pendente |
| 1X-ForsakenCity.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 2-OldSite.bin | 45 | Verificado | Pendente | Pendente | Pendente |
| 2H-OldSite.bin | 17 | Verificado | Pendente | Pendente | Pendente |
| 2X-OldSite.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 3-CelestialResort.bin | 65 | Verificado | Pendente | Pendente | Pendente |
| 3H-CelestialResort.bin | 24 | Verificado | Pendente | Pendente | Pendente |
| 3X-CelestialResort.bin | 4 | Verificado | Pendente | Pendente | Pendente |
| 4-GoldenRidge.bin | 49 | Verificado | Pendente | Pendente | Pendente |
| 4H-GoldenRidge.bin | 20 | Verificado | Pendente | Pendente | Pendente |
| 4X-GoldenRidge.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 5-MirrorTemple.bin | 85 | Verificado | Pendente | Pendente | Pendente |
| 5H-MirrorTemple.bin | 25 | Verificado | Pendente | Pendente | Pendente |
| 5X-MirrorTemple.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 6-Reflection.bin | 64 | Verificado | Pendente | Pendente | Pendente |
| 6H-Reflection.bin | 28 | Verificado | Pendente | Pendente | Pendente |
| 6X-Reflection.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 7-Summit.bin | 107 | Verificado | Pendente | Pendente | Pendente |
| 7H-Summit.bin | 29 | Verificado | Pendente | Pendente | Pendente |
| 7X-Summit.bin | 3 | Verificado | Pendente | Pendente | Pendente |
| 8-Epilogue.bin | 4 | Verificado | Pendente | Pendente | Pendente |
| 9-Core.bin | 39 | Verificado | Pendente | Pendente | Pendente |
| 9H-Core.bin | 23 | Verificado | Pendente | Pendente | Pendente |
| 9X-Core.bin | 4 | Verificado | Pendente | Pendente | Pendente |
| LostLevels.bin | 113 | Verificado | Pendente | Pendente | Pendente |

## Ordem de teste no celular

1. Atualizar sem desinstalar; exportar backup dos saves para fora do app.
2. Conferir seleção, deslocamento, escala, avisos, espelhar, cancelar, salvar e reabrir editor. Testar lista com dois controles sobrepostos.
3. Jogar com três dedos: direção + agarrar + pular/dash. Testar movimento diagonal, deslize pular/dash, soltar todos os dedos e retomar após bloquear.
4. Avançar/salvar, sair/reabrir e conferir slot. Exportar backup atualizado antes de testar restauração antiga. Não apagar progresso para simular corrupção manualmente.
5. Testar áudio e input após tela bloqueada, troca de app, Bluetooth e reconexão de controle.
6. Comparar nativo/60 primeiro. Só então testar 90/120 e saídas maiores; anotar configuração, tempo de uso, FPS e travamentos. Não presumir que 4K/120 é adequado.
7. Avançar a campanha e marcar checklist somente do que foi testado. Exportar relatório após qualquer falha, com descrição da sala/capítulo e ação que a provoca.

## Critérios para chamar de completo

Campanha A/B/C/Farewell e finais concluídos sem bloqueios; saves/backup/reabertura exercitados; áudio e desafios rítmicos conferidos; controles físicos/touch verificados; efeitos comparados; sessões prolongadas e matriz de dispositivos/GPU com resultados registrados. Perfil Release reproduzível no toolchain atual; certificado debug mantido para atualização. Gestão de assinatura de lançamento e migração do runtime para suporte nativo 16 KB pendentes. Não prometer desempenho universal nem percentual real de GPU sem suporte.

## RC2

199 checks reexecutados; ZIP otimizado com 1211 hashes verificados em Python/.NET; cinco checks módulo JS e seis Chromium com fixture. Menu de pausa/Ferramentas mobile, ocultação total/individual e preferência touch inicial ainda precisam teste Android. Gráficos RC1 são evidência anterior; matriz de campanha mantém pendências.
