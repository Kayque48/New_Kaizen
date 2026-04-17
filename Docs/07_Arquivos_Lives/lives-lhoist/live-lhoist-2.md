# 🏭 Live Q&A #2 — Lhoist / GP SENAI 2026

> Transcrição e resumo da segunda live de perguntas e respostas com **Lucas** (representante técnico da Lhoist Matozinhos)
> **Data:** 16/04/2026 — Live de esclarecimentos técnicos antes da submissão final (prazo: 17/04 às 23:59)

---

## 📐 Dimensões e Geometria — Confirmações e Novidades

| Item | Medida | Observação |
|:---|:---|:---|
| Distância entre bocas (pokendor a pokendor) | **903 mm** (~90 cm) | Confirmado com desenho enviado por e-mail |
| Diâmetro do pokendor | **300 mm** | Restrição crítica — qualquer dispositivo deve caber |
| Altura do tubo do pokendor | **900 mm** (90 cm) | Define o quanto a lança pode ser inclinada |
| Largura interna do canal (refratário a refratário) | **728 mm** | Espaço disponível de trabalho |
| Corredor lateral de trabalho | **2,5 m** | Mas há tubos de combustível que reduzem a passagem livre |
| Corredor central (entre as duas cubas) | **1.600 mm** (~1,6 m) | Operador pisa em cima de tampas nesta área |
| Largura máxima recomendada para equipamento móvel | **~1 m** | Para passar pelos tubos de combustível no corredor |
| Diâmetro interno do forno | **4.600 mm** | Para cálculo de circunferência do canal |
| Diâmetro externo do forno | **7.420 mm** | — |

> **Forma do canal:** O canal é **retangular em seção transversal**, formando uma **pista que acompanha a circunferência do forno**. A boca de visita (pokendor) é circular, mas o canal em si é uma pista retangular ao redor do cilindro interno.

---

## 🌡️ Temperaturas

| Situação | Temperatura |
|:---|:---|
| Interior do canal em funcionamento | ~**1.200°C** |
| Interior do canal no início da limpeza (forno desligado) | ~**1.200°C** |
| Interior do canal ao fim da limpeza | ~**700°C** (ponto em que a incandescência desaparece) |
| Pressão normal de operação do forno | Até **350 mBar** |
| Pressão de alívio (chapa de explosão) | **700 mBar** (chapa destrutiva — não reutilizável) |

> ⚠️ Abaixo de 700°C **não há mais incandescência** → operadores levam papéis para queimar dentro do forno e criar claridade.

---

## 🚪 Tampa dos Pokendors — Detalhamento

| Item | Material |
|:---|:---|
| Tampa externa | Aço inox AISI 306 |
| Tampa interna | Aço inox AISI 306 + massa refratária (cílico alumínio — silicato de alumínio) |

**Por que duas tampas?**
Divisão feita por ergonomia — unir as duas tampas geraria um peso muito elevado. Outros fornos da Lhoist já usam tampa única, mas aqui foi uma adaptação local.

**É possível propor nova tampa/sistema de travamento?**
- ✅ **Sim** — desde que não altere o formato do encaixe da chapa do pokendor (alterar a chapa seria extremamente custoso e demandaria parada longa).
- ✅ Pode propor mecanismo de abertura diferente (parafuso, braço mecânico, etc.).
- ✅ Pode voltar para tampa única, desde que haja mecanismo para compensar o peso (ex.: braço mecânico).

**É possível adicionar estrutura nas "orelhinhas" laterais do pokendor?**
- ✅ Sim. A estrutura é muito rígida. Referência: um robô de **1,5 toneladas** já foi colocado na plataforma sem dano algum.

---

## ⚙️ Infraestrutura Disponível

| Recurso | Status |
|:---|:---|
| Elétrica | ✅ Disponível — hoje em 380V, adaptável para 220V ou 440V |
| Pneumática (ar comprimido) | ✅ Disponível — **6 bar** na rede atual |
| Hidráulica (tubulação) | ✅ Tubulação passa pela região — sem tomada instalada, mas pode ser criada |
| Vapor | ❌ Não há caldeira na fábrica hoje |
| Trilhos | ✅ Viável — já existe em outras plantas da Lhoist (Europa) |

---

## 💧 Sistema de Limpeza Atual — Água e Pressão

| Parâmetro | Valor |
|:---|:---|
| Pressão atual de limpeza | **3,5 bar** |
| Pressão máxima testada | **5 bar** (cortou botina — muito perigoso para uso manual) |
| Reservatório de água | Caixa d'água de **500 L** na descarga do forno (nível térreo) |
| Diâmetro da lança | **½ polegada** |
| Diâmetro do bico (ponta) | **4–5 mm** (bico fino para concentrar pressão) |
| Mangueira | Trama de aço — suporta ~120°C sem rupturas registradas |

**Pode aumentar a pressão?**
- ✅ Sim, se não houver operador em risco. Para uso robótico, pressões maiores (ex: 40 bar) são discutíveis — eficazes, mas exigem direcionamento preciso para não danificar refratário.

---

## 🧹 Processo de Limpeza — Detalhes Operacionais

**Como o operador limpa os 5 m com a lança?**
- Para sujeira no fundo (perto dos 5 m): deixa a lança descansar dentro e a água faz o trabalho sozinha.
- Para sujeira no topo (teto do canal, ângulo 120°): **dobra a lança de inox** (ductilidade do material) para alcançar os ângulos não visíveis.

**O operador enxerga a incrustação?**
- ✅ Sim — a incandescência a >700°C ilumina o canal e permite distinguir cal de refratário.
- ❌ Abaixo de 700°C, precisam de claridade artificial (queimam papéis).

**Tempo de limpeza:**
| Item | Tempo |
|:---|:---|
| Por boca (pokendor) | **20–25 minutos** |
| Por sessão | ~**2 horas** (limpam ~6 bocas por vez) |
| Preparação de EPI (setup) | ~**50 minutos** |

**Quantas bocas são limpas por ciclo?**
- Não limpam todas as 36 (Forno 4) ou 48 (Forno 5) de uma vez — focar nas que mais sujam, usando visão lateral para verificar as adjacentes.

**Forno é desligado durante a limpeza?**
- ✅ Sim — soprador e injeção de combustível são desligados. O forno permanece quente e a cuba continua em movimento ("bater mesa") para não solidificar o cal.

**Janelas de parada disponíveis:**
- **8 horas/semana** para manutenção geral.
- Desse total, ~**2 horas** são usadas para limpeza de canal.
- Em semanas sem manutenção mecânica, o forno para **exclusivamente** para limpeza.

---

## 💥 Histórico de Acidentes

| Ano | Ocorrência |
|:---|:---|
| ~2006/2007 | Projeção de partículas incandescentes atingiu operador no rosto (queimou testa) |
| ~2007 | Outro operador queimou os olhos |
| 2014 | Operador pisou dentro de boca aberta (1.200°C) — **7 meses de afastamento** |

> Causa do acidente de 2014: ajudante abriu múltiplas tampas para adiantar serviço enquanto o operador principal limpava com visibilidade reduzida pelo EPI.

---

## 🔩 Monitoramento Atual do Forno

| Dado monitorado | Relação com limpeza |
|:---|:---|
| **Pressão interna** | Pressão alta pode indicar canal sujo — mas não é exclusivo |
| Temperatura do forno | — |
| Tempo de ciclo | — |
| Quantidade de combustível injetado | — |
| Quantidade de calcário injetado | — |

> Não existe monitoramento direto de "canal limpo ou sujo". O controle de qualidade é **qualitativo** — engenheiro/técnico mede a altura visível do canal ~1x/mês (meta: ~4,70 m; quando cai para ~1,5 m, está crítico).

---

## ⚠️ Restrições e Vedações

| Item | Status |
|:---|:---|
| Água direta no refratário | ❌ Proibido (encharcar — um pinginho evapora, encharcar destrói) |
| Uso de ácidos | ❌ Proibido — corrói o refratário básico junto com o cal |
| Óxido de alumínio (Al₂O₃) como abrasivo | ❌ Perigoso — funde a ~1.200°C, cria aglomerado ainda mais duro |
| Aumentar temperatura para 1.500°C | ❌ Impossível — causaria fusão generalizada e bloqueio total do forno |
| Alterar formato da chapa do pokendor | ❌ Inviável — reforma longa e muito cara |
| Alterar mecanismo de abertura/travamento | ✅ Permitido |
| Solução química (ainda não testado) | ❌ Não recomendado — alto risco ao refratário |

---

## ✅ O que É Possível / Bem-Vindo

| Proposta | Viabilidade |
|:---|:---|
| Braço mecânico para abrir/fechar tampas | ✅ Ótimo — foi bem recebido |
| Sistema de trilhos no corredor | ✅ Já existe em outras plantas da Lhoist (Europa) |
| Vibrador de impacto pneumático (substituir marreta) | ✅ Possível |
| Escova rotativa | ✅ Nunca testado — pode ser uma ideia |
| Equipamento fixo por boca | ✅ Possível — avaliar custo de manutenção |
| Equipamento móvel (carrinho) | ✅ Viável — largura máx ~1 m |
| Raspagem seca (sem água) | ✅ Possível mecanicamente (ex: martelete hidráulico ou pneumático) |
| Aumentar pressão da água (uso robótico) | ✅ Sim — sem operador em risco |
| Braço robótico com jato d'água | ✅ Bem-vinda — cuidado com precisão do direcionamento |
| Trilho de apoio para a lança | ✅ Já existe em plantas europeias |
| Criação de tomada hidráulica | ✅ Tubulação já passa pela região |

---

## 🏗️ Diferença Forno 4 × Forno 5

| Característica | Forno 4 | Forno 5 |
|:---|:---|:---|
| Número de pokendors | 36 (18/cuba) | 48 (24/cuba) |
| Colunas internas | ✅ Tem — dificultam e acumulam sujeira | ❌ Não tem — cilindro suspenso |
| Altura do forno | ~40 m | ~50–55 m |
| Frequência de limpeza | 2x/semana | A cada 15 dias |
| Dificuldade de limpeza | **Maior** | **Menor** |

> 💡 **Estratégia:** "Se acertar no Forno 4, o Forno 5 está dominado."

---

## 🧱 Sobre a Incrustação

- Material: **finos de cal fundida (CaO)** — subproduto da calcinação.
- Forma: amorfa, irregular — não tem formato definido, descasca em camadas.
- Dureza: comparável a **bloco de concreto ou tijolo** — não se mede porque hidrata ao sair do forno.
- Depósito: nas paredes do canal, no teto (região que requer os 120°), e no topo das colunas (Forno 4).
- O material derrubado **cai para dentro do próprio forno** e sai pela descarga — não precisa ser coletado.

**É possível minimizar a formação de incrustação?**
- ✅ Reduzindo ar de resfriamento (mas aumenta custo e temperatura da cal na saída).
- ✅ Lavando o calcário antes da entrada (plantas que fazem isso ainda têm limpeza, só menos frequente).
- ❌ Eliminar completamente: impossível — o calcário gera pó por creptação (trincamento ao aquecer).

**Impacto de não limpar:**
- Cubas passam a operar de forma independente → perda de qualidade e produção.
- Pressão interna sobe descontroladamente.
- Risco de **bloco** — cal solidifica em bloco único dentro do forno → **30–40 dias de parada** para remoção.

---

## 💰 Dados Financeiros

| Item | Valor |
|:---|:---|
| Custo de 1 hora de forno parado (só cal perdida) | ~**R$ 18.000–20.000** (~30 ton × R$ 600/ton) |
| Orçamento limite definido | **Não definido** — proposta aberta |
| Referência de investimento mencionada | R$ 1,5 mi pode ser viável se economizar proporcionalmente |

---

## 🔗 Relevância para o SonicGuard

| Informação da live | Impacto direto no projeto |
|:---|:---|
| Infraestrutura pneumática (6 bar) disponível | ✅ Confirmado — SonicGuard opera com 4–6 bar |
| Material se desprende com vibração | ✅ Valida princípio acústico preventivo |
| Limpeza é qualitativa — sem sensor de sujeira | ✅ Justifica camada IoT de monitoramento do SonicGuard |
| Forno para exclusivamente para limpeza em algumas semanas | ✅ Cada ciclo eliminado = economia direta de parada |
| Teto do canal (região 120°) é a mais crítica | ✅ Zona de influência das buzinas cobre omnidirecionalmente |
| Refratário não pode encharcar | ✅ SonicGuard é 100% a seco — sem risco |
| Material se aglomera em fases (pó → líquido → crosta) | ✅ Confirma janela de ação preventiva do sistema |
| Pressão normal do forno: até 350 mBar | ✅ SonicGuard opera com ar a 4–6 bar → acima da pressão interna |
| Monitoramento de pressão já existe | ✅ Pode ser integrado ao dashboard IoT existente |

---

## 📋 Perguntas e Respostas Chave — Referência Rápida

**"É possível alterar o sistema de fechamento da tampa?"**
> ✅ Sim — desde que não altere o formato do encaixe da chapa do pokendor.

**"Pode adicionar estrutura nas laterais (orelhinhas) do pokendor?"**
> ✅ Sim. Robô de 1,5 ton já foi colocado na plataforma sem dano.

**"Existe infraestrutura elétrica e pneumática disponível?"**
> ✅ Sim. Elétrica (380V, adaptável) e pneumática (6 bar). Hidráulica pode ser instalada.

**"Material se solta com vibração?"**
> ✅ Sim — mas cuidado com vibrações muito fortes que podem atingir o refratário.

**"Pode propor solução fixa por boca?"**
> ✅ Sim — avaliar custo de manutenção de 36–48 unidades.

**"Pode usar escova rotativa?"**
> ✅ Nunca testado — pode ser uma ideia válida.

**"Pode aumentar pressão da água?"**
> ✅ Sim, se não houver operador em risco. Hoje 3,5 bar; já testado 5 bar (perigoso para uso manual).

---

#live-empresa #lhoist #gp-senai-2026 #forno-maerz #pokendor #sonicguard #limpeza-canal #q-a
