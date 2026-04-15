# 🔥 FORNO MAERZ PFR - TECNOLOGIA E FUNCIONAMENTO

## 🏗️ ARQUITETURA DO FORNO

**Tipo:** Forno Vertical Regenerativo de Dupla Cuba com Fluxo Paralelo (Maerz PFR)

```
        [CUBA A]              [CUBA B]
        ┌──────┐              ┌──────┐
        │ PREHEAT│◄────────────│CALCIN│
        │ ZONE  │             │ ZONE │
        │ (<750°C)│  CANAL    │(1100°C)│
        └───────┤◄═══════════►├──────┘
                  (Crossover)
        ↑ Calcário           ↑ Calcário
        alimentado           alimentado
        no topo              no topo
        ↓ Cal virgem         ↓ Cal virgem
        descarregada         descarregada
        na base              na base
```

### Princípio de Funcionamento

As **duas cubas operam em alternância** a cada **12 a 15 minutos:**

1. Enquanto **Cuba A CALCINA** (queima com chama, 1.100°C)
2. **Cuba B PRÉ-AQUECE** (recebe gases quentes vindos pelo canal)
3. O **canal central (crossover)** permite fluxo de gases entre cubas
4. Inversão automática do fluxo a cada ciclo

**Vantagens da Regeneração:**
- Máxima recuperação de calor
- Eficiência térmica até **85%** (maior do mercado)
- Consumo específico: ~850 kcal/kg de cal

---

## 🌡️ ZONAS DE OPERAÇÃO

| Zona | Posição | Temperatura | Função | Tempo de Residência |
|------|---------|-------------|--------|-------------------|
| **Pré-aquecimento** | Superior | 20°C → 750°C | Aquecer calcário gradualmente | 5–6 horas |
| **Calcinação** | Centro | ~1.100°C | Decomposição térmica do CaCO₃ | — |
| **Resfriamento** | Inferior | 1.100°C → 100°C | Esfriamento com ar soprado | Até saída |
| **Total** | — | — | — | ~36 horas residência |

### Reação Química Principal

```
CaCO₃ (calcário) → CaO (cal virgem) + CO₂↑

Temperatura: 850°C (início) — 1.200°C (ótimo) — 1.100°C (operacional)
Energia: 178 kJ/mol (endotérmica)
```

---

## 🔫 INJEÇÃO DE COMBUSTÍVEL

### Estrutura

- **33 lanças verticais por cuba** (total: 66 lanças no forno)
- Injeção: **Combustível + Ar de combustão**
- Sistema de resfriamento das lanças (ar soprado nas bases)
- Controle online de pressão e temperatura

### Combustível: LDG (Linz-Donawitz Gas)

Consulte documento dedicado: `combustivel_ldg.md`

---

## 💨 CANAL DE LIGAÇÃO (CROSSOVER CHANNEL)

### Característica Física

| Atributo | Valor |
|----------|-------|
| **Função** | Conectar as duas cubas; permitir fluxo de gases |
| **Temperatura** | Gases saem da zona de calcinação >900°C |
| **Problema** | Acúmulo de finos fundidos (pó de cal parcialmente sinterizado) |
| **Profundidade típica de incrustação** | 1–5 metros |
| **Material incrustado** | CaO/CaCO₃ fundido + impurezas (K₂O, Na₂O, Fe₂O₃) |

### Por que se forma incrustação?

1. Calcário alimentado no topo possui granulometria variada
2. **Partículas finas (<10 mm)** acompanham o fluxo de gás quente
3. Gases quentes carregam pó fino pelo **canal de ligação (crossover)**
4. Em contato com **paredes mais frias do canal**, o pó **adere e solidifica**
5. **Acúmulo progressivo obstrui o canal** → prejudica fluxo de gases e eficiência
6. A estrutura "Suspended Cylinder" (Maerz) reduz acúmulo, mas **não elimina o problema**

---

## 🔧 ACESSO PARA LIMPEZA: POKEN IN DOORS

### Dimensões e Localização

| Especificação | Forno 4 | Forno 5 |
|---|---|---|
| **Quantidade** | 36 portas (18 por cuba) | 48 portas (24 por cuba) |
| **Diâmetro** | 300 mm | 300 mm |
| **Profundidade** | 470 mm | 470 mm |
| **Sistema de Fechamento** | Cunha de travamento (~20 kg) | Cunha de travamento (~20 kg) |
| **Ângulo de cobertura** | 120° (variação horizontal) | 120° (variação horizontal) |
| **Alcance de limpeza** | Até 5 m (profundidade no canal) | Até 5 m (profundidade no canal) |

### Sistema de Cunha (Tampa de Fechamento)

```
Vista de cima:
      ╔═══════════╗
      ║ [Latch]   ║
      ║  /════\   ║
      ║ /      \  ║  ← Sistema de cunha
      ║/════════\ ║     cruzada interlock
      ╚═══════════╝
```

- **Peso:** ~20 kg
- **Abertura:** Requer marreta 5 kg com impacto repetitivo (manual)
- **Travamento:** Tipo cunha interlock — difícil de abrir quando quente/emperrado

---

## 📊 BALANÇO DE MASSA

### Descarbonatação

```
100% calcário (100 kg) 
→ 56% cal virgem (56 kg) + 44% CO₂ gasoso (44 kg)
```

### Concentração de Finos e Pó

| Parâmetro | Valor |
|-----------|-------|
| **Concentração de pó nos gases de exaustão** | 5–8 g/m³ |
| **Temperatura dos gases de exaustão** | 90–130°C (saída pré-aquecedor) |
| **Teor de finos (<10mm) gerados** | Tipicamente 3–8% da carga alimentada |
| **Temperatura de fusão do pó** | >1.200°C |
| **CO₂ residual na cal (bem operado)** | <2,5% |
| **Reatividade de cal (Maerz)** | >360 ml (alta qualidade) |

---

## ⚡ EFICIÊNCIA MAERZ PFR

| Métrica | Valor |
|---------|-------|
| **Eficiência térmica** | Até 85% |
| **Consumo específico** | ~850 kcal/kg |
| **Ganho vs. fornos antigos** | +54% eficiência (upgrade documentado) |
| **Flexibilidade de granulometria** | 25–100 mm |
| **Combustível compatível** | Gás natural, LDG, combustíveis auxiliares |

---

> **Próximo:** Consulte `combustivel_ldg.md` para entender variações de combustível e pressão
