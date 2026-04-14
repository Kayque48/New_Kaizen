# 🗝️ MÉTRICAS-CHAVE (KPIs)

## 📊 Métricas Técnicas de Sucesso

### Desempenho Operacional

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **Tempo operação/limpeza** | <30 min | Cronômetro; logs do PLC |
| **Cobertura remoção incrustação** | >95% | Inspeção visual pós-limpeza |
| **Precisão angular** | ±5° dentro 120° | Câmera de posicionamento |
| **Profundidade alcance** | 5+ metro | Marcação laser no canal |
| **Pressão jato mantida** | 3,5-8 bar | Manômetro digital |
| **Disponibilidade sistema** | >95% uptime | Contador de paradas/mês |
| **Ciclo de vida equipamento** | 10+ anos sem deterioração crítica | Avaliação anual |

### Segurança

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **Acidentes causados por esta operação** | 0 (zero) | Relatório de segurança Lhoist |
| **Conformidade NR-15, 17, 33, 35** | 100% atendida | Auditoria QSMS |
| **Exposição humana à queimadura** | 0 eventos | Inspeção de câmara térmica |
| **Casos de LER/DORT associados** | 0 | Dados epidemiológicos da Lhoist |
| **Incidentes de rebote/pressão** | 0 | Registro de manutenção |

### Conformidade & Qualidade

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **Certificação brasileira obtida** | Sim, antes Ano 2 | Emissão de certificado |
| **Documentação de segurança completa** | 100% | Checklist vs. NR |
| **Procedimento operacional formalizado** | Sim | Revisão com QSMS |
| **Treinamento de operadores dado** | 100% | Registro de presença |

---

## 💰 Métricas Financeiras

### Para Lhoist (Business Case da Cliente)

| Métrica | Baseline Manual | Com Automação | ROI/Ganho |
|---------|---|---|---|
| **Tempo parada forno/ano** | 60-100 dias | 0-5 dias | 55-100 dias recuperados |
| **Lucro cessante evitado/ano** | - | - | **US$ 1.3M-10.4M** |
| **Custo operação/ano** | R$ 250-450k | R$ 80k | 📉 **65% redução** |
| **Frequência limpeza** | 2×/sem (F4), 1×15d (F5) | 3-4×/sem possível | 📈 **+50% flexibilidade** |
| **Payback (1ª venda evita-downtime)** | - | **1-3 anos** | ✅ **Rentável rápido** |

### Para Você (Fornecedor)

| Métrica | Ano 1 | Ano 2 | Ano 3 |
|--------|-------|-------|-------|
| **Receita total** | R$ 940k | R$ 1.37M | R$ 2.19M |
| **COGS + OPEX** | R$ 490k | R$ 620k | R$ 870k |
| **Lucro operacional** | R$ 450k | R$ 750k | R$ 1.32M |
| **Margem bruta** | 48% | 55% | 60% |
| **Clientes (unidades em operação)** | 2 | 5 | 8 |
| **CAC (Customer Acquisition Cost)** | R$ 25k/cliente | R$ 27k/cliente | R$ 30k/cliente |
| **LTV (Lifetime Value)** | R$ 180k | R$ 240k | R$ 300k+ |
| **LTV/CAC ratio** | 7.2× | 8.9× | 10× ✅ Saudável |

---

## 📈 Métricas de Mercado & Crescimento

### Expansão

| Métrica | Ano 1 | Ano 2 | Ano 3 |
|--------|-------|-------|-------|
| **Clientes Lhoist (unidades Matozinhos)** | 2/2 | 2/2 | 2/2 |
| **Novos clientes Brasil** | 0 | 3-4 | 3-4 |
| **Total unidades em operação** | 2 | 5-6 | 8-10 |
| **Penetração Lhoist Brasil** | 40% | 60% | 80% |
| **Potencial replicação global** | - | - | Negociação com P&D |

### Reconhecimento & Posicionamento

| Métrica | Ano 1 | Ano 2 | Ano 3 |
|--------|-------|-------|-------|
| **Presença em eventos (qty)** | 2-3 | 4-5 | 6-8 |
| **Publicações/Artigos** | 1 | 2-3 | 3-4 |
| **Prêmios/Reconhecimentos** | - | 1-2 (esperado) | 2-3 |
| **Índice de referral** | 20% | 40% | 60% |

---

## 👥 Métricas de Satisfação & Retenção

### Customer Satisfaction (Net Promoter Score)

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **NPS (Net Promoter Score)** | >50 (excelente) | Pesquisa anual |
| **CSAT (Customer Satisfaction)** | >90% satisfeito/muito-satisfeito | Questionário pós-manutenção |
| **Churn rate** | <5% (retenção altíssima) | Renovação de contratos |
| **Expansion rate** | >30% (upsell) | $ adicional/cliente/ano |

### Suporte & Qualidade de Serviço

| Métrica | Alvo | Como Medir |
|---------|------|-----------|
| **Tempo de resposta (suporte)** | <4h durante horário comercial | Ticket system |
| **Tempo de resolução (técnico)** | <24h (maioria) | Histórico de chamados |
| **Uptime SLA cumprido** | 99%+ | Monitoramento automático |
| **Satisfação com suporte** | >95% | Pesquisa pós-atendimento |

---

## 🎯 Dashboard de Monitoramento (Recomendado)

Recomendamos criar um **dashboard unificado** com estas seções:

```
┌─────────────────────────────────────────────────┐
│ LHOIST AUTOMATION DASHBOARD — LIVE STATUS       │
├─────────────────────────────────────────────────┤
│                                                 │
│ PERFORMANCE                  FINANCE             │
│ ├─ Uptime: 99.2% ✅         ├─ Revenue YTD: R$ 480k
│ ├─ Limpezas: 30 (este mês)  ├─ Margin: 48%
│ ├─ Tempo médio: 22 min      ├─ MRR: R$ 40k
│ ├─ Nenhum incidente          ├─ Clientes ativos: 2
│                              │
│ SEGURANÇA                    SATISFAÇÃO
│ ├─ Acidentes: 0 ✅          ├─ NPS: 65 (excelente)
│ ├─ Paradas: 0               ├─ CSAT: 94%
│ ├─ Conformidade: 100%       ├─ Suporte <4h: 100%
│                              │
└─────────────────────────────────────────────────┘

Atualizado: Automaticamente (PLC + API)
Acesso: Web portal (você + Lhoist)
Alertas: Email/SMS se SLA violado
```

---

## 📍 Checklist de Validação (Fase a Fase)

### ✅ Fase 1: Validação (Próximas 4 semanas)
- [ ] Reunião com Lhoist confirmada
- [ ] Requisitos técnicos validados
- [ ] Business case aceito
- [ ] Carta de intenção assinada (piloto)

### ✅ Fase 2-3: Desenvolvimento (Meses 1-9)
- [ ] Projeto executivo concluído
- [ ] Protótipo funcional testado
- [ ] Testes térmicos passou (>800°C validado)
- [ ] Testes de pressão passou (>5 bar)

### ✅ Fase 4: Piloto (Meses 6-12)
- [ ] Instalação no Forno 5 bem-sucedida
- [ ] 10+ limpezas realizadas sem incidente
- [ ] Dados coletados: tempo, cobertura, segurança
- [ ] Satisfação cliente >90%

### ✅ Fase 5: Certificação (Meses 10-14)
- [ ] Certificação NR completa obtida
- [ ] Documentação formal concluída
- [ ] Treinamento de operadores dado
- [ ] Procedimento operacional formalizado

### ✅ Fase 6: Escalação (Ano 2+)
- [ ] Forno 4 implantado
- [ ] 2ª cliente (Brasil) negociando
- [ ] Replicação em progressão (5+ unidades)
- [ ] Receita em regime crescente

---

_Métricas-chave consolidadas | Abril 2026_
