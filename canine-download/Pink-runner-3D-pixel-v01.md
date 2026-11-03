# Corrida — base 3D renderizada em pixel art v01

Primeira interpretação da imagem estática enviada pelo usuário: personagem de cabelo rosa, casaco roxo, short claro e botas altas escuras em corrida lateral. Como não há vídeo de referência, a coreografia, o tempo e o movimento secundário são propostos; não é uma reprodução exata de um ciclo original.

Modelo original em Blender 4.3.2, armature de membros rígidos com comprimentos constantes, trajetória de pernas por IK e braços por IK tridimensional. Cabelo e abas do casaco são malhas contínuas animadas com atraso de fase. Câmera ortográfica fixa, paleta plana e renderização nativa de 256×160 pixels, ampliada por nearest para a prévia. O arquivo .blend é autocontido.

O ciclo tem 36 quadros únicos a 60 FPS, duração de 0,6 s. O MP4 repete-o por 9,6 s; o GIF usa 30 FPS para visualização. Não há áudio ou integração com um jogo nesta etapa. O arquivo de validação confere fechamento das malhas, comprimento dos ossos e enquadramento; não certifica semelhança artística com a referência.

Abra pink_runner.blend no Blender e reproduza os quadros 1–36. O quadro 37 fecha o ciclo e coincide geometricamente com o primeiro. create.py reconstrói e renderiza o projeto usando um caminho de saída deste ambiente, que pode ser ajustado em outro computador. validate.py confere o projeto aberto. frames/ contém os PNGs nativos com fundo; para exportar transparência, ajuste o render no Blender.
