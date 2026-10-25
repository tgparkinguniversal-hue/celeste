# The Dark Queen of Mortholme — teste Android v0.1

[Baixar APK — aproximadamente 93 MB](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/mortholme-download/mortholme-android-test-v0.1.apk)

Os dados já estão dentro do APK. Não precisa importar ZIP ou OBB. É aplicativo separado do Celeste. ARM64, Android API 21+, OpenGL ES 3, target 33; compatibilidade real ainda precisa teste em aparelho.

Viabilidade alta: Godot 4.2.1 original, scripts GDScript recuperáveis, recursos preservados, sem dependência FMOD. Primeiro APK com runtime Android da própria engine. As 2.868 entradas originais foram mantidas; 2.867 permanecem byte a byte e project.binary recebeu ajustes de plataforma. Acrescentados controles touch, sem substituir cenas/arte/diálogos por recriação.

- Setas: movimentação e navegação.
- I: ataque básico; II: investida; III: magia, conforme desbloqueio original.
- OK: confirmar/avançar diálogos após o texto terminar.
- Botão superior direito: pausa.

Testado em Linux/Mesa: menu, início, diálogo, movimento, ataque e pausa/retomada por eventos dos botões. Ainda sem execução Android ou campanha completa. O arquivo recebido já referencia 12 texturas ausentes do pacote. Godot 4.6 precisa adaptação no plugin de diálogo; esta versão mantém 4.2.1. Compatibilidade nativa com páginas de 16 KB permanece pendente. [Análise completa e limites](ANALISE-ANDROID.md), [auditoria do APK](apk-audit.json).

Capturas do teste desktop, com interface touch: [menu](title-mobile.png), [partida](game-action.png). Créditos e recursos do jogo original preservados. Compilação experimental com assinatura de teste; não representa lançamento oficial.
