# Canine — novo ciclo de caminhada v09

Prévia visual separada da versão jogável 0.7. A caminhada foi reconstruída com oito poses de corpo em sequência, reproduzidas a 12 quadros por segundo. As poses de corpo foram geradas a partir da aparência aprovada; a cabeça usa um único recorte da imagem aprovada, com textura e escala constantes. O recorte do pescoço e a linha de apoio dos sapatos são registrados por quadro. O ciclo antigo de deformação de malha fica preservado em walk-preview/ e não é usado aqui.

O vídeo mostra a pose parada, caminhada para a direita, pausa e retorno para a esquerda. A velocidade da demonstração é 300 unidades de tela por segundo, com câmera acompanhando. A captura é de 60 FPS fixos, sem áudio, e não é benchmark. Qualidade e ritmo da nova animação ainda aguardam avaliação do usuário; não há nova versão executável ou integração no jogo nesta etapa.

Para abrir, use Godot 4.2.1 em walk-keyframes-v09/project.godot. O banco frames.res está incluído. Para reconstruí-lo, execute bake.gd pela engine; o arquivo de verificação usa um caminho de relatório deste ambiente que pode ser ajustado localmente.
