# 🏭 GP SENAI 2026 — Desafio Lhoist

> [!info] Empresa **Lhoist** — +130 anos de história global. Produção de **cal e minerais**. Presente no Brasil há 21 anos: MG, GO, ES e RJ. Unidade do desafio: **Matozinhos, MG**

---

## 🎯 Problema Central

Limpeza manual dos canais nas **cubas dos fornos verticais** realizada por operadores humanos expostos a:

- 🌡️ Temperatura interna dos canais: **1.100°C**
- 💪 Esforço físico intenso com marreta de **5 kg** e lança de **½"**
- 🧍 Postura inadequada: flexão de tronco, cervical e membros superiores repetitivos
- 🥵 Estresse térmico agravado por EPI obrigatório (macacão JGB, luvas Korion, botas)

---

## 🔩 Contexto Técnico

### Acesso ao Canal (Poken In Doors)

|Parâmetro|Valor|
|---|---|
|Diâmetro da abertura|**300 mm**|
|Profundidade da abertura|**470 mm** (limitador de ângulo)|
|Profundidade de incrustação|**1 a 5 m** a partir do piso|
|Variação angular necessária|**120°**|

### Frequência de Limpeza

|Forno|Nº de Poken In Doors|Frequência|
|---|---|---|
|Forno 4|36 (18 por cuba)|**2x por semana**|
|Forno 5|48 (24 por cuba)|**a cada 15 dias**|

### Material Incrustado

- **Finos de cal fundida** — subproduto da descarbonatação: $$CaCO_3 \rightarrow CaO + CO_2$$
- Deposita-se nas paredes, acima dos pilares e na região central do fosso

---

## ⚠️ Restrições Críticas (Requisitos Implícitos e Explícitos)

> [!warning] Atenção às restrições — qualquer solução deve respeitar isso

- 🚫 **Água não pode tocar o refratário interno** diretamente
- 📐 Dispositivo precisa **caber em abertura de 300 mm**
- 🔥 Materiais devem suportar ou estar protegidos do calor extremo
- 🪜 Acesso via **escada metálica** — movimentação de grandes equipamentos é **limitada**
- ✅ Solução deve ser **permanente e viável** (não paliativa)
- 🔁 Deve ser **replicável** em todos os fornos verticais tipo fluxo paralelo regenerativo

---

## 🧩 Palavras-Chave e Conceitos Centrais

### Explícitos no Desafio

- #automatização — eliminação da presença humana na operação de risco
- #ergonomia — redução de sobrecarga física (força, postura, repetição)
- #segurança-do-trabalho — eliminação de riscos de acidente e exposição térmica
- #escalabilidade — replicável em todos os fornos verticais da planta
- #eficiência — redução do tempo de execução da limpeza
- #refratário — proteção da estrutura interna dos fornos

### Implícitos / Inferidos

- #sustentabilidade — processo produtivo mais seguro e com menos interrupções
- #melhoria-contínua — **改善** (_kaizen_) — redução sistemática de riscos e tempo
- #manutenção-preditiva — limpeza programada evita falhas por obstrução
- #industria-4-0 — automação com controle remoto / robotização de tarefa repetitiva
- #saude-ocupacional — redução de doenças musculoesqueléticas (LER/DORT)
- #produtividade — menos tempo de operação = mais disponibilidade do forno
- #inovacao-aberta — desafio proposto por empresa para solução externa

---

## 💡 Como Podemos? (HMW — How Might We)

> "Como podemos realizar esta limpeza de canal de forma eficiente, sem danificar a estrutura refratária, garantindo a remoção total do material incrustado (acima das colunas e alcançando diferentes ângulos), **eliminando sobrecarga física, exposição a altas temperaturas e riscos de acidentes**?"

---

## 📐 Requisitos da Solução

### Funcionais

- [ ] Remover incrustação entre **1 e 5 m** de profundidade
- [ ] Cobrir **120° de variação angular**
- [ ] Caber em abertura de **300 mm de diâmetro**
- [ ] Controlar jato de água para **não atingir o refratário**
- [ ] Automatizar ou mecanizar a **abertura da tampa (~20 kg)**

### Não-Funcionais

- [ ] Resistência a ambiente de **alta temperatura**
- [ ] Operação **remota** (sem presença humana no ponto de risco)
- [ ] **Portabilidade** — acesso via escada, sem guindastes
- [ ] **Replicabilidade** — adaptável a Forno 4 e Forno 5 (e futuros)
- [ ] Solução **permanente**, não temporária

---

## 📊 Métricas de Sucesso

|Métrica|Objetivo|
|---|---|
|⏱️ Tempo de limpeza|Reduzir|
|🧍 Tempo de exposição ao risco|Eliminar ou minimizar drasticamente|
|🔁 Replicabilidade|Aplicável em todos os fornos verticais|
|🏭 Produtividade|Aumentar disponibilidade dos fornos|

---

## 🛠️ Ferramentas Atuais (a substituir ou melhorar)

- Marreta **5 kg** — abertura manual da tampa
- Chave T — remoção da tampa
- Lança inox **½"** — direcionamento do jato
- Conjunto bomba + mangueira **½"** a **~3,5 bar**

---
## 🔗 Links Úteis

- [Inscrição GP SENAI 2026](https://grandprix.decocms.com/gp-senai-2026?login=true)
- [Regulamento 2026](https://liferay.sistemaindustria.com.br/documents/d/senai/regulamento-gp-senai-2026-1-)
- [Página oficial do evento](https://senai.portaldaindustria.com.br/gp-senai-de-inovacao)

---

> [!tip] Nota estratégica Este desafio se enquadra no tema **"Robótica Colaborativa e Automação de Processos"**. Foco do pitch: **segurança humana + viabilidade técnica + replicabilidade**. Evitar soluções que dependam de robótica cara ou de difícil manutenção industrial.