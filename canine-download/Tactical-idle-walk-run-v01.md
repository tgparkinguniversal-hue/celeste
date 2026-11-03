# Personagem tático — prévia v01

Demonstração automática em uma direção isométrica (baixo-direita), com parado, caminhada e corrida. Não é uma build jogável nem a animação completa das oito direções.

O personagem é renderizado em uma superfície real de 64×64 pixels e ampliado com filtro nearest. Capacete, tronco, mãos e arma usam o mesmo desenho da folha de referência. As pernas são articuladas com geometria sombreada e botas extraídas da mesma arte, sem troca de quadros. As mãos e a arma permanecem no mesmo conjunto durante a inclinação do corpo. A roupa das pernas ainda depende de avaliação de acabamento visual.

Pés em apoio mantêm posições fixas no mundo; o avanço usa curvas suaves e IK de dois segmentos. Na corrida aumentam velocidade, frequência, elevação dos pés e inclinação; há intervalos com ambos os pés em avanço. As animações ainda aguardam avaliação visual e precisam ser expandidas às demais direções.

Abra project.godot em Godot 4.2.1 para reproduzir a demonstração. O vídeo contém 18 segundos a 60 FPS fixos, sem áudio; não é um benchmark. check.gd confere continuidade e alcance dos membros no roteiro. render_check.gd confere enquadramento e componentes visuais em poses de teste. Os testes não substituem avaliação artística.
