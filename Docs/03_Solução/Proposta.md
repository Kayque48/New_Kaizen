---
tags:
  - lhoist
  - solucao
  - buzina-sonica
  - limpeza-acustica
  - automacao
  - industria-4-0
  - gp-senai-2026
status: finalizado
data: 2026-04-17
---

# 🔊 SonicGuard — Sistema de Limpeza Acústica Preventiva

> [!success] Proposta Final — NewKaizen | GP SENAI 2026
> Sistema de buzinas sônicas instaladas permanentemente nos *Poken In Doors* dos fornos Maerz PFR da Lhoist Matozinhos, operando em ciclos automatizados para **impedir a formação de incrustações** — eliminando o risco ocupacional na raiz, sem parada de produção e sem presença humana no ponto de perigo.

---

## 🎯 Problema Resolvido

A limpeza manual dos canais dos fornos verticais expõe operadores a condições extremas:

| Risco | Classificação | Norma Violada |
|:---|:---|:---|
| Temperatura irradiante ~1.100°C | Gravíssimo | NR-15 |
| Flexão de tronco >45° sustentada | Grave | NR-17 |
| Esforço repetitivo com marreta 5 kg | Grave | NR-17 / DORT |
| Ambiente semi-confinado com CO | Moderado | NR-33 |
| Trabalho em altura | Moderado | NR-35 |

**Hoje:** 5 operadores em revezamento, turnos de 15–20 min, ~2h por sessão, até 3x por semana.
**Com SonicGuard:** 0 operadores expostos por ciclo de limpeza.

---

## ⚙️ Como Funciona

### Princípio Central

> A incrustação não é inevitável — ela é o resultado de pó de cal não removido a tempo.

O processo de incrustação ocorre em fases:

```
Pó fino depositado (fraco, removível)
        ↓  [janela de oportunidade — SonicGuard age aqui]
Fase líquida K₂O a 700–800°C (começa a aderir)
        ↓
Crosta química fundida (impossível remover sem impacto)
```

**O SonicGuard age na primeira fase** — quando o pó ainda está solto — impedindo que o processo avance.

### Mecanismo Acústico

A buzina sônica emite ondas de pressão de **baixa frequência (75–160 Hz)** e **alta energia (140–150 dB)**, geradas por ar comprimido. Diferente do ultrassom, ondas graves preenchem **todo o volume do canal** — incluindo os 5 m de profundidade e os 120° de variação angular — sem precisar de linha de visada.

```
[Compressor industrial]
         ↓
[Válvula solenóide temporizada]
         ↓
[Válvula de retenção unidirecional]  ←── impede refluxo de gases quentes
         ↓
[Buzina sônica — flange 300mm]  ←── instalada no Poken In Door
         ↓
[Onda de pressão preenche o canal omnidirecionalmente]
         ↓
[Pó fino fluidizado + levado pelo fluxo de gases do forno]
         ↓
[Canal permanece limpo — crosta nunca se forma]
```

### Ciclo de Operação

| Parâmetro | Valor |
|:---|:---|
| Duração do pulso | 10 segundos |
| Intervalo entre pulsos | 10 minutos |
| Operação | Automática, 24h **durante operação do forno** |
| Acionamento | Válvula solenóide controlada por CLP/ESP32 |
| Configuração | **6 buzinas simultâneas — 3 por cuba, trianguladas a 120°** |
| Sequência entre passos | Script de 4 passos — ângulos distintos entre Cuba A e B |

> [!tip] Por que 6 simultâneas trianguladas?
> A triangulação a 120° entre as buzinas de cada cuba garante cobertura omnidirecional uniforme do canal inteiro em cada pulso — sem pontos cegos. As ondas partem de ângulos distintos, garantindo que toda a superfície do canal receba energia acústica. Além disso, a separação angular de 120° faz com que as ondas cheguem fora de fase em qualquer ponto, reduzindo o pico de pressão acústica combinada de um fator linear (×6) para um fator quadrático (×√6 ≈ 2,45) — ver seção de pressão abaixo.

> [!info] Segurança no script de 4 passos
> O algoritmo de acionamento garante matematicamente que pokendors adjacentes à junção das duas cubas (poke 7 e poke 43) **nunca disparam simultaneamente**, eliminando o único ponto de possível acúmulo acústico localizado.

---

## 🔩 Especificações Técnicas

### Parâmetros Acústicos

| Parâmetro | Valor |
|:---|:---|
| Frequência de operação | 75–160 Hz |
| Nível de pressão sonora (SPL) | 140–150 dB na fonte |
| Pressão de ar de operação | 4–6 bar |
| Comprimento de onda (~100 Hz) | ~3,4 m — preenche canal de 5 m |
| Cobertura angular | Omnidirecional — 360° por natureza |
| Buzinas por pulso | **6 (3 por cuba, trianguladas a 120°)** |

### Materiais — Selecionados para 1.100°C Contínuo

| Componente | Material | Justificativa |
|:---|:---|:---|
| Pavilhão / Horn | **Aço Inox AISI 310S** | Suporta 1.150°C, resistente à oxidação |
| Flange de instalação | **Aço Inox AISI 316Ti** | Estabilidade dimensional em ciclos térmicos |
| Diafragma / Palheta | **Inconel 625** | Alta temperatura + fadiga cíclica controlada |
| Vedações | **Grafite expandido** | Único material viável acima de 500°C |
| Fixações | **Aço Inox A4-80** | Resistência mecânica em alta temperatura |

> [!warning] Por que não Titânio ou Tungstênio?
> Titânio perde resistência acima de 600°C e oxida. Tungstênio é frágil mecanicamente e de difícil usinagem. O Inconel 625 é o padrão industrial para esta aplicação.

### Geometria de Instalação

```
[EXTERIOR]
    │
[Tampa externa — aço carbono + isolamento]  ~60–120°C
    │
[Câmara de isolamento térmico]              ~150–300°C
    │
[Flange da buzina — 300mm diâm.]            ~400–600°C
    │
[Horn / Pavilhão — 310S]                    ~600–900°C
    │
[Interior do canal]                          1.100°C
```

A buzina é instalada **no lugar da tampa original** — integrada a uma tampa modificada com flange central. A tampa nunca mais precisa ser removida em operação normal.

### Compatibilidade com os Fornos

| Forno | Poken In Doors | Frequência atual | Com SonicGuard |
|:---|:---|:---|:---|
| Forno 4 | 36 (18 por cuba) | 2x / semana | Automático — contínuo |
| Forno 5 | 48 (24 por cuba) | A cada 15 dias | Automático — contínuo |
| **Total** | **84** | — | **84 buzinas** |

---

## ⚠️ Gestão de Pressão — Análise de Segurança

### Volume do Canal

O canal de conexão das duas cubas forma uma pista retangular ao redor dos cilindros internos. Com base nas dimensões da planta técnica:

| Parâmetro | Valor |
|:---|:---|
| Diâmetro interno do forno | 4.600 mm |
| Largura do canal | 728 mm |
| Profundidade (altura) do canal | 5.000 mm |
| Volume por cuba | ~60,93 m³ |
| **Volume total (2 cubas)** | **~121,86 m³** |

O volume grande é o principal fator de segurança — qualquer injeção de ar se dilui nesse espaço.

### Impacto de Pressão — 6 Buzinas Simultâneas

O impacto das buzinas tem duas componentes: **estática** (ar que entra no canal) e **acústica** (ondas de pressão oscilatórias).

**ΔP Estático** — Lei dos Gases Ideais, 6 buzinas × 10 s × 1,2 m³/min:

$$\Delta P_{est} = \frac{V_{equiv}}{V_{total}} \times P_{canal} \approx \mathbf{9{,}85 \text{ mBar}}$$

**ΔP Acústico** — buzinas trianguladas (fases distintas → soma quadrática):

$$\Delta P_{ac} = 6{,}32 \times \sqrt{6} \approx \mathbf{15{,}49 \text{ mBar}}$$

### Comparativo — Todos os Casos

| Configuração | ΔP Estático | ΔP Acústico | **ΔP Total** | P resultante | % da margem |
|:---|---:|---:|---:|---:|---:|
| 1 buzina (referência) | 1,64 mBar | 6,32 mBar | 7,97 mBar | 357,9 mBar | 2,3% |
| 2 buzinas — 1 por cuba | 3,28 mBar | 8,94 mBar | 12,23 mBar | 362,2 mBar | 3,5% |
| 4 buzinas — 2 por cuba | 6,57 mBar | 12,65 mBar | 19,21 mBar | 369,2 mBar | 5,5% |
| **6 buzinas trianguladas ← projeto** | **9,85 mBar** | **15,49 mBar** | **25,34 mBar** | **375,3 mBar** | **7,2%** |
| 6 buzinas agrupadas (pior caso abs.) | 9,85 mBar | 37,95 mBar | 47,80 mBar | 397,8 mBar | 13,7% |

**Limites do forno:**
- Pressão normal de operação: **350 mBar gauge**
- Chapa de explosão (limite destrutivo): **700 mBar gauge**
- Margem disponível: **350 mBar** → pior caso usa **13,7%** — sobram **302 mBar**

> [!success] O SonicGuard opera dentro de margens amplamente seguras em todos os cenários. A triangulação reduz o uso da margem de 13,7% para **7,2%** — sem nenhum risco à integridade do forno.

### Por que operar com forno ligado resolve a raiz

Os cálculos acima são **conservadores** — assumem o pior caso sem dissipação. Na operação real, o soprador está ativo e o fluxo contínuo de gases pelo canal absorve o ar injetado naturalmente, pelo mesmo caminho dos gases de processo. O SonicGuard **nunca opera com o forno parado**, o que elimina qualquer cenário de acúmulo estático.

---

## 📡 Monitoramento IoT — Camada Digital

### Arquitetura

```
[Termopar tipo K]          → temperatura na flange
[Sensor de pressão]        → pressão diferencial canal/ambiente  
[Acelerômetro MEMS]        → vibração na estrutura (segurança)
[Microfone industrial]     → confirmação de funcionamento da buzina
        │
    [ESP32 blindado]  ←── fora do forno, ligado por cabo blindado
        │
    [MQTT / Wi-Fi industrial]
        │
    [Dashboard — Node-RED / Grafana]
        │
    [Alertas automáticos] ← buzina falhou | vibração anômala | temperatura fora do range
```

### O que o Dashboard Mostra

- ✅ Status de cada buzina em tempo real (ativa / em espera / falha)
- 📊 Histórico de ciclos por pokendor
- 🌡️ Temperatura na flange de cada canal
- ⚠️ Alertas de anomalia com shutdown automático
- 📈 Estimativa de nível de incrustação por canal
- 🔁 Última limpeza manual registrada (pré-instalação)

> [!info] Indústria 4.0
> O SonicGuard transforma uma operação manual e invisível em um processo **rastreável, auditável e preditivo** — alinhado com a transformação digital da Lhoist.

---

## 🛡️ Resolução das Dores do Desafio

| Dor Original | Como o SonicGuard Resolve |
|:---|:---|
| **Temperatura 1.100°C** | Operador nunca se aproxima — sistema 100% automático |
| **Marreta 5 kg + lança** | Eliminados — tampa não abre mais em operação |
| **Flexão de tronco >45°** | Eliminada — zero ergonomia de risco |
| **Acesso angular 120° / 5 m** | Som preenche volume completo — cobertura omnidirecional |
| **Água no refratário** | 100% a seco — apenas ar comprimido |
| **NR-15 / NR-17 / NR-33 / NR-35** | Todas eliminadas na operação normal |

---

## 📋 Plano de Implantação

### Fase 0 — Limpeza Inicial (pré-instalação)
- Limpeza corretiva convencional de todos os canais (última vez com método manual)
- Documentação fotográfica do estado inicial
- Medição de temperatura e pressão interna nos canais

### Fase 1 — Piloto (Forno 4 — 1 cuba, 18 buzinas)
- Instalação das buzinas na primeira cuba do Forno 4
- Comissionamento do sistema IoT e dashboard
- Monitoramento por 30 dias com coleta de dados
- Validação: nenhuma limpeza manual necessária no período

### Fase 2 — Expansão (Forno 4 completo + Forno 5)
- Instalação nas 66 buzinas restantes (18 + 48)
- Treinamento da equipe de operação no dashboard
- Definição de protocolo de manutenção preventiva do diafragma

### Fase 3 — Replicação
- Design de flange universal para outros fornos Maerz no Brasil
- Documentação para licenciamento nas 49+ unidades globais Lhoist

---

## 💰 Análise Financeira Preliminar

| Item | Referência |
|:---|:---|
| CAPEX estimado (84 buzinas + IoT) | R$ 120.000 – 220.000 |
| Custo de um acidente grave (afastamento + NR + reputação) | > R$ 200.000 |
| Custo de 1h de forno parado (só perda de cal) | ~R$ 18.000–20.000 |
| Produção recuperada (Forno 5) | ~600 ton/semana × R$/ton |
| Payback estimado | < 12 meses |

> [!note] O custo de **um único acidente grave** já supera o CAPEX total do sistema. E cada sessão de limpeza eliminada economiza ~R$ 20.000 em produção parada.

---

## 🏆 Alinhamento Estratégico Lhoist

| Pilar Lhoist | Como o SonicGuard Contribui |
|:---|:---|
| **Go for Zero** | Elimina exposição humana a risco gravíssimo |
| **Sustentabilidade** | Canal limpo = queima eficiente = menos CO₂ |
| **Inovação** | Aplicação inédita em Maerz PFR para cal — potencial de patente |
| **Pessoas no centro** | Operadores passam de risco a supervisão remota |
| **Expansão global** | Replicável nas 49+ unidades mundiais |

---

## 🖼️ Protótipo Digital

Simulação desenvolvida em **Processing** com física de partículas real:

- Partículas de pó de cal com dinâmica de deposição nas paredes
- Incrustação progressiva nas superfícies (teto, paredes, diagonais)
- **6 buzinas simultâneas trianguladas — 3 por cuba, separação 120°**
- Script de 4 passos garantindo ângulos distintos entre Cuba A e Cuba B a cada ciclo
- Remoção da incrustação por zona de influência acústica
- Áudio real com osciladores a 118 Hz (fundamental)
- Dashboard com métricas: partículas ativas, % de incrustação, status do canal
- Parâmetros ajustáveis em tempo real: taxa de poeira, intervalo, duração, raio

![[visao_lateral_v1.png|697]]
![[visao_superior_v1.png]]
---

## ❓ Perguntas Esperadas da Banca — Respostas Prontas

**"A buzina remove crosta já formada?"**
> Não — e não precisa. A proposta é preventiva. Antes da instalação, uma limpeza convencional zera o estado do forno. A partir daí, o sistema impede que qualquer crosta se forme, atuando enquanto o pó ainda está solto — com energia muito menor do que seria necessário para quebrar crosta dura.

**"O refratário aguenta as vibrações?"**
> Sim. A frequência de operação (75–160 Hz) está na faixa segura para refratários industriais. A triangulação a 120° faz com que as ondas cheguem fora de fase em qualquer ponto da parede, evitando ressonância localizada. O acelerômetro MEMS monitora vibração em tempo real com shutdown automático se detectar anomalia.

**"O ar comprimido da Lhoist aguenta 84 buzinas?"**
> Cada buzina opera 10 segundos a cada 10 minutos — duty cycle de ~1,7%. Das 84 buzinas, apenas 6 disparam ao mesmo tempo por pulso. O consumo real é baixo e compatível com a rede pneumática de 6 bar já existente. Ponto a ser validado e ajustado no piloto.

**"Como replica para outros fornos?"**
> O design de flange é padronizado para 300 mm — dimensão padrão dos Poken In Doors Maerz. A mesma buzina serve Forno 4, Forno 5 e qualquer outro forno PFR da família Maerz no Brasil e no mundo.

**"A buzina injeta ar no forno — isso não vai acumular pressão?"**
> Não. O SonicGuard opera **exclusivamente com o forno em funcionamento**, quando o soprador está ativo e há fluxo contínuo de gases pelo canal. O ar injetado é absorvido por esse fluxo e sai pelos dutos normais do forno. A pressão interna se mantém dentro do range normal (≤ 350 mBar), muito abaixo da chapa de explosão (700 mBar). O sensor de pressão IoT faz shutdown automático se detectar qualquer anomalia.

**"6 buzinas simultâneas não geram pressão perigosa?"**
> Não. O canal das duas cubas tem ~**122 m³** de volume. Com 6 buzinas trianguladas, o ΔP total calculado é de apenas **25,3 mBar** — usando **7,2% da margem de segurança** disponível (350 mBar antes de atingir a chapa de explosão). Mesmo no pior caso absoluto — 6 buzinas agrupadas, ondas em fase perfeita — o ΔP seria de 47,8 mBar, usando apenas 13,7% da margem. Sobram mais de **300 mBar de folga** em qualquer cenário. A triangulação a 120° reduz ainda o pico acústico combinado: em vez de somar linearmente (×6), as ondas somam em quadratura (×√6 ≈ 2,45), porque chegam fora de fase em qualquer ponto do canal.

**"Por que 6 simultâneas e não sequencial?"**
> A operação com 6 buzinas simultâneas trianguladas cobre o canal inteiro em cada pulso — sem pontos cegos. No modo sequencial, cada pulso age em apenas um setor do canal enquanto o restante permanece sem energia acústica, reduzindo a eficácia preventiva. A triangulação é a configuração que maximiza cobertura com o menor impacto de pressão possível para múltiplas buzinas.

---

## 👥 Escuderia NewKaizen

| Membro | Formação |
|:---|:---|
| **João Gabriel Gonçalez** *(Porta-voz)* | Téc. Dev. Sistemas (SENAI) · Eng. Computação (FHO) · 1º Desafio de Ideias MAXION |
| **Henrique Rodrigues Motta** | Téc. Eletroeletrônica · IC Embarcados (Unicamp) |
| **Joel João de Araújo Neto** | Téc. Dev. Sistemas · IC Tour Virtual (Unicamp) · 1º Resolve Aí MAHLE |
| **Kayque Costa da Silva** | Téc. Dev. Sistemas · Téc. Mecânica (COTIL) |
| **Victor Hugo Camargo** | Téc. Eletroeletrônica · IC Construção Civil (Unicamp) |

---

> [!quote] 改善 — *Kaizen*
> "Não basta eliminar o acidente. É preciso eliminar a condição que o tornava possível."
> — NewKaizen, GP SENAI 2026