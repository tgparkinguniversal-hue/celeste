# Android v0.14 — editor touch e validação por aparelho

## Editor

Avisos de sobreposição usam os mesmos centros e raios efetivos do hit test (escala individual × escala global). Salvar com sobreposição pede confirmação; não bloqueia layouts intencionais. Lista de sete controles permite selecionar e arrastar botões encobertos; a seleção é destacada no preview. Arraste preserva distância entre dedo e centro; acompanha somente o pointer inicial e para quando esse pointer sai/cancela. Outros dedos não deslocam o botão selecionado. Espelhar inverte posições horizontais mantendo nomes/ações; padrão, cancelar e salvar permanecem. Draft/seleção vão para Bundle ao recriar Activity; não é persistência de draft após force-stop. Preferência de escala é carregada uma vez no editor, em vez de a cada passo do slider.

## Checklist manual

Menu Checklist de testes neste celular contém 23 itens: abertura, touch/combinações, agarrar, layout, controles/reconexão, saves/backup, bloqueio/segundo plano, respawn, transições, áudio/ritmo, colecionáveis/história, lados A/B/C/Farewell, efeitos, sessão longa e vídeo. Pendente/Passou/Falhou são declarações do usuário, não testes automáticos. Resultado alterado recebe versão 0.14; itens inalterados mantêm a versão registrada. Para repetir um status idêntico em uma versão nova, primeiro salvar como Pendente, depois registrar o resultado. Checklist é local por instalação e incluído em Exportar relatório; sem upload automático. Não integra o ZIP de saves.

## Auditoria estática e limites

195 checks locais passaram (oito novos de sobreposição, escala global, espelhamento e persistência). Build Android zero erros/52 avisos. UI/editor/multitouch real e checklist ainda não executados em aparelho nesta sessão. Auditoria independente inventariou 27 mapas/824 salas, 56.440 entidades, 1.274 gatilhos e 178 nomes de tipos. Nenhum case de Level removido/adicionado versus baseline recuperado imutável. player é tratado como spawn em LevelData; theoCrystalHoldingBarrier (15 ocorrências) também não tem case no baseline, não foi inventado novo comportamento. Essa comparação não prova equivalência binária completa, renderização ou gameplay. Ver content-audit-v0.14.json e VALIDACAO-v0.14.md.

VersionCode 14, mesmo package/chave/Content e FMOD. Sem fase, arte ou mecânica removida. Instalar por cima; manter ZIP atual. Builds de teste, campanha/compatibilidade ainda sem certificação. Assinatura v2/v3, integridade ZIP e versionCode 14 conferidos antes da publicação; FMOD binariamente inalterado.
