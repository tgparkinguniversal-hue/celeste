# The Dark Queen of Mortholme — teste Android v0.2

[Baixar APK — aproximadamente 93 MB](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/mortholme-download/mortholme-android-test-v0.2.apk)

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
