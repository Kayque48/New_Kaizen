# 🤖 New Kaizen — Pesquisa Técnica: Agentes de Limpeza Alternativos
### Foco: Ultrassom de Potência + Alternativas ao Ar Comprimido
> Projeto GP SENAI 2026 — Automatização de Limpeza dos Fornos Maerz | Lhoist Matozinhos
> Última atualização: 15/04/2026

---

## 📋 Índice

1. [Contexto do Problema](#contexto-do-problema)
2. [Restrições Críticas da Solução](#restrições-críticas-da-solução)
3. [Química da Incrustação](#química-da-incrustação)
4. [Alternativas ao Ar Comprimido](#alternativas-ao-ar-comprimido)
5. [Ultrassom de Potência — Aprofundamento](#ultrassom-de-potência--aprofundamento)
6. [Integração com a Solução Atual](#integração-com-a-solução-atual)
7. [Abordagem Híbrida Recomendada](#abordagem-híbrida-recomendada)
8. [Comparativo Final](#comparativo-final)

---

## 🏭 Contexto do Problema

### Empresa e Unidade

| Parâmetro | Valor |
|---|---|
| **Empresa** | Lhoist Group — maior produtora mundial de cal e minerais |
| **Unidade** | Matozinhos, MG (MG-424 km 53) |
| **Fornos** | 2 × Maerz PFR (Fluxo Paralelo Regenerativo de Dupla Cuba) |
| **Total de pontos de limpeza** | 84 Poken In Doors (36 no Forno 4 + 48 no Forno 5) |

### Forno Maerz PFR — Funcionamento Resumido

```
        [CUBA A]              [CUBA B]
        ┌──────┐              ┌──────┐
        │PREAQ.│◄────────────►│CALC. │
        │<750°C│   CANAL      │1100°C│
        └──────┘◄═════════════►└──────┘
                  (Crossover)
```

As duas cubas operam em **alternância de 12–15 minutos**. Gases quentes (~900°C) passam pelo canal de ligação (crossover), onde partículas finas de cal (~3–8% da carga) aderem às paredes e formam incrustação sinterizada.

### Poken In Doors — Especificações

| Parâmetro | Valor |
|---|---|
| Diâmetro da abertura | **300 mm** |
| Profundidade da abertura | **470 mm** |
| Profundidade de incrustação | **1 a 5 m** a partir do piso |
| Cobertura angular necessária | **120°** |
| Peso da tampa | **~20 kg** (sistema de cunha interlock) |

### Frequência de Limpeza

| Forno | Nº de Poken In Doors | Frequência | Exposições/Ano |
|---|---|---|---|
| Forno 4 | 36 (18 por cuba) | 2× por semana | ~104 |
| Forno 5 | 48 (24 por cuba) | A cada 15 dias | ~24 |

---

## ⚠️ Restrições Críticas da Solução

Qualquer agente de limpeza deve respeitar obrigatoriamente:

| Restrição | Motivo |
|---|---|
| 🚫 **Água NÃO pode tocar o refratário** | Choque térmico destrói estrutura interna do forno |
| 📐 Dispositivo deve caber em **300 mm** | Diâmetro fixo das Poken In Doors |
| 🔥 Materiais devem suportar **calor extremo** | Gases a >900°C dentro do canal |
| 🪜 **Portabilidade** obrigatória | Acesso via escada; sem guindastes |
| ✅ Solução **permanente**, não paliativa | Requisito explícito do desafio |

---

## 🧪 Química da Incrustação

> **Insight crítico:** A incrustação é uma **ligação química sinterizada**, não "sujeira". Soluções puramente mecânicas/pneumáticas são paliativas.

### Reação Principal

```
CaCO₃ (s) → CaO (s) + CO₂ (g)
  ΔH = +178 kJ/mol
  Temperatura operacional: 1.100°C
```

### Ciclo de Formação

```
1. Calcário com impurezas (K₂O, Na₂O, Fe₂O₃, SiO₂)
              ↓
2. Calcinação → finos fundidos gerados
              ↓
3. Fase líquida → K₂O eutético funde a ~700°C
                  Silicatos fundidos: CaO–SiO₂–Fe₂O₃
              ↓
4. Aderência → crosta sinterizada com ligação química ao refratário
              ↓
5. Obstrução → bloqueio do canal → problema operacional
```

### Principal Culpado: K₂O / Na₂O

Apenas **0,5% de K₂O** no calcário já gera fase líquida a 700–800°C — muito abaixo da temperatura de operação. Isso é a causa raiz da formação rápida de incrustação.

### Composição Típica da Crosta

| Componente | % Típico | Perigo |
|---|---|---|
| CaO | 40–50% | Médio |
| SiO₂ | 15–25% | Médio |
| Fe₂O₃ | 10–15% | Alto (fundente) |
| **K₂O / Na₂O** | **0,5–2%** | 🔴 **CRÍTICO** |
| Al₂O₃ | 5–10% | Baixo |

### Propriedades Mecânicas da Crosta

| Propriedade | Relevância para remoção |
|---|---|
| **Dureza alta** | Difícil remover só por abrasão superficial |
| **Adesão muito alta** | Ligação química com refratário — não descola por sopro |
| **Fragilidade térmica média-alta** | ✅ Oportunidade: choque térmico funciona |
| **Porosidade média** | ✅ Permite infiltração de agentes |
| **Expansão térmica diferente do refratário** | ✅ Gera tensões internas aproveitáveis |

---

## 💡 Alternativas ao Ar Comprimido

### 1. 🧊 Gelo Seco (CO₂ Sólido)

**Mecanismo duplo:**
- Choque térmico: −78°C vs. crosta quente → microfissuras
- Recarbonatação química: `CaO + CO₂ → CaCO₃` com expansão volumétrica de **+118%**
- Sublimação: CO₂ passa de sólido → gás (expansão 800×), fragmentando a crosta de dentro para fora

**Vantagens:**
- Sem água → zero risco ao refratário
- Sem resíduo líquido
- Alta eficiência (remove 90%+ da crosta)
- Tecnologia industrial consolidada

**Limitações:**
- Funciona entre **650–850°C** — forno precisa estar parcialmente resfriado (6–12h)
- Logística de CO₂ sólido
- Acima de 900°C a reação não ocorre

**Janela de operação ideal:** forno parcialmente resfriado a 700–850°C.

---

### 2. 💨 Vapor Seco (Dry Steam)

**Mecanismo:** Vapor acima de 150°C em alta pressão dissolve parcialmente os silicatos alcalinos (especialmente K₂O/Na₂O) sem molhar o refratário — o vapor se dissipa sem condensar se a temperatura for controlada.

**Vantagens:**
- Combina ação química (dissolução de álcalis) com ação mecânica (pressão)
- Temperatura controlável para evitar choque térmico no refratário
- Usado em limpeza industrial de fornos cerâmicos

**Limitações:**
- Requer controle preciso de temperatura/pressão para não condensar
- Equipamento mais complexo que ar comprimido

---

### 3. 🔩 Vibração Ultrassônica *(ver seção dedicada)*

Transdutor piezoelétrico acoplado à lança gera ondas mecânicas de 20–40 kHz que quebram a ligação sinterizada por fadiga. Detalhamento completo na próxima seção.

---

### 4. ⚡ Soda Blasting (Bicarbonato de Sódio)

**Mecanismo:** Partículas de NaHCO₃ projetadas com ar comprimido reagem com o CaO da crosta:

```
NaHCO₃ → Na₂O + H₂O + CO₂  (se atingir temperatura alta)
Na₂O + CaO → reação alcalina  →  menor adesão
```

**Vantagens:**
- Menos agressivo ao refratário que areia ou alumina
- Partícula macia: não deixa resíduo abrasivo duro
- Compatível com sistema pneumático existente (substitui direto o ar)

**Limitações:**
- Ainda usa pressurização (mas com consumível)
- Logística de reposição de bicarbonato

---

### 5. 🌡️ Ciclagem Térmica Controlada

**Mecanismo:** Explora diferença de coeficiente de expansão térmica entre crosta e refratário:

```
CaO: α ≈ 13,5 × 10⁻⁶ /°C
Refratário: α ≈ 5–8 × 10⁻⁶ /°C

ΔT de 1.100°C → Δexpansão ≈ 2× → fadiga → quebra
```

O robô aplicaria calor localizado (maçarico de plasma ou resistência) seguido de resfriamento com CO₂ gasoso.

**Vantagens:**
- Sem consumível fluido
- Automatizável via ciclos programáveis
- Ataca a interface crosta–refratário diretamente

**Limitações:**
- Experimental — não consolidado industrialmente ainda
- Risco de dano colateral ao refratário se mal calibrado

---

## 🔊 Ultrassom de Potência — Aprofundamento

### O que é

**Ultrassom de potência (Power Ultrasound)** usa ondas mecânicas acima de **20 kHz** transmitidas por um transdutor piezoelétrico acoplado a uma lança metálica. A vibração propaga-se pelo metal e chega à crosta como energia mecânica de alta frequência — sem necessidade de fluido de transmissão.

---

### Mecanismos de Quebra

#### 1. Fadiga por Ressonância

A crosta sinterizada (CaO + silicatos) e o refratário têm respostas mecânicas diferentes à mesma frequência de vibração. O ultrassom gera **tensão cisalhante repetitiva na interface crosta–refratário** a dezenas de milhares de ciclos por segundo. Essa fadiga acumulada rompe a ligação química antes de qualquer dano ao refratário.

#### 2. Propagação de Microfissuras

A crosta sinterizada é naturalmente frágil (estrutura cristalina com microfissuras internas). Cada ciclo de vibração **propaga essas fissuras** incrementalmente. Com ~20.000–40.000 ciclos por segundo, a crosta se fragmenta de dentro para fora.

#### 3. Sinergia com Diferença Térmica

O mecanismo é amplificado pela diferença de expansão térmica já existente entre crosta e refratário. A vibração ultrassônica adiciona ciclagem mecânica sobre um material já em tensão interna pelo gradiente térmico do forno.

---

### Componentes do Sistema

```
[Transdutor Piezoelétrico] → [Lança Telescópica Inox = Waveguide] → [Sonotrodo na Ponta]
     20–40 kHz                     conduz vibração                    amplifica + contato
     fica fora do forno             tubo inox 304/316                  usinado em inox/Ti
     zona fria (<80°C)              suporta até ~600°C                 geometria cônica
```

#### Transdutor Piezoelétrico
- Converte energia elétrica em vibração mecânica
- **Temperatura máxima:** ~80°C — **fica obrigatoriamente fora do canal**, na extremidade fria da lança
- Na arquitetura atual do projeto (lança telescópica com atuador externo), isso já é respeitado naturalmente

#### Waveguide (Guia de Onda)
- A lança telescópica de inox austenítico (304 ou 316) já prevista no projeto atua como guia de onda
- Inox tem boa condutividade de ondas mecânicas e suporta temperaturas de até ~600°C contínuo (inox 310)
- **Requisito construtivo:** junções telescópicas devem ser rosqueadas e tensionadas (folga mínima) — encaixes soltos dissipam a vibração

#### Sonotrodo
- Peça na ponta da lança com geometria especial (cônica ou escalonada)
- **Amplifica a amplitude de vibração em 3 a 5 vezes** — funciona como buzina mecânica invertida
- Material: inox de alta temperatura ou titânio (Ti-6Al-4V)
- Entra em contato direto com a crosta ou transmite vibração pelo ar/gás do canal

---

### Parâmetros Técnicos de Referência

| Parâmetro | Valor Típico Industrial |
|---|---|
| Frequência | 20–40 kHz |
| Potência do transdutor | 500 W – 2 kW |
| Amplitude de vibração na ponta (sonotrodo) | 20–100 μm |
| Temperatura máxima do waveguide (inox 310) | ~600°C contínuo |
| Temperatura máxima do transdutor | ~80°C (fica fora do canal) |
| Tempo de operação por poken door | 30–90 segundos estimado |

---

### Por que é Especialmente Adequado para Este Ambiente

| Critério do Desafio | Como o Ultrassom Atende |
|---|---|
| 🚫 Sem água no refratário | Meio de transmissão é o metal, não fluido |
| 📐 Caber em 300 mm | Lança existente é o waveguide — sem componente extra |
| 🔥 Funcionar em alta temperatura | Transdutor fica fora; lança inox 310 suporta 600°C |
| ✅ Solução permanente | Sem consumível; manutenção apenas do transdutor |
| 🔁 Replicável | Mesmo sistema para Forno 4 e Forno 5 |

---

### Limitações e Considerações

| Limitação | Mitigação |
|---|---|
| Custo do transdutor (médio-alto) | Offset pelo custo zero de consumível em operação |
| Lança telescópica precisa de junções rígidas | Especificação construtiva — rosqueado tensionado |
| Tempo de operação a validar (crosta >5cm) | Abordagem híbrida com ar comprimido resolve |
| Calibração periódica do transdutor | Manutenção programada (~6 meses) |
| Temperatura do waveguide limita profundidade máxima em canal muito quente | Verificar perfil térmico do canal — provável que temperatura caia ao longo dos 5m |

---

## 🔧 Integração com a Solução Atual

A solução atual prevê: **estrutura aérea com trilho (X/Y) + lança telescópica de inox + ar comprimido + atuador pneumático para tampa + câmera termográfica**.

O ultrassom **não substitui** — **modifica a lança**:

### Modificações Necessárias

**Na lança telescópica:**
- Junções rosqueadas com tensionamento (já é boa prática; não muda geometria)
- Sonotrodo usinado como ponta intercambiável (fixação na extremidade avançada)
- Canal interno da lança pode manter saída de ar para a abordagem híbrida

**No sistema externo (trilho):**
- Caixa do transdutor + gerador de frequência montada na estrutura aérea, fora da zona quente
- Cabo de alimentação elétrica ao longo do trilho (similar ao cabo dos stepper motors)
- Controle integrado ao painel existente: botão/parâmetro de ciclo de limpeza

**No painel de controle:**
- Parâmetro adicional: potência e duração do pulso ultrassônico
- Ciclo automático proposto: `abre tampa → estende lança → ultrassom (30s) → ar comprimido (10s) → retrai → fecha`

---

## ⚡ Abordagem Híbrida Recomendada

> A combinação mais eficiente e diferenciada para o pitch do GP SENAI 2026.

### Lógica do Ciclo Completo

```
1. Atuador pneumático abre a tampa (~20 kg)
              ↓
2. Lança telescópica avança para profundidade programada (1–5 m)
              ↓
3. Ultrassom ativa por 30–60 segundos
   → Fadiga e fragmenta a ligação química da crosta
              ↓
4. Jato de ar comprimido (6–8 bar) por 10–20 segundos
   → Remove os fragmentos soltos do canal
              ↓
5. Câmera termográfica confirma limpeza completa
   (parede limpa = mais quente; crosta = mais fria)
              ↓
6. Lança retrai → atuador fecha tampa
              ↓
7. Sistema move para próxima Poken In Door (trilho X/Y)
```

### Por que Híbrido é Superior

- **Ultrassom isolado:** quebra a ligação, mas fragmentos ficam no canal
- **Ar comprimido isolado:** remove pó solto, mas tem baixa eficácia em crosta fortemente aderida
- **Juntos:** o ultrassom faz o trabalho difícil (quebrar ligação química), o ar comprimido faz o trabalho fácil (varrer fragmentos)

---

## 📊 Comparativo Final

| Método | Precisa de água? | Risco ao refratário | Eficácia em crosta dura | Consumível | Temperatura de operação | Viabilidade no robô |
|---|:---:|:---:|:---:|:---:|:---:|:---:|
| Ar comprimido (atual) | ❌ | Baixo | Média | Ar | Qualquer | ✅ Alta |
| **Ultrassom de potência** | ❌ | **Nulo** | **Alta** | **Nenhum** | **Qualquer** | **✅ Alta** |
| Gelo Seco | ❌ | Baixo | Alta | CO₂ sólido | 650–850°C | ⚠️ Média |
| Vapor Seco | Mínimo | Médio | Média | Vapor | Controlada | ⚠️ Média |
| Soda Blasting | ❌ | Baixo | Média-Alta | Bicarbonato | Qualquer | ✅ Alta |
| Ciclagem Térmica | ❌ | Médio | Alta | Nenhum | Controlada | ⚠️ Média |
| **Híbrido (Ultrassom + Ar)** | ❌ | **Nulo** | **Muito Alta** | **Ar** | **Qualquer** | **✅ Alta** |

---

## 🎯 Recomendação para o Pitch

A **abordagem híbrida (Ultrassom + Ar Comprimido)** é a mais forte para o GP SENAI 2026 pelos seguintes motivos:

1. **Diferenciação técnica** — ultrassom ataca o problema na raiz (ligação química), não apenas na superfície
2. **Zero risco ao refratário** — nenhum fluido, apenas vibração mecânica
3. **Sem consumível** — operação de baixo custo contínuo
4. **Integração elegante** — a lança telescópica já prevista vira o waveguide, sem componente extra de grande porte
5. **Ciclo confirmado por câmera termográfica** — fechamento técnico convincente
6. **Alinhamento com "Go for Zero"** — zero presença humana, zero dano ao equipamento, zero consumo de água

---

> _New Kaizen · GP SENAI 2026 · SENAI Limeira_
