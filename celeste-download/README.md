# Celeste Android — 1.0.0-rc1

[Baixar APK — aproximadamente 26 MB](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/celeste-download/celeste-android-1.0.0-rc1.apk)

Candidata a versão final, versionCode 15. Instale por cima da versão anterior, sem desinstalar. Dados e saves mantidos; se Content já está importado, não precisa baixar/importar de novo.

## Novidades

- Compilação Release com assemblies comprimidos e componentes de depuração excluídos: pacote 72% menor, sem remover conteúdo do jogo. FPS/RAM em aparelho ainda sem benchmark desta versão.
- Botão Vídeo seguro — nativo / 60 FPS, para recuperar uma configuração gráfica problemática.
- Sob aviso crítico de memória do Android, libera a saída opcional de alta resolução e retorna a nativo na thread do jogo. Assets permanecem.
- Diagnóstico local de compatibilidade e relatório com API/ABI/GLES/RAM/page size.
- Menos alocações da descrição de saída por frame, guardas para superfícies inválidas e recuperação do backdrop ao reanexar.

Continuam áudio FMOD, campanha/assets originais, controles físicos/touch, editor com posição/tamanho/espelhamento/avisos de sobreposição, OSD FPS/CPU/RAM/gráfico, log, backup/restauração e checklist manual. GPU aparece N/D sem contador confiável. Preferências de abertura de painéis ficam em FPS, LOG e layout antes de jogar.

## Compatibilidade e limites

ARM64, Android 7/API 24+, OpenGL ES 3.0. **Suporte nativo a páginas de 16 KB ainda pendente:** seis bibliotecas do runtime .NET/Mono têm alinhamento de 4 KB. FMOD está alinhado; não prometer execução em todo Android recente. [Auditoria ELF](native-compatibility-rc1.json).

Apresentação até 120 FPS com simulação 60 Hz sem interpolação; saída até 4K mantém pixel art interna original. Testar inicialmente nativo/60. Demais aparelhos/GPU e campanha completa desta Release ainda precisam validação física. Não há certificação universal.

199 checks passaram em Debug e Release, sete provas gráficas por software e assinatura/integridade do APK verificadas. Isso não substitui jogar a campanha. [Notas completas](ANDROID-1.0.0-rc1.md) e [matriz de conclusão](VALIDACAO-1.0.0-rc1.md).

## Progresso e teste

Exporte backup do progresso para fora do app antes de testar. Restauração aceita ZIP exportado pelo recurso de saves, separado do ZIP de Content; valida e confirma antes de substituir. Não inclui layouts Android, estatísticas locais ou checklist.

No menu Checklist de testes neste celular, registre Pendente/Passou/Falhou apenas para o que foi testado. Resultados são manuais e incluem versão. Exporte relatório após falha com capítulo/sala e ação que a provocou. Não há upload automático.

Para instalação nova, a [página de downloads](https://tgparkinguniversal-hue.github.io/celeste/celeste-download/) reúne as 19 partes do ZIP original; preparação exige memória no navegador. Não extraia o ZIP antes de importar.

Mesmo certificado anterior para atualizar em cima; chave debug de teste, não de lançamento comercial. FMOD Studio — Firelight Technologies Pty Ltd, licença integrada. SDK completo não redistribuído. [Plano de conclusão](PLANO-COMPLETO-v0.9.md). Versões anteriores preservadas.
