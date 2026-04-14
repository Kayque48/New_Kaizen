# 💡 Ideia — Tampa Distribuidora Multi-Saída + Drone Acoplador

> [!info] Desafio **GP SENAI 2026 · Lhoist** — Automação da limpeza de canais nos fornos verticais da unidade de Matozinhos, MG
> Status: **Rascunho**

---

## 🧠 Conceito Central

Substituição da lança manual por uma **tampa passiva de distribuição angular** fixada permanentemente ao poken in door, com **acoplamento automático via drone** portador da mangueira pressurizada. O operador permanece distante do ponto de risco durante toda a operação.

---

## ⚙️ Como Funciona

### Etapa 1 — Tampa Distribuidora
Uma tampa fixa é instalada no poken in door (300 mm de diâmetro). Internamente, ela divide o fluxo de água em **múltiplos tubos pré-angulados** para cobrir a variação angular de **120°**, direcionando o jato para diferentes profundidades (1–5 m) sem presença humana no ponto de risco.

### Etapa 2 — Acoplamento via Drone
Um drone portátil transporta a mangueira pressurizada e a **acopla na entrada padronizada** da tampa distribuidora. O operador controla o drone remotamente, sem precisar acessar a plataforma de risco.

### Etapa 3 — Limpeza e Desacoplamento
Com a mangueira acoplada, o jato é acionado. Após a limpeza, o drone **desacopla e avança para o próximo poken in door**, repetindo o ciclo de forma sequencial.

---

## 🔩 Componentes da Solução

| Componente | Descrição |
|---|---|
| **Tampa distribuidora** | Peça passiva instalada permanentemente no poken in door. Tubos internos pré-angulados para cobrir 120° e alcance de 1–5 m. Material: inox ou cerâmica refratária. |
| **Entrada de acoplamento** | Conector padronizado (ex.: engate rápido) na face externa da tampa, compatível com o bico do drone. Deve suportar ~3,5 bar. |
| **Drone acoplador** | Drone de médio porte com garra ou bico de encaixe para transporte e conexão da mangueira. Operado remotamente. Portátil (acesso por escada). |
| **Mangueira e bomba** | Mantém infraestrutura atual (½", ~3,5 bar), apenas com adaptação do terminal final para o conector padronizado da tampa. |

---

## ✅ Alinhamento com os Requisitos

| Requisito | Como é atendido |
|---|---|
| Cobertura angular de 120° | Distribuição pelos tubos internos da tampa |
| Profundidade de 1–5 m | Tubos angulados e dimensionados para cada faixa |
| Cabeçote ≤ 300 mm | Tampa fixada no próprio poken in door |
| Eliminação da sobrecarga física | Operador não manipula lança nem marreta |
| Operação remota | Drone controlado à distância |
| Portabilidade | Drone portátil; tampa é componente fixo leve |
| Replicabilidade | Tampa padronizada instalável em todos os fornos verticais |
| Sem contato direto com refratário | Ângulos dos tubos calibrados para evitar impacto direto |

---

## ⚠️ Pontos em Aberto (a validar)

- [ ] Como o drone lida com o **ambiente de alta temperatura e fumaça** próximo à plataforma?
- [ ] A pressão de ~3,5 bar é distribuída **uniformemente entre os tubos**, ou precisa de controle individual por saída?
- [ ] Como garantir que o jato **não atinja o refratário interno** com a distribuição multi-saída?
- [ ] O **mecanismo de abertura da tampa metálica (~20 kg)** é resolvido pelo drone ou separadamente?

---

## 🛠️ Ferramentas Substituídas

| Atual | Substituído por |
|---|---|
| Marreta 5 kg | Drone (acoplamento) ou mecanismo automático de abertura |
| Chave T (remoção da tampa) | Tampa distribuidora permanente — sem necessidade de remoção |
| Lança inox ½" manual | Tubos internos da tampa distribuidora |
| Mangueira ½" com operador | Mangueira acoplada via drone, operada remotamente |

---

## 📊 Impacto Esperado

| Métrica | Situação atual | Com a solução |
|---|---|---|
| Tempo de exposição ao risco | Toda a duração da limpeza | Eliminado (operação remota) |
| Esforço físico | Marreta + lança manual | Nenhum |
| Estresse térmico | Alto (EPI obrigatório + calor) | Eliminado |
| Replicabilidade | Não se aplica | Todos os fornos verticais |

---

> [!tip] Próximo passo
> Validar os pontos em aberto com a equipe técnica — especialmente o comportamento do drone em ambiente de alta temperatura e o controle dos ângulos dos tubos para proteção do refratário.
