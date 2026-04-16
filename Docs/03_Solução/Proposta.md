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
data: 2026-04-16
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
        ↓  [janela de oportunidade]
Fase líquida K₂O a 700–800°C (começa a aderir)
        ↓
Crosta química fundida (impossível remover sem impacto)
```

**O SonicGuard age na primeira fase** — quando o pó ainda está solto — impedindo que o processo avance.

### Mecanismo Acústico

A buzina sônica emite ondas de pressão de **baixa frequência (75–160 Hz)** e **alta energia (140–150 dB)**, geradas por ar comprimido. Diferente do ultrassom, ondas graves preenchem **todo o volume do canal** — incluindo os 5m de profundidade e os 120° de variação angular — sem precisar de linha de visada.

```
[Compressor industrial]
         ↓
[Válvula solenóide temporizada]
         ↓
[Buzina sônica — flange 300mm]  ←── instalada no Poken In Door
         ↓
[Onda de pressão preenche o canal]
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
| Operação | Automática, 24h durante operação do forno |
| Acionamento | Válvula solenóide controlada por CLP/ESP32 |
| Sequência | Buzinas ativadas em sequência (não simultâneas) |

> [!tip] Por que sequencial e não simultâneo?
> Evita acúmulo de pressão acústica combinada, preservando a integridade do refratário e reduzindo consumo de ar comprimido.

---

## 🔩 Especificações Técnicas

### Parâmetros Acústicos

| Parâmetro | Valor |
|:---|:---|
| Frequência de operação | 75–160 Hz |
| Nível de pressão sonora (SPL) | 140–150 dB na fonte |
| Pressão de ar de operação | 4–6 bar |
| Comprimento de onda (~100 Hz) | ~3,4 m — preenche canal de 5m |
| Cobertura angular | Omnidirecional — 360° por natureza |

### Materiais — Selecionados para 1.100°C Contínuo

| Componente | Material | Justificativa |
|:---|:---|:---|
| Pavilhão / Horn | **Aço Inox AISI 310S** | Suporta 1.150°C, resistente à oxidação |
| Flange de instalação | **Aço Inox AISI 316Ti** | Estabilidade dimensional em ciclos térmicos |
| Diafragma / Palheta | **Inconel 625** | Alta temperatura + fadiga cíclica controlada |
| Vedações | **Grafite expandido** | Único elastômero viável acima de 500°C |
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

A buzina é instalada **no lugar da tampa original** — ou integrada a uma tampa modificada com flange central. A tampa nunca mais precisa ser removida em operação normal.

### Compatibilidade com os Fornos

| Forno | Poken In Doors | Frequência atual | Com SonicGuard |
|:---|:---|:---|:---|
| Forno 4 | 36 (18 por cuba) | 2x / semana | Automático — contínuo |
| Forno 5 | 48 (24 por cuba) | A cada 15 dias | Automático — contínuo |
| **Total** | **84** | — | **84 buzinas** |

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
| **Acesso angular 120° / 5m** | Som preenche volume completo — cobertura omnidirecional |
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
- Instalação nas 66 buzinas restantes (18+48)
- Treinamento da equipe de operação no dashboard
- Definição de protocolo de manutenção preventiva do diafragma

### Fase 3 — Replicação
- Design de flange universal para outros fornos Maerz no Brasil
- Documentação para licenciamento nas 49+ unidades globais Lhoist

---

## 💰 Análise Financeira Preliminar

| Item                                                      | Referência               |
| :-------------------------------------------------------- | :----------------------- |
| CAPEX estimado (84 buzinas + IoT)                         | R$ 120.000 – 220.000     |
| Custo de um acidente grave (afastamento + NR + reputação) | > R$ 200.000             |
| Produção recuperada (Forno 5)                             | ~600 ton/semana × R$/ton |
| Payback estimado                                          | < 12 meses               |

> [!note] O custo de **um único acidente grave** já supera o CAPEX total do sistema.

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
- Ciclo gap → buzz automatizado com 4 zonas de buzina
- Remoção da incrustação por zona de influência acústica
- Áudio real com osciladores a 118 Hz (fundamental)
- Dashboard com métricas: partículas ativas, % de incrustação, status do canal
- Parâmetros ajustáveis em tempo real: taxa de poeira, intervalo, duração, raio

![[rascunho_buzina_digital.png]]
![[rascunho_buzina_físico.jpeg]]

---

## ❓ Perguntas Esperadas da Banca — Respostas Prontas

**"A buzina remove crosta já formada?"**
> Não — e não precisa. A proposta é preventiva. Antes da instalação, uma limpeza convencional zera o estado do forno. A partir daí, o sistema impede que qualquer crosta se forme, atuando enquanto o pó ainda está solto e com energia muito menor do que seria necessário para quebrar crosta dura.

**"E a pressão que a buzina injeta no forno?"**
> A pressão de operação (4–6 bar) é calibrada acima da pressão interna do forno (~0–50 mbar). Uma válvula de retenção impede refluxo de gases quentes. O ar que entra sai pelos próprios dutos do forno — sistema aberto, sem acúmulo.

**"O refratário aguenta as vibrações?"**
> Sim, com duas condições: frequência na faixa segura (75–160 Hz) e operação sequencial — nunca simultânea. Isso mantém o SPL combinado abaixo de 140 dB e evita ressonância com a estrutura. O acelerômetro IoT monitora vibração em tempo real com shutdown automático se detectar anomalia.

**"O ar comprimido da Lhoist aguenta 84 buzinas?"**
> Cada buzina opera 10 segundos a cada 10 minutos — duty cycle de ~1,7%. O consumo real é baixo. Ponto a ser validado no piloto com medição da rede existente.

**"Como replica para outros fornos?"**
> O design de flange é padronizado para 300mm — dimensão padrão dos Poken In Doors Maerz. A mesma buzina serve Forno 4, Forno 5 e qualquer outro forno PFR da família Maerz no Brasil e no mundo.

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
