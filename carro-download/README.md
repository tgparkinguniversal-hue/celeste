# Carro modular — Godot 4

Este pacote contém uma cena real, montada a partir de peças PNG independentes. A imagem do carro inteiro é uma referência de validação; ela **não é usada como um sprite inteiro por baixo das peças**.

## Abrir

1. Importe `project.godot` na Godot 4 (validado na 4.6.3, renderizador Compatibility).
2. Abra `Carro.tscn` para editar o modelo. Arraste essa cena para seu jogo para instanciar o carro completo.
3. Execute o projeto (F6 em `demo.tscn` ou F5) para ocultar peças, isolar o chassi e remover os aros.

Nenhum APK ou jogo de corrida está incluído: este é o modelo modular e sua demonstração de encaixe.

## Estrutura

```text
Carro (Node2D, grupo: carro)
├── Chassi (Sprite2D)
├── Capo (Sprite2D)
├── Porta (Sprite2D)
├── ParaChoqueDianteiro (Sprite2D)
├── ParaChoqueTraseiro (Sprite2D)
├── SaiaLateral (Sprite2D)
├── Aerofolio (Sprite2D)
├── Retrovisor (Sprite2D)
├── Escapamento (Sprite2D)
├── Vidros (Node2D)
│   ├── VidroLateral (Sprite2D)
│   ├── VidroTraseiro (Sprite2D)
│   └── ParaBrisa (Sprite2D)
├── Luzes (Node2D)
│   ├── FarolDianteiro (Sprite2D)
│   ├── LanternaTraseira (Sprite2D)
│   └── PiscaLateral (Sprite2D)
└── Rodas (Node2D)
    ├── RodaTraseira (Node2D)
    │   ├── Pneu (Sprite2D)
    │   ├── Disco (Sprite2D)
    │   ├── Pinca (Sprite2D)
    │   └── Aro (Sprite2D)
    │       └── SombraInterna (Sprite2D auxiliar)
    └── RodaDianteira (mesma estrutura)
```

São **23 peças substituíveis**, todas com textura própria em `assets/parts/`. Os dois nós auxiliares de sombra dos aros não são peças adicionais: preservam as sombras originais que os aros projetam sobre os freios. Ocultar um aro oculta sua sombra e deixa o disco e a pinça visíveis. O chassi não contém pneus, aros, para-choques, saia, aerofólio, porta ou vidros embutidos.

## Encaixe

- Uma única base de desenho, em vista lateral, foi usada para todos os recortes. Não há peças redesenhadas em ângulos diferentes.
- O tamanho original é preservado; nenhum filho recebeu escala individual para caber no carro.
- As posições foram obtidas das coordenadas dessa mesma base, não estimadas ao montar uma prancha.
- Texturas usam filtro **Nearest**, fundo transparente e `centered = false`.
- `parts_manifest.json` registra arquivo, posição, retângulo na base, pivô e caminho do nó de cada peça.
- Os pivôs das rodas estão nos cubos. Mantenha a pinça fixa ao simular rotação; não gire o grupo inteiro da roda com a pinça junto.
- Áreas de alfa quase invisível da imagem gerada foram limpas para impedir halos. A comparação usa a referência limpa incluída no pacote, `assets/master_clean.png`.
- Discos e trechos de pinça que ficavam ocultos pelos aros foram completados atrás deles. A sobreposição mantém a montagem original.

O pacote conserva as superfícies visíveis dessa vista lateral. Não contém interiores completos, vista oposta, 3D, carro em outros ângulos ou catálogo de peças alternativas. Ao criar outra peça, use o mesmo ponto de encaixe e a mesma escala; uma nova arte de tamanho diferente precisa informar seu novo deslocamento.

## Usar no código

```gdscript
var carro = preload("res://Carro.tscn").instantiate()
add_child(carro)

carro.set_component_visible(^"Aerofolio", false)
carro.set_component_visible(^"ParaChoqueDianteiro", false)
carro.set_component_visible(^"Rodas/RodaTraseira/Aro", false)
carro.restore_all()
```

Para trocar uma textura:

```gdscript
carro.replace_component(
    ^"Rodas/RodaDianteira/Aro",
    preload("res://meu_aro.png"),
    Vector2(-91, -91) # Exemplo: aro de 183 × 183 com o cubo no centro.
)
```

O método remove a sombra auxiliar do aro original ao trocar sua textura. Se trocar o aro diretamente no Inspector, oculte ou substitua também o seu filho `SombraInterna`; a sombra antiga pode não corresponder aos novos raios. A demonstração permite ocultar e mostrar peças; ainda não implementa inventário, compras, física ou um jogo de customização completo.

## Verificações

`previews/validation.json` registra o teste feito na Godot 4.6.3:

- 23 peças carregadas, com PNGs separados.
- Posições e tamanhos conferidos contra o manifesto.
- Escala individual igual a 1.
- Montagem renderizada comparada à base limpa: **zero pixels diferentes**.
- Remoção de bodykit, isolamento do chassi, remoção dos aros e restauração da montagem.

Pré-visualizações também foram renderizadas pela cena, não geradas como outra interpretação do carro.

Para repetir: `godot --path . --script res://tools/verify_scene.gd` (requer renderização gráfica). Para reconstruir os recortes e a cena, execute `tools/split_master.gd` pela Godot e depois `python3 tools/build_scene.py`. O script Python apenas serializa os nós e suas posições; não desenha ou modifica imagens.

Arte criada a partir da referência visual enviada na conversa. O modelo é ilustrativo de um Nissan 180SX; sem afiliação ao fabricante.
