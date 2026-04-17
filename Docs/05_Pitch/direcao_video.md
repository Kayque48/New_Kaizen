# 🎬 Direção de Vídeo — SonicGuard Pitch
**GP SENAI 2026 · NewKaizen**
**Duração total:** ~3 minutos | **Formato:** MP4, horizontal 16:9

---

## Princípios gerais

- **Rosto aparece apenas em momentos humanos** — abertura, impacto e fechamento. O meio do vídeo é dominado por simulação e imagem. Rosto e projeto nunca competem na mesma tela.
- **Sem música de fundo.** O silêncio entre frases é intencional e deve ser preservado na edição.
- **Sem efeitos de transição elaborados.** Corte seco entre cenas ou fade to black simples. O projeto é industrial — a estética acompanha.
- **Textos na tela apenas para números e termos técnicos.** Fonte limpa, branca, fundo escuro semitransparente. Aparece junto com a fala, some depois.

---

## Cena 1 — Abertura `0:00 – 0:25`

### Formato
Rosto na câmera — sem apoio visual.

### Setup de gravação
- Câmera: celular em tripé, altura dos olhos, enquadramento dos ombros pra cima
- Fundo: parede lisa escura, ou ambiente industrial desfocado
- Iluminação: luz frontal suave — sem sombra pesada no rosto
- Sem logo, sem texto na tela

### O que acontece
Porta-voz olha direto pra câmera. Fala as três frases com peso.

Pausa real de 1 segundo antes de *"A NewKaizen veio mudar isso."*

A frase final é dita com calma — não com urgência.

### Nota de edição
Não cortar a pausa. Ela é parte da cena.

---

## Cena 2 — Problema `0:25 – 0:55`

### Formato
Voz em off + imagens do processo real.

### Setup de gravação
- Gravar a narração em áudio separado (pode ser no mesmo take da cena 1, editado depois)
- Usar fotos da pasta `Docs/08_Imagens/processo/` — 01 a 11
- Sequência sugerida de imagens: operador com EPI → tampa aberta → interior incandescente → lança d'água → operador em postura de risco

### O que acontece
Voz narra por cima das imagens. Cada imagem fica na tela por 4 a 6 segundos. Corte no ritmo das frases — não no meio delas.

Na frase *"700 mil reais. Todo mês"* — congela a última imagem e sobrepõe o texto:

```
R$ 700.000
todo mês
```

Texto aparece palavra por palavra, junto com a fala. Some após 3 segundos.

### Nota de edição
Se as fotos reais não puderem ser usadas por restrição do regulamento — substituir por texto animado sobre fundo preto. O impacto se mantém.

---

## Cena 3 — Solução `0:55 – 1:35`

### Formato
Voz em off + gravação de tela — Visão Lateral (Processing).

### Setup de gravação
- Abrir `Visao_Lateral.pde` em fullscreen (tecla F no Processing ou ajustar janela)
- Gravar com OBS Studio ou gravador de tela nativo
- Resolução mínima: 1280×720
- Iniciar a simulação antes de começar a gravar — deixar partículas se acumulando por 20 segundos antes de cortar pro pitch

### O que acontece
Simulação rodando — partículas depositando nas paredes, incrustação crescendo. Voz narra por cima.

Na frase *"Com som"* — acionar o ciclo de buzina na simulação. A banca vê as partículas caindo em tempo real.

Na frase *"o pó vai embora, a mesa fica"* — pausar a simulação num frame limpo, canal com baixa incrustação. Segurar por 2 segundos antes de continuar.

### Nota de edição
Não acelerar a simulação. O ritmo real dela é o ritmo certo.

---

## Cena 4 — Diferencial técnico `1:35 – 2:00`

### Formato
Voz em off + gravação de tela — Visão Superior (Processing).

### Setup de gravação
- Abrir `Visao_Superior.pde` em fullscreen
- Configurar slider "Simultâneas" em 6 antes de gravar
- Gravar com OBS / gravador de tela

### O que acontece
Simulação mostrando os dois triângulos — 3 buzinas amarelas em cada cuba — rotacionando a cada passo. Voz narra por cima.

**Overlay de texto — três momentos:**

1. Na frase do triângulo → texto na tela:
```
3 por cuba · triângulo equilátero
cobertura omnidirecional
```

2. Na frase do Inconel → texto na tela:
```
Inconel 625
mesmo material de turbinas de aviação
```

3. Na frase da pressão → câmera move para o gauge no painel inferior da simulação, mostrando a agulha em ~375 mBar, longe da linha vermelha de 700 mBar. Texto na tela:
```
25 mBar · 7% da margem de segurança
```

### Nota de edição
Este bloco é o mais rápido do vídeo. Não deixar a simulação parada — ela precisa estar em movimento o tempo todo. Os overlays de texto aparecem e somem em 2 segundos cada.

---

## Cena 5 — Valor de negócio `2:00 – 2:25`

### Formato
Voz em off + dashboard IoT (`sonicguard_dashboard.html`) **ou** texto animado sobre fundo escuro.

### Opção A — Dashboard (recomendada)
- Abrir `sonicguard_dashboard.html` no navegador em fullscreen (F11)
- Gravar a tela com OBS
- Deixar o dashboard rodando — ciclos incrementando, gauge se movendo

### Opção B — Texto animado (se não houver tempo)
Fundo preto. Números aparecem um a um conforme são falados:

```
R$ 280.000 – 320.000
───────────────────
payback < 15 dias
───────────────────
R$ 8.000.000 / ano
```

### O que acontece
Voz narra os números. Cada número aparece na tela junto com a fala.

Na frase *"menos de 15 dias"* — pausa de 1 segundo. É o momento mais forte do bloco.

### Nota de edição
Não colocar os três números na tela ao mesmo tempo. Aparecem em sequência, um por vez.

---

## Cena 6 — Impacto humano `2:25 – 2:45`

### Formato
Rosto na câmera — sem apoio visual.

### Setup de gravação
- Mesmo setup da Cena 1
- Pode ser gravado no mesmo take — editar depois

### O que acontece
Volta o rosto do porta-voz. Tom mais suave que o resto do vídeo.

*"Ele não é substituído. Ele é promovido."* — dito olhando direto pra câmera, sem corte, sem texto na tela.

### Nota de edição
Não colocar nenhum elemento visual de apoio nesta cena. O rosto é o apoio. Qualquer imagem aqui compete com a frase mais humana do pitch.

---

## Cena 7 — Fechamento `2:45 – 3:00`

### Formato
Rosto na câmera → corte para logo estático.

### Setup de gravação
- Mesmo setup das cenas 1 e 6
- Preparar tela final com logo NewKaizen e texto *"SonicGuard · GP SENAI 2026"* em fundo preto

### O que acontece
Porta-voz fala as últimas duas frases olhando direto pra câmera.

Na última palavra — *"operação"* — corte seco para tela preta com:

```
[logo NewKaizen]

SonicGuard
GP SENAI 2026
```

Fica parado por 2 segundos. Fade to black. Fim.

### Nota de edição
Não colocar música no final. Não colocar efeito de saída. O silêncio depois de *"está pronto para entrar em operação"* é intencional.

---

## Resumo de produção

| Cena | Formato | Ferramenta | Prioridade |
|:---|:---|:---|:---|
| 1 · Abertura | Rosto | Celular + tripé | Alta |
| 2 · Problema | Fotos + texto | CapCut / DaVinci | Alta |
| 3 · Solução | Visão Lateral | OBS + Processing | Alta |
| 4 · Diferencial | Visão Superior | OBS + Processing | Alta |
| 5 · Valor | Dashboard ou texto | OBS / CapCut | Média |
| 6 · Impacto | Rosto | Celular + tripé | Alta |
| 7 · Fechamento | Rosto + logo | CapCut / DaVinci | Alta |

---

## Ordem de gravação recomendada

1. **Gravar rosto primeiro** — cenas 1, 6 e 7 em sequência, mesmo setup, mesma sessão
2. **Gravar simulações** — Visão Lateral e Superior com OBS, em fullscreen
3. **Gravar dashboard** — `sonicguard_dashboard.html` no navegador
4. **Montar no editor** — encaixar áudio, imagens e overlays de texto
5. **Revisar timing** — conferir se cada bloco respeita a janela de tempo

---

## Checklist antes de gravar

- [ ] Celular carregado e em modo avião (sem notificações)
- [ ] Tripé na altura dos olhos
- [ ] Fundo limpo e sem distração
- [ ] Processing rodando sem lag — fechar outros programas
- [ ] OBS configurado para gravar em 1080p 30fps
- [ ] Dashboard aberto no navegador em fullscreen
- [ ] Script impresso ou em segundo monitor — não olhar pro script durante a gravação do rosto
- [ ] Gravar ao menos 3 takes de cada cena de rosto

---

#pitch #direção #sonicguard #gp-senai-2026 #newkaizen #produção
