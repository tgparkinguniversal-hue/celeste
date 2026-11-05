# Carro modular — Godot 4 — versão 0.2

Modelo lateral com 23 peças PNG substituíveis. Abra `project.godot`, edite `Carro.tscn` e execute `demo.tscn`. Validado na Godot 4.6.3 Compatibility. Não é ainda um jogo de direção ou uma simulação mecânica completa.

## Relações de montagem

- `Carro/Carroceria` sustenta o chassi, capô, para-brisa, lanternas e saia.
- `Carroceria/ConjuntoPorta` é o ponto de montagem comum da porta, do vidro lateral e do retrovisor. Desmontar a porta por `set_component_visible` remove o conjunto.
- `Carroceria/ConjuntoParaChoqueDianteiro` carrega o para-choque e seu farol auxiliar.
- `Carroceria/ConjuntoTampaTraseira` sustenta o vidro traseiro e o aerofólio do hatch.
- Cada roda tem `Montante`, que mantém a pinça fixa, e `Montante/Cubo`, que gira com o disco e o conjunto aro/pneu.
- O pneu é montado no mesmo conjunto do aro. Remover o aro pela API remove a roda montada, sem levar disco e pinça. O pneu também pode ser separado para serviço.
- O aro está ligado ao cubo, não ao sprite do disco. Remover o disco visualmente não desmonta os elementos que compartilham seu cubo.
- Escapamento, saia e para-choque traseiro ficam presos à carroceria, sem depender da porta ou das rodas.

Os pontos de fixação são nós `Node2D`; suas texturas ficam em filhos `Sprite2D`. Assim, trocar o recorte/offset de uma peça não desloca suas peças vizinhas. A transformação do ponto de fixação, por sua vez, acompanha os elementos nele montados.

Esta organização representa vínculos mecânicos em 2D. Não implementa ainda suspensão articulada, abertura de portas em perspectiva, parafusos, ferramentas ou regras de uma sequência de desmontagem de oficina.

## Código

```gdscript
var carro = preload("res://Carro.tscn").instantiate()
add_child(carro)
carro.set_component_visible(^"Porta", false) # porta, vidro e retrovisor
carro.set_component_visible(^"AroTraseira", false) # aro e pneu, freios ficam
carro.rotate_hubs(0.3) # disco/roda giram; pinça fica fixa
carro.restore_all() # restaura visibilidade e ângulo dos cubos
```

`component()` aceita o ID estável registrado em `parts_manifest.json`, o caminho novo ou o caminho antigo da versão 0.1. Para desmontar conjuntos, use a API, não apenas `Sprite2D.hide()`: ocultar diretamente um sprite serve para inspecionar somente aquela arte, sem aplicar a relação de montagem.

`replace_component(path, texture, offset)` troca apenas o sprite, preservando o ponto de fixação e os demais componentes. Ao trocar um aro, a sombra auxiliar original é desativada para não interferir com os raios da nova peça.

Os aros têm um filho auxiliar `SombraInterna`, que preserva a oclusão da imagem original sobre os freios. Não é uma peça mecânica adicional. Filtro Nearest, escala individual 1, PNGs transparentes, pivôs e posições em `parts_manifest.json`.

## Demonstração

Os controles permitem mostrar/ocultar conjuntos, isolar uma peça, remover rodas e restaurar a montagem. O isolamento visual é separado da desmontagem, permitindo examinar um retrovisor sem precisar exibir toda a porta. O projeto ainda não oferece inventário, compras, direção ou física.

APK: Android 7+, ARM64/ARMv7 e OpenGL ES 3.0; assinatura de desenvolvimento, offline. Windows: extraia o ZIP e execute o EXE x86-64; requer OpenGL 3.3. Não executados em Windows ou Android físicos nesta sessão.

## Verificação

- 23 peças carregadas e alinhadas nos pontos da base.
- Render da montagem versus `assets/master_clean.png`: zero pixels diferentes.
- Testes de deslocamento do suporte da porta, desmontagem de porta/para-choque/rodas, independência do disco e rotação do cubo com pinça fixa.
- `tools/test_relations.gd`, `tools/verify_scene.gd` e `tools/test_demo.gd` permitem repetir os testes.
- Os sprites do carro completo não são usados por baixo dos componentes. A referência limpa serve apenas à comparação.

As áreas ocultas de freios foram completadas; interiores do carro, ângulo oposto e outros modelos não estão incluídos. A vista é lateral e deriva da referência fornecida na conversa. Sem afiliação ao fabricante. Godot Engine: licença MIT em `GODOT-LICENSE.txt`.
