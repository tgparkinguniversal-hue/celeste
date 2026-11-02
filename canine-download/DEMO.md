# Demonstração Canine 0.1

[Baixar / assistir MP4](canine-demo-v0.1.mp4)

16 segundos, 1280×720, H.264, vídeo gravado a 60 fps. Sem áudio: esta versão do jogo não tem sons.

Um agente por regras envia comandos ao controlador original. Mostra parado, caminhada, corrida, deslizar, agachar e sete saltos ao longo do cenário, sem reposições ou teletransportes. Não usa modelo de aprendizado. Movimento e câmera são renderizados pelo jogo; não é vídeo gerado por IA.

Gravação contínua com Godot Movie Maker. A engine Linux 4.2.1 carregou o pacote de recursos embutido no executável Windows v0.1. Isso demonstra os mesmos scripts e recursos, sem constituir execução nativa Windows ou benchmark de FPS. O HUD mostra desempenho do renderizador Linux por software; a gravação usa tempo de simulação fixo.

Código de controle da demonstração: demo_agent.gd. Nenhuma mudança no executável distribuído.
