# Canine — pernas contínuas v10

Prévia experimental separada da versão jogável. A sequência v09 trocava poses de corpo que não preservavam a função de cada perna entre quadros. Esta revisão usa duas pernas persistentes, de comprimento constante, com trajetória contínua de apoio e avanço. Os sapatos usam um recorte fixo da mesma arte; não há troca de imagens nas pernas. A calça é desenhada geometricamente ao longo dos segmentos e ainda precisa de avaliação de acabamento visual.

Durante o apoio, a posição local do pé compensa o deslocamento do corpo, mantendo-o parado no mundo. O avanço usa uma curva suave, elevação do pé e IK de dois segmentos. A cabeça aprovada é preservada; tronco e roupa usam uma única pose com um balanço discreto do braço. O vídeo mostra caminhada nos dois sentidos com captura fixa a 60 FPS, sem áudio; não é benchmark.

A conferência numérica mediu 4.804 amostras de pés, deriva de apoio inferior a 0,001 px, comprimentos de pernas constantes e fechamento contínuo das trajetórias. A conferência renderizada inspecionou 48 poses: nenhuma peça desconectada nem parte abaixo do piso. Esses testes não certificam o acabamento artístico ou uma animação de giro. A inversão de direção da prévia ainda é o espelhamento usado em jogos 2D.

Abra walk-continuous-v10/project.godot em Godot 4.2.1. approved_frames.res contém a arte de referência usada pelo projeto. Caminhos de relatórios nos scripts de teste podem ser ajustados para outro computador. A caminhada ainda não está integrada no jogo.
