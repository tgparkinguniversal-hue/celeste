# Celeste Android — teste v0.9

[Baixar APK v0.9](https://raw.githubusercontent.com/tgparkinguniversal-hue/celeste/main/celeste-download/celeste-android-mobile-test-v0.9.apk)

Instale por cima da versão anterior, sem desinstalar. Mesmo ZIP de Content. Áudio FMOD e controles físicos mantidos.

## Novo touch

A = pular/confirmar; X = dash; LT/RT = agarrar; B = voltar; pausa no topo. Deslize de A para X para trocar salto por dash. Zonas de toque coincidem com os círculos. Em Opções de vídeo e controles mobile, escolha tamanho, opacidade e agarrar por toque (mantém agarrar até tocar novamente). Botão TOQUE oculta/mostra o overlay.

## Vídeo

Antes de iniciar o jogo, abra Opções de vídeo e controles mobile. Escolha apresentação em 60/90/120 FPS, saída nativa/720p/1080p/1440p/2160p e qualidade Original/Equilibrada/Desempenho. Salve e inicie COM ÁUDIO ou SEM ÁUDIO. Alterações aplicadas na próxima abertura do jogo. FPS depende do aparelho/SO. Simulação continua 60 Hz, sem interpolação de movimento; apresentar 120 frames não cria 120 estados físicos.

1440p e 2160p são resoluções de composição/saída, não artes refeitas: a pixel art interna original continua 320×180. Qualidade controla precisão de blur 9/5/3 amostras, mantendo efeitos e todo conteúdo. Fallback nativo caso o alvo não possa ser alocado.

LOG e FPS abrem painéis arrastáveis e fecháveis em ×. FPS mostra também frequência da lógica e saída atual. GPU permanece indisponível.

149 verificações locais passaram e a composição foi exercitada em OpenGL desktop por software nas cinco saídas, incluindo 4K. Não é medição de FPS Android nem validação completa da campanha.

## Dados

Os 1.211 arquivos originais continuam em 19 partes por limite do GitHub. [Página de downloads](https://tgparkinguniversal-hue.github.io/celeste/celeste-download/) reúne e verifica as partes em ZIP. Não extraia o ZIP; use Importar dados originais. Não precisa baixar novamente se já importou.

FMOD Studio — Firelight Technologies Pty Ltd. Runtime 1.10.20 integrado, atribuição no aplicativo e EULA embutida. SDK completo não redistribuído.
