# Canine — revisão visual

Pose base aprovada pelo usuário: base-pose-v08-head.png. As imagens anteriores ficam preservadas como histórico.

## Caminhada experimental

walk-preview/ é um projeto Godot 4.2.1 separado da versão jogável 0.7. Usa a imagem aprovada como textura de uma malha contínua, com articulações de pernas calculadas por IK, influência suave de braço e deslocamento do corpo. A cabeça recebe apenas translação, mantendo o rosto, as orelhas e suas proporções. Não utiliza a montagem por recortes das versões 0.6/0.7.

A demonstração contém pose parada, passos para a direita, uma pausa para virar e passos para a esquerda. A prévia atual usa 8× a cadência e o deslocamento iniciais (dobro da anterior), dentro da engine. O enquadramento acompanha a personagem e a grade do chão mostra o deslocamento. O movimento ainda depende de avaliação visual do usuário. O teste de malha confere a pose de repouso, a rigidez da cabeça e triângulos invertidos durante 90 amostras; isso não certifica a qualidade artística nem o apoio perfeito dos pés.

Não há nova build executável, integração com física ou alterações na versão jogável nesta etapa. Corrida, agachamento, salto e deslizamento aguardam validação da caminhada.

Para abrir: Godot 4.2.1 → walk-preview/project.godot. A imagem original aprovada fica intacta em approved.png. Vídeo gravado na engine a 60 FPS fixos, sem áudio; não é benchmark.
