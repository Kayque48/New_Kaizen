# ⚠️ SonicGuard — Gestão de Pressão no Canal

> **Contexto:** A buzina sônica injeta ar comprimido (4–6 bar) dentro de um canal que opera pressurizado (até 350 mBar em funcionamento). A pergunta crítica é: **esse ar injetado não vai acumular pressão perigosa no canal?**
>
> **Decisão de projeto:** O SonicGuard opera **exclusivamente com o forno em funcionamento** — nunca durante paradas. Essa decisão resolve o problema na raiz.

---

## 🎯 Por que operar com o forno ligado resolve tudo

Quando o forno está em funcionamento:

- O **soprador está ativo** — há fluxo contínuo de gases circulando pelo canal
- Esse fluxo cria um **caminho natural de saída** para o ar injetado pela buzina
- O pulso de 10 segundos a 4–6 bar se **dissolve no fluxo existente** sem acúmulo
- A pressão interna se mantém no range normal de operação (**≤ 350 mBar**)
- A chapa de explosão (700 mBar) **nunca é ativada**

> Em outras palavras: o forno ligado já tem seu próprio sistema de gestão de pressão — o SonicGuard apenas aproveita isso.

---

## 🔩 Camada de Segurança — Válvula de Retenção

Mesmo operando com o forno ligado, o SonicGuard inclui uma **válvula de retenção unidirecional** na linha de ar comprimido.

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

## 📊 Comparativo de Pressões

| Referência | Valor |
|:---|:---|
| Pressão de operação do forno (normal) | até **350 mBar** |
| Pressão da chapa de explosão (limite destrutivo) | **700 mBar** |
| Pressão de operação do SonicGuard | **4–6 bar (4.000–6.000 mBar)** |
| Duração do pulso | **10 segundos** |
| Intervalo entre pulsos | **10 minutos** (duty cycle ~1,7%) |

> O diferencial de pressão entre a buzina e o canal é alto — mas o **volume de ar por pulso é baixo** (10 segundos de vazão), e o forno em operação tem capacidade de absorção contínua. O resultado líquido no canal é um pico de pressão acústica (som), não acúmulo estático.

---

## 🛡️ Monitoramento IoT como Camada de Segurança Adicional

O sensor de pressão diferencial já previsto na arquitetura IoT do SonicGuard serve também como **proteção ativa**:

- Monitora a pressão no canal em tempo real
- Se detectar variação anômala durante um pulso → **shutdown automático da buzina**
- Dado é registrado no dashboard (Node-RED / Grafana) para análise posterior

Isso garante que, mesmo em cenário improvável de pressão elevada, o sistema **se desliga antes de atingir o limiar da chapa de explosão**.

---

## ❓ Resposta Pronta para a Banca

**"A buzina injeta ar no forno — isso não vai aumentar a pressão interna perigosamente?"**

> Não. O SonicGuard opera **exclusivamente com o forno em funcionamento**, quando o soprador está ativo e há fluxo contínuo de gases pelo canal. O ar injetado em pulsos de 10 segundos é absorvido por esse fluxo e sai pelos dutos normais do forno — exatamente o mesmo caminho dos gases de processo. A pressão interna se mantém dentro do range normal de operação (≤ 350 mBar), muito abaixo do limiar da chapa de explosão (700 mBar). Como camada adicional, o sensor de pressão IoT faz shutdown automático se detectar qualquer anomalia.

---

## ✅ Vantagem Adicional de Operar com Forno Ligado

Operar com o forno em funcionamento não é apenas uma solução para o problema de pressão — é **a melhor versão do conceito**:

- Age na **primeira fase** da incrustação, quando o pó ainda está solto e o fluxo de gases pode carreá-lo
- **Elimina completamente a necessidade de parada** para limpeza preventiva
- Cada ciclo de limpeza eliminado = **~R$ 18.000–20.000 economizados** (custo de 1h de forno parado)
- Alinhado com o princípio 改善 (*kaizen*): não apenas melhorar a limpeza — **eliminar a condição que a torna necessária**

---

#sonicguard #pressao #gp-senai-2026 #lhoist #buzina-sonica #resposta-banca
