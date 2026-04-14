### 1. Introdução ao Processo na Unidade de Matozinhos (MG)

A Lhoist Matozinhos utiliza **fornos verticais regenerativos do tipo Maerz PFR** (Parallel Flow Regenerative) para produzir cal calcítica (CaO) a partir da calcinação do carbonato de cálcio (CaCO₃).

Os **Forno 4** e **Forno 5** são idênticos em tecnologia:

- Dois eixos (cubas) verticais interligados por um **canal cruzado de conexão**.
- Cada cuba possui **33 lanças verticais** de injeção de combustível.
- Alimentação em bateladas (contínua com inversão de fluxo a cada 10-15 minutos).
- Capacidade típica: produção contínua com alta disponibilidade operacional.

**Por que a Lhoist escolheu fornos Maerz?** A Maerz é líder mundial em fornos de cal com **eficiência térmica de até 85 %** (a mais alta do mercado). Principais razões documentadas pela própria Lhoist e Maerz:

- Consumo térmico extremamente baixo (~850 kcal/kg de cal).
- Recuperação regenerativa de calor (gases quentes da cuba em queima pré-aquecem a cuba regeneradora).
- Flexibilidade com granulometria ampla (25–100 mm).
- Produção de cal de alta reatividade (>360 ml) e baixo CO₂ residual (<2,5 %).
- Compatibilidade com combustíveis de baixo poder calorífico, como o **LDG** (subproduto da siderurgia local).
- Redução de emissões e custos operacionais (Lhoist relata ganhos de até 54 % de eficiência em upgrades de fornos antigos para Maerz PFR).

Esses fornos são ideais para a Lhoist porque a planta de Matozinhos recebe LDG diretamente de usinas siderúrgicas próximas, tornando o processo econômico e sustentável.

---

### 2. Explicação do Combustível LDG (Conceito Difícil)

**LDG = Linz-Donawitz Gas** (gás de conversores LD).

É o gás residual gerado na **aciaria** durante o sopro de oxigênio puro nos conversores (onde o ferro-gusa vira aço).

**Composição típica:**

- CO (combustível real): 30–60 % (varia muito).
- CO₂ e N₂ (gases inertes): até 70 % do volume.

**Características críticas (explicadas no PDF):**

- Poder calorífico inferior (PCI): **1500 a 2500 kcal/Nm³** (muito baixo comparado ao gás natural ~9.000 kcal/Nm³).
- Variação constante de qualidade (depende do momento do sopro no conversor).
- Medido online por calorímetro CWD 2000 (Lhoist usa este equipamento).

**Impacto no processo:** Como o LDG tem muita “água no vinho” (gases inertes), é preciso **injetar maior volume** de gás para manter a energia necessária → pressões mais altas no forno quando o PCI cai (conforme Figura 08 do PDF). Os gases inertes saem quentes (~140 °C) sem liberar energia, roubando calor do sistema → perda energética calculada via lei de Newton de resfriamento (ver Tabela 04 do PDF).

**Vantagem para a Lhoist:** é um combustível **barato e “verde”** (reaproveitamento de subproduto siderúrgico), mas exige fornos robustos como o Maerz, que lidam bem com variações de PCI.

---

### 3. Estrutura Interna dos Fornos 4 e 5 (Relevante para o Desafio)

Cada forno tem **duas cubas** conectadas por canal cruzado.

**Zonas principais (tempo total de residência ~36 h):**

1. **Pré-aquecimento** (superior): 5–6 h → calcário de 20 °C para >750 °C.
2. **Calcinação/Queima** (meio): contato direto com chama das 33 lanças por cuba.
3. **Resfriamento** (inferior): ar soprado resfria a cal até ~100 °C e reaproveita calor.

**Canais de limpeza (Poken In Doors):**

- Forno 4 → **36 portas** (18 por cuba).
- Forno 5 → **48 portas** (24 por cuba).
- Dimensões: 300 mm diâmetro × 470 mm profundidade (limitador de ângulo).
- Material incrustado: pó fino fundido que obstrui canais, acima dos pilares e região central do fosso (1–5 m de profundidade, variação angular 120°).
- Limpeza manual com lança ½" + água a ~3,5 bar (exatamente o que o desafio descreve).

**Por que se forma incrustação?**

- Material fino (<40 mm) + granulometria irregular → compactação + fusão parcial.
- LDG com impurezas → deposição de poeira fina nas paredes refratárias.

---

### 4. Imagens Extraídas do PDF (Descrições Visuais para o Projeto)

**Figura 01: Sistema de funcionamento do forno Maerz** (Diagrama clássico PFR com duas cubas, canal cruzado, temperaturas: entrada 20 °C, pré-aquecimento 750 °C, queima 1.200 °C, saída da cal 100 °C). _Mostra claramente os canais de conexão e zonas de queima – essencial para projetar robô de limpeza._

**Figura 02: Cuba em queima** (Esquema com 33 lanças verticais injetando LDG de forma homogênea + painel de controle). _Indica posição das lanças e região central onde ocorre maior acúmulo._

**Figura 03: Ar de resfriamento das lanças** (Foto real + diagrama das lanças de refrigeração). _Mostra o ambiente térmico extremo onde a limpeza manual ocorre._

**Figura 04: Captação de gás LDG** (Esquema da aciaria → conversor → lavador → forno Maerz).

**Figura 09: Mangotes de injeção de LDG** (Foto real das mangueiras flexíveis que alimentam as lanças).

**Figura 10: Obstrução de mangotes** (Foto de mangote entupido – ilustra exatamente o tipo de incrustação que se forma também nos canais).

**Figura 11: Pressão no processo por bancada de calcário** (Gráfico mostrando pressões 250–318 mbar – quando o forno trabalha com pressão alta, incrustação aumenta).

_(Todas as imagens acima estão no PDF original fornecido. Recomendo inserir as capturas originais no arquivo Markdown final.)_

---

### 5. Conceitos Difíceis Explicados (para Equipe de Automatização)

|Conceito|Explicação simples|Relevância para o desafio|
|---|---|---|
|**Regeneração**|Uma cuba queima enquanto a outra usa o calor dos gases para pré-aquecer o calcário|Alternância de fluxo exige que limpeza não pare o forno|
|**Fluxo paralelo**|Chama e material descem juntos na zona de queima|Evitar dano ao refratário durante jato de água|
|**Poken In Doors**|Portas de inspeção/limpeza com tampa de 20 kg + cunha|Ponto exato para robô ou lança automatizada|
|**PCI do LDG**|Energia real do gás (varia 1500–2500 kcal/Nm³)|Quando PCI cai → mais volume de gás → mais poeira/incrustação|

---

### 6. Relevância Direta para o Desafio “Como Podemos”

O desafio descreve perfeitamente a **sobrecarga ergonômica** da limpeza manual:

- Abertura de tampa de 20 kg com marreta de 5 kg.
- Flexão de tronco + extensão de ombros repetida.
- Exposição a >100 °C + EPI térmico (macacão JGB, luvas Korion, botas).
- Frequência: Forno 4 (2×/semana) × Forno 5 (a cada 15 dias).

**Objetivo da automatização (baseado no PDF):**

- Remover 100 % do material incrustado acima dos pilares e região central **sem agredir o refratário**.
- Eliminar exposição humana ao calor e esforço físico.
- Manter ângulo de 120° e profundidade até 5 m.

**Sugestões iniciais de solução (a serem desenvolvidas):**

- Robô de lança telescópica guiado por câmera térmica + jato de água controlado por PLC.
- Sistema de abertura automatizada das tampas (atuadores pneumáticos).
- Integração com supervisório do forno (monitorar PCI do LDG e pressão para prever acúmulo).
- Uso de drone interno ou braço robótico fixo em cada poken in door (48 no Forno 5).

---

**Referências**

- PDF interno Lhoist (2021) – “Processo de Calcinação da Cal Calcítico em Fornos Maerz”.
- Maerz Ofenbau AG – Documentação técnica PFR.
- Lhoist global – Relatos de upgrades PFR (ganho de 54 % eficiência).