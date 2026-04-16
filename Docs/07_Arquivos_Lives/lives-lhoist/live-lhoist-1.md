# 🏭 Desafio da Empresa — Limpeza de Canal de Forno LHoist

> Transcrição e resumo da live de Q&A com **Lucas** (representante técnico da empresa **Loast**)
> Próxima sessão: **quinta-feira, dia 16**

---

## 🏢 Empresa e Contexto

**Empresa:** LHoist (grupo com várias unidades no Brasil)
**Processo:** Fabricação de **cal** (óxido de cálcio — CaO)
**Forno:** Tipo **MERS** — *Forno de Fluxo Paralelo Regenerativo* (vertical)
> O nome "MERS" vem da empresa alemã projetista. Outros projetos similares: **Project SIM** (até 3 cubas).

A solução desenvolvida, se for boa, pode ser **replicada para outras unidades** do grupo e até para outras empresas com o mesmo tipo de forno.

---

## 🔥 O Problema Central

O canal de conexão entre as duas cubas do forno **acumula cal aglomerada** (encrustada), bloqueando o fluxo de ar entre elas. Quando isso acontece, as duas cubas param de funcionar como conjunto e o forno **desequilibra completamente**.

A limpeza atual é **100% manual**, feita por operador auxiliar de campo com lança d'água — um serviço pesado, perigoso e que para a produção.



---

## ⚙️ Como o Forno Funciona

O forno MERS tem **duas cubas** (torres) unidas por um **canal de conexão**:

```
     CUBA 1              CUBA 2
  [Queimando]  ←→  [Regenerando]
       │               │
       └──── CANAL ────┘
         (deve estar limpo)
```

- Ciclo de ~10 minutos: as funções se invertem
- O ar quente de uma cuba aquece a outra pelo canal
- Se o canal entope → cubas trabalham separadas → forno desequilibrado

**Dimensões importantes:**
| Item | Medida |
|------|--------|
| Altura total do forno | ~35 m (entrada calcário → saída cal) |
| Altura da plataforma de trabalho | ~25 m do chão |
| Pokendor (porta de acesso) — diâmetro | 300 mm |
| Canal interno (refratário a refratário) | 728 mm |
| Profundidade a limpar (por pokendor) | 90 cm até 5 m |
| Largura do canal | ~2,5 m |

---

## 🚪 Pokendor — A Porta de Acesso

- Tubo cilíndrico de aço no teto do canal
- Funciona como "janela de visita" pressurizada
- **Diâmetro: 300 mm** — restrição importante para qualquer equipamento
- Abre para acesso manual ou inspeção
- Forno 4: ~26 pokendors | Forno 5: ~62 pokendors

---

## ☠️ Condições de Trabalho (Riscos Atuais)

| Risco | Detalhe |
|-------|---------|
| Temperatura externa | ~40–50°C na plataforma |
| Temperatura interna (início da limpeza) | ~1.000–1.100°C |
| Temperatura interna (fim das 2h) | ~750–800°C |
| Forno durante limpeza | **Desligado** (mas com calor armazenado) |
| Abertura de múltiplas bocas | Já causou **acidente grave** (6 meses de afastamento) |
| Exposição ao canal aberto | Risco de queda, queimadura, explosão |

> ⚠️ **Acidente registrado:** Operador abriu várias tampas ao mesmo tempo e pisou em uma boca aberta → afastamento de 6 meses.

---

## 🧹 Como é feita a limpeza hoje

1. Forno é **desligado** (mas permanece quente)
2. Operador sobe escadas até a plataforma (~25 m)
3. Abre o pokendor manualmente
4. Usa **lança d'água** para hidratar e quebrar os blocos de cal
5. O material derrubado **cai dentro do próprio forno** e sai com a carga de cal

**Frequência:**
- Forno 4: mais frequente (tem colunas que acumulam sujeira)
- Forno 5: menos frequente (cilindro suspenso, sem colunas)
- Em média: **até 3 limpezas por semana**, **2 horas cada**
- Em 2h, o operador limpa ~6 bocas (~20–25 min por boca)

**Equipe:** 5 funcionários em turnos — cargo: *Operador Auxiliar de Campo*

---

## 💰 Impacto Financeiro da Parada

> O principal custo não é a mão de obra — é a **perda de produção**.

- Produção média: **30 ton/hora** (média entre os dois fornos)
- Forno 5 sozinho: ~600 ton/dia
- **2h paradas, 3x/semana** = ~600 toneladas/semana perdidas
- Custos fixos continuam rodando durante a parada (energia, caminhões, equipamentos)

---

## 🧱 O Material: Cal Aglomerada

- **Cal (CaO / óxido de cálcio)** reage violentamente com água → vira hidróxido
- Quando partículas finas ficam paradas em região quente → **fundem e formam blocos**
- Dureza: comparável a **tijolo intertravado de concreto** → precisa de força para quebrar
- A sujeira varia por pokendor: pode estar na boca (90 cm) ou até 5 m de profundidade
- Os blocos são **derrubados para dentro do forno** — não precisam ser removidos, só deslocados

---

## 🔬 Restrições Técnicas Críticas

### Água e Refratário
- **Água NÃO pode encostar no refratário** (especialmente o básico/magnesiano)
- Refratário básico hidrata → **trinca por reação química**, não só choque térmico
- A água atual é tolerada porque evapora instantaneamente — contato prolongado = dano
- O operador hoje usa visão para distinguir cal (pode molhar) de refratário (não pode)

### Tipos de Refratário
| Tipo | Composição | Localização | Sensibilidade |
|------|------------|-------------|---------------|
| Ácido (silicoaluminoso) | Sílica + alumínio | Parte inferior do canal | Menos reativo com água |
| Básico (magnesiano) | Magnésio | Resto do canal | **Muito sensível** a água e ácidos |

### Químicos
- **Produtos ácidos** corroem o refratário básico → proibido
- Calor amplifica reações → risco de **explosão ou incêndio**
- Nenhum reagente químico foi testado até hoje

### Estrutura do Forno
- **Não pode modificar a estrutura interna** — refratários têm formato específico, poucos fornecedores, reforma demora 6–7 meses
- Forno é **estanque** (como panela de pressão) — ar comprimido precisaria de saída segura

---

## ✅ O Que É Permitido / Possível

| Possibilidade | Resposta |
|---------------|----------|
| Acessar múltiplos pokendors ao mesmo tempo | ✅ Sim — mas sem expor operador próximo às bocas abertas |
| Usar ar comprimido | ⚠️ Possível — mas precisa controlar pressurização do forno estanque |
| Usar jato de nitrogênio (choque térmico) | 🔄 Pode ser uma via — ainda não testado |
| Usar vapor d'água | ✅ É basicamente o que já acontece hoje |
| Instalar equipamento fixo em cada boca | ✅ Possível — mas atenção ao custo (62 bocas no forno 5) |
| Solução portátil (uma lança, várias bocas) | ✅ Modelo atual — é uma opção válida |
| Operação remota | ✅ **Bem-vinda** — quanto menos operador no local, melhor |
| Exoesqueleto / auxílio físico ao operador | ✅ Também aceito |
| Raspagem (deixar o material cair no forno) | ✅ É exatamente o que fazem hoje |
| Padronização de altura/tempo de limpeza | ✅ Desejável |
| Solução com infraestrutura da plataforma | ✅ Há ar comprimido, elétrica e hidráulica (óleo a 5–6 bar) na plataforma |

---

## 🎯 Objetivos da Solução Ideal

1. **Eliminar ou reduzir drasticamente** a exposição humana à região quente
2. **Reduzir o tempo de parada** do forno (hoje: 2h, 3x/semana)
3. **Distinguir cal de refratário** para não danificar o forno
4. **Custo viável** para replicar em múltiplas bocas e outras unidades
5. **Manter ou superar** a eficiência da limpeza manual

> **Não há target de custo definido** — a empresa deu liberdade para pensar fora da caixa, mas viabilidade econômica será avaliada.

---

## 🧠 Hints Dados pelo Lucas

- Operadores mais velhos faziam o serviço muito bem → a **habilidade/sensibilidade humana** é difícil de substituir
- A sujeira no centro do canal (sem colunas) é mais fácil de prever e atacar
- O forno 5 (cilindro suspenso, sem colunas) suja menos e mais previsível
- Equipamentos grandes podem não passar pelos tubos de combustível fixos na plataforma

---

## 📐 Diagrama Esquemático (textual)

```
                    [TOPO — entrada calcário]
                           |
                    ┌──────┴──────┐
                    │   CUBA 1    │   CUBA 2
                    │  [queima]   │  [regenera]
                    │             │
              ┌─────┴─────────────┴─────┐
              │   CANAL DE CONEXÃO      │
              │  ← ar quente →          │  ← área a limpar
              │  [pokendors aqui]        │
              └─────────────────────────┘
                           |
                    [SAÍDA — cal pronta]
```

---

## 📅 Próximos Passos

- [ ] Aguardar planta técnica que Lucas prometeu enviar (sem dados de refratário)
- [ ] Acompanhar live do dia 16 (próxima sessão com a empresa)
- [ ] Pesquisar: forno MERS / forno de fluxo paralelo regenerativo
- [ ] Pesquisar: refratário básico (magnesiano) — sensibilidade a água
- [ ] Definir abordagem da solução com a escuderia
- [ ] Preencher [[Lean Canvas — 9 Blocos]] com base nessas informações

---

## Notas Relacionadas
- [[Lean Canvas — 9 Blocos]]
- [[Design Thinking]]
- [[Duplo Diamante]]
- [[Cases e Exemplos]]

---
#desafio-empresa #loast #forno-mers #cal #limpeza-canal #grand-prix #segurança-trabalho
