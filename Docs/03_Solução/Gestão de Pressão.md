# ⚠️ SonicGuard — Gestão de Pressão no Canal

> **Contexto:** A buzina sônica injeta ar comprimido (4–6 bar) dentro de um canal que opera pressurizado (até 350 mBar em funcionamento). Com até 6 buzinas simultâneas, a pergunta crítica é: **esse ar injetado não vai acumular pressão perigosa no canal?**
>
> **Resposta curta:** Não. O canal tem ~122 m³ de volume — grande o suficiente para absorver o ar injetado com variação mínima de pressão. O pior caso absoluto usa apenas **13,7% da margem de segurança disponível**.
>
> **Decisão de projeto:** O SonicGuard opera **exclusivamente com o forno em funcionamento** — nunca durante paradas. O fluxo ativo de gases é o principal dissipador de pressão, e essa decisão resolve o problema na raiz.

---

## 🎯 Por que operar com o forno ligado resolve tudo

Quando o forno está em funcionamento:

- O **soprador está ativo** — há fluxo contínuo de gases circulando pelo canal
- Esse fluxo cria um **caminho natural de saída** para o ar injetado pela buzina
- O pulso de 10 segundos a 4–6 bar se **dissolve no fluxo existente** sem acúmulo
- A pressão interna se mantém no range normal de operação (**≤ 350 mBar**)
- A chapa de explosão (700 mBar) **nunca é ativada**

> Em outras palavras: o forno ligado já tem seu próprio sistema de gestão de pressão — o SonicGuard apenas aproveita isso. Os cálculos abaixo assumem o **pior cenário estático** — sem dissipação pelo fluxo — e portanto são **conservadores** em relação à operação real.

---

## 🏗️ Geometria do Canal — Base do Cálculo

### Fórmulas

$$R_{med} = \frac{R_{int} + R_{ext}}{2} = \frac{2300 + 3028}{2} = 2664 \text{ mm}$$

$$C_{canal} = 2\pi \cdot R_{med} = 2\pi \cdot 2664 \approx 16.740 \text{ mm} = 16{,}74 \text{ m}$$

$$V_{cuba} = L_{canal} \times H_{canal} \times C_{canal} = 0{,}728 \times 5{,}0 \times 16{,}74 \approx 60{,}93 \text{ m}^3$$

$$\boxed{V_{total} = V_{cuba} \times 2 \approx 121{,}86 \text{ m}^3}$$

| Parâmetro | Valor | Origem |
|:---|:---|:---|
| Diâmetro interno do forno | 4.600 mm | Planta técnica Lhoist |
| Largura do canal | 728 mm | Planta técnica Lhoist |
| Raio interno ($R_{int}$) | 2.300 mm | $D_{int}/2$ |
| Raio externo ($R_{ext}$) | 3.028 mm | $R_{int} + 728$ |
| Raio médio ($R_{med}$) | 2.664 mm | $(R_{int}+R_{ext})/2$ |
| Comprimento médio do anel | 16,74 m | $2\pi R_{med}$ |
| Altura do canal | 5,0 m | Profundidade máxima de limpeza |
| Volume por cuba | 60,93 m³ | $L \times H \times C$ |
| **Volume total (2 cubas)** | **121,86 m³** | $\times 2$ |

> O volume grande é o principal aliado do projeto — qualquer perturbação se dilui nesse espaço.

---

## 📐 Duas Componentes de Pressão

O impacto das buzinas no canal tem **duas naturezas distintas** que precisam ser calculadas separadamente:

**ΔP Estático** — o ar injetado ocupa volume no canal, elevando a pressão até escapar pelo fluxo do forno.

**ΔP Acústico** — as ondas de pressão oscilatórias (picos momentâneos na frequência de 75–160 Hz).

$$\Delta P_{total} = \Delta P_{est} + \Delta P_{ac}$$

---

## 🔢 Cálculo — ΔP Estático

### Fórmula

$$V_{livre} = \frac{Q_{buzina}}{60} \times t_{pulso} \times n_{horns}$$

$$V_{equiv} = V_{livre} \times \frac{P_{amb}}{P_{canal}}$$

$$\boxed{\Delta P_{est} = \frac{V_{equiv}}{V_{total}} \times P_{canal}}$$

O fator $P_{amb}/P_{canal}$ converte o volume de ar livre para o volume que ele efetivamente ocupa dentro do canal pressurizado (Lei dos Gases Ideais).

### Valores adotados

| Parâmetro | Valor | Fonte |
|:---|:---|:---|
| Consumo por buzina ($Q$) | 1,2 m³/min (ar livre) | Referência catálogos industriais 140–150 dB |
| Duração do pulso ($t$) | 10 s | Especificação SonicGuard |
| Pressão do canal ($P_{canal}$) | 1.350 mBar abs | 350 mBar gauge + 1.000 mBar atm |
| Pressão ambiente ($P_{amb}$) | 1.000 mBar abs | Condições normais |
| Volume total ($V_{total}$) | 121,86 m³ | Calculado acima |

### Exemplo — 6 buzinas simultâneas

$$V_{livre} = \frac{1{,}2}{60} \times 10 \times 6 = 1{,}200 \text{ m}^3$$

$$V_{equiv} = 1{,}200 \times \frac{1000}{1350} = 0{,}889 \text{ m}^3$$

$$\Delta P_{est} = \frac{0{,}889}{121{,}86} \times 1350 \approx \boxed{9{,}85 \text{ mBar}}$$

---

## 🔊 Cálculo — ΔP Acústico

### Pressão de pico de 1 buzina

$$\boxed{\Delta P_{ac,1} = P_{ref} \times 10^{\frac{SPL}{20}}}$$

$$\Delta P_{ac,1} = 20 \times 10^{-6} \times 10^{\frac{150}{20}} \approx 632 \text{ Pa} \approx 6{,}32 \text{ mBar}$$

### Soma para múltiplas buzinas — dois cenários

$$\Delta P_{ac} = \begin{cases} \Delta P_{ac,1} \times n & \text{coerente — buzinas próximas (pior caso)} \\ \Delta P_{ac,1} \times \sqrt{n} & \text{incoerente — buzinas trianguladas (caso realista)} \end{cases}$$

**Por que triangulação reduz a pressão acústica?**

Buzinas separadas angularmente por 120° emitem ondas que chegam com diferenças de fase naturais em qualquer ponto do canal. A interferência é parcialmente destrutiva — a soma é quadrática ($\sqrt{n}$), não linear ($n$). Buzinas agrupadas no mesmo setor chegam quase em fase, somando linearmente — pressão máxima.

### Exemplos

**6 buzinas trianguladas** (120° de separação):

$$\Delta P_{ac} = 6{,}32 \times \sqrt{6} \approx \boxed{15{,}49 \text{ mBar}}$$

**6 buzinas agrupadas** (mesmo setor, pior caso absoluto):

$$\Delta P_{ac} = 6{,}32 \times 6 \approx \boxed{37{,}95 \text{ mBar}}$$

---

## 📊 Todos os Casos — Comparativo Completo

| Configuração | ΔP Estático | ΔP Acústico | **ΔP Total** | P resultante | % da margem |
|:---|---:|---:|---:|---:|---:|
| 1 buzina (sequencial) | 1,64 mBar | 6,32 mBar | **7,97 mBar** | 357,9 mBar | 2,3% |
| 2 buzinas — 1 por cuba | 3,28 mBar | 8,94 mBar | **12,23 mBar** | 362,2 mBar | 3,5% |
| 4 buzinas — 2 por cuba | 6,57 mBar | 12,65 mBar | **19,21 mBar** | 369,2 mBar | 5,5% |
| **6 buzinas trianguladas ← projeto** | **9,85 mBar** | **15,49 mBar** | **25,34 mBar** | **375,3 mBar** | **7,2%** |
| 6 buzinas agrupadas (pior caso) | 9,85 mBar | 37,95 mBar | **47,80 mBar** | 397,8 mBar | 13,7% |

### Limites de referência

| Referência | Valor |
|:---|:---|
| Pressão normal de operação | 350 mBar gauge |
| Chapa de explosão (limite destrutivo) | 700 mBar gauge |
| **Margem de segurança disponível** | **350 mBar** |
| **Margem restante — pior caso absoluto** | **302,2 mBar** |

> Em todos os cenários — incluindo o pior caso absoluto — a pressão resultante fica muito abaixo da chapa de explosão. A triangulação reduz o uso da margem de 13,7% para 7,2%, mas mesmo sem ela o sistema seria seguro.

---

## 🔩 Camada de Segurança — Válvula de Retenção

O SonicGuard inclui uma **válvula de retenção unidirecional** na linha de ar comprimido.

**Função:** Impede que gases quentes do canal (CO, particulado, ~1.100°C) refluxem para a linha de ar comprimido e danifiquem a válvula solenóide ou o compressor.

**O que ela NÃO faz:** Não é responsável por controlar pressão no canal — essa função é do próprio fluxo do forno em operação.

```
[Compressor — 4–6 bar]
        ↓
[Válvula solenóide — temporizada]
        ↓
[Válvula de retenção unidirecional]  ← protege a linha de refluxo
        ↓
[Buzina sônica — flange 300 mm]
        ↓
[Canal do forno — fluxo ativo absorve o ar injetado]
        ↓
[Saída natural pelos dutos do forno em operação]
```

---

## 🛡️ Camadas de Segurança

| Camada | Mecanismo | O que cobre |
|:---|:---|:---|
| **1 — Operacional** | Opera só com forno ligado — fluxo dissipa pressão continuamente | ΔP estático na prática |
| **2 — Mecânica** | Válvula de retenção unidirecional na linha de ar | Refluxo de gases quentes (~1.100°C) para a linha de ar |
| **3 — Digital** | Sensor de pressão diferencial IoT + shutdown automático | Qualquer anomalia em tempo real |
| **4 — Sequencial** | Disparos nunca simultâneos no mesmo setor angular | Acúmulo acústico localizado |

O sensor de pressão diferencial (Camada 3) monitora o canal em tempo real: se detectar variação anômala durante um pulso, executa **shutdown automático da buzina**. O dado é registrado no dashboard (Node-RED / Grafana) para análise posterior. Isso garante que, mesmo em cenário improvável de pressão elevada, o sistema se desliga antes de atingir o limiar da chapa de explosão.

---

## ❓ Respostas Prontas para a Banca

**"A buzina injeta ar no forno — isso não vai aumentar a pressão interna perigosamente?"**

> Não. O SonicGuard opera **exclusivamente com o forno em funcionamento**, quando o soprador está ativo e há fluxo contínuo de gases pelo canal. O ar injetado em pulsos de 10 segundos é absorvido por esse fluxo e sai pelos dutos normais do forno — exatamente o mesmo caminho dos gases de processo. A pressão interna se mantém dentro do range normal de operação (≤ 350 mBar), muito abaixo do limiar da chapa de explosão (700 mBar). Como camada adicional, o sensor de pressão IoT faz shutdown automático se detectar qualquer anomalia.

**"6 buzinas simultâneas não geram pressão perigosa no canal?"**

> Não. O canal das duas cubas tem aproximadamente **122 m³** de volume. No pior caso absoluto — 6 buzinas agrupadas com ondas em fase perfeita — a pressão sobe apenas **47,8 mBar** acima do nível normal de operação, usando **13,7%** da margem de segurança antes de atingir a chapa de explosão. No caso real do projeto, com buzinas trianguladas a 120°, o aumento é de **25,3 mBar — apenas 7,2% da margem**. Além disso, o SonicGuard opera exclusivamente com o forno em funcionamento: o soprador ativo dissipa continuamente qualquer perturbação pelo fluxo natural de gases, tornando os cálculos acima ainda mais conservadores do que o necessário.

---

## ✅ Vantagem Adicional de Operar com Forno Ligado

Operar com o forno em funcionamento não é apenas uma solução para o problema de pressão — é **a melhor versão do conceito**:

- Age na **primeira fase** da incrustação, quando o pó ainda está solto e o fluxo de gases pode carreá-lo
- **Elimina completamente a necessidade de parada** para limpeza preventiva
- Cada ciclo de limpeza eliminado = **~R$ 18.000–20.000 economizados** (custo de 1h de forno parado)
- Alinhado com o princípio 改善 (*kaizen*): não apenas melhorar a limpeza — **eliminar a condição que a torna necessária**

---

#sonicguard #pressao #cálculo #gp-senai-2026 #lhoist #buzina-sonica #resposta-banca #6-simultâneas
