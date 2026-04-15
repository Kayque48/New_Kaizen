# 💡 SOLUÇÃO

## ⏳ STATUS: AGUARDANDO DESENVOLVIMENTO

> **Nota Importante:** Esta seção captura o escopo técnico esperado da solução, a ser desenvolvida em fases de prototipagem e validação. A solução específica (tecnologia, arquitetura, design) será definida colaborativamente com Lhoist durante a Fase 1 (Validação Conceitual).

---

## 📋 Requisitos Técnicos (Baseado em Pesquisa)

### Acesso & Geom Metria
| Requisito | Especificação |
|-----------|---------------|
| **Ponto de acesso** | Poken In Door: Ø 300 mm × 470 mm profundidade |
| **Variação angular** | ±120° horizontal (limitador mecânico) |
| **Profundidade de trabalho** | Até 5 metros dentro do canal |
| **Material incrustado** | CaO/CaCO₃ sinterizado; dureza significativa |

### Ambiente Operacional
| Parâmetro | Valor |
|-----------|-------|
| **Temperatura do forno (zona queima)** | 900°C a 1.200°C |
| **Temperatura operação ideal** | 200-300°C (com forno ligado) |
| **Temperatura máxima superfícies** | Até ~100°C (plataforma) → 900°C (paredes canal) |
| **Pressão de jato necessária** | ≥ 3,5 bar (mínimo para desprender incrustação) |
| **Atmosfera** | Gases (CO₂, CO possível); pó fino (5-8 g/m³) |

### Performance Desejada
| Métrica | Alvo |
|--------|------|
| **Tempo de operação/limpeza** | <30 minutos (vs. 3+ horas manual) |
| **Cobertura de remoção** | >95% de incrustação removida |
| **Precisão de direcionamento** | ±5° angular |
| **Disponibilidade do sistema** | >95% uptime |
| **Ciclo de vida** | 10-15 anos (típico equipamento industrial) |

---

## 🔧 Conceitos Técnicos em Consideração

### Opção A: Braço Robótico Teleoperado
**Princípio:**
- Braço industrial compacto (compatível com Ø 300 mm)
- Proteção térmica (revestimento refratário/radiante)
- Controle remoto via interface joystick/tablet
- EndEffector: lança articulada com jato pressurizado

**Vantagens:**
- ✅ Precisão de movimento elevada
- ✅ Alcance potencialmente >5m com articulações
- ✅ Integração com PLC/sensores fácil
- ✅ Flexibilidade de movimentos

**Desafios:**
- ❌ Custo inicial (R$ 300k-800k)
- ❌ Proteção térmica complexa
- ❌ Manutenção especializada necessária
- ❌ Espaço de instalação (base e ponto de injeção)

---

### Opção B: Lança Telescópica Automatizada
**Princípio:**
- Lança extensível pneumática/hidráulica
- Mecanismo de abertura/fechamento de gaps automatizado
- Jato de água controlado por válvula PLC
- Suporte estrutural fixo no poken in door

**Vantagens:**
- ✅ Custo menor (R$ 150k-300k)
- ✅ Simplicidade mecânica (menos falhas)
- ✅ Proteção térmica integrada (mais direto)
- ✅ Manutenção rotineira simples

**Desafios:**
- ❌ Alcance limitado a direção frontal (menos flexibilidade angular)
- ❌ Visibilidade reduzida em profundidade
- ❌ Controle mais básico (liga/desliga vs. teleoperado)

---

### Opção C: Drone Endoscópico Aquático + Câmera Térmica
**Princípio:**
- Mini-drone flutuante/móvel com câmera termográfica
- Lança de jato acoplada ao drone
- Navegação semi-autônoma + controle remoto
- Feedback visual em tempo real

**Vantagens:**
- ✅ Visualização em profundidade
- ✅ Detecção térmica de "pontos críticos" (acúmulo maior)
- ✅ Alcance flexível (movimento 3D)
- ✅ Inovação diferenciada

**Desafios:**
- ❌ Custo elevado (R$ 400k-1M+)
- ❌ Ambiente hostil (pó + calor + umidade)
- ❌ Autonomia limitada (bateria)
- ❌ Require prototipagem customizada (não há drone pronto)

---

### Opção D: Robô de Parede/Rastreamento (Hybrid)
**Princípio:**
- Robô que se adere às paredes do canal (tipo robô limpador de painéis solares)
- Lança integrada; movimento automático ao longo de padrão programado
- Sensor de pressão/proximidade evita danos

**Vantagens:**
- ✅ Acesso a toda parede (não apenas frontal)
- ✅ Eficiência máxima (cobertura 100%)
- ✅ Potencial de automação total

**Desafios:**
- ❌ Custo extremamente alto (R$ 800k-2M)
- ❌ Complexidade ME/EE (prototipagem longa)
- ❌ Validação térmica rigorosa necessária

---

## 🛠️ Componentes Críticos (Qualquer Solução)

### Proteção Térmica
- Revestimento refratário (alumina, sílica)
- Câmaras de ar/vácuo para isolamento
- Sensores de temperatura monitorados (segurança)

### Sistema de Pressurização de Água
- Bomba independente (não prende a operação do forno)
- Regulação de pressão (3,5-8 bar)
- Sistema anti-refluxo

### Controle & Integração
- PLC com lógica de segurança (IEC 61508 / SIL recomendado)
- Interface de operador (painel, tablet, controle remoto)
- Integração optional com supervisório Maerz existente
- Sensores: temperatura, pressão, posição

### Estrutura de Suporte
- Fixação robusta no poken in door
- Amortização de vibrações (jato cria reação)
- Acesso para manutenção

---

## 📊 Roadmap de Desenvolvimento Proposto

### **Fase 1: Validação Conceitual (Semanas 1-4)**
- ✏️ Confirmação de requisitos com Lhoist
- ✏️ Análise de risco (FMEA) da operação
- ✏️ Seleção preliminar de tecnologia (Opção A/B/C/D)
- ✏️ Estimativa de custo & timeline

### **Fase 2: Projeto Executivo (Meses 1-3)**
- 🏗️ Projeto CAD detalhado
- 🏗️ Simulações FEA (elementos finitos — resistência térmica)
- 🏗️ Simulações CFD (dinâmica de fluidos — jato água)
- 🏗️ Lista de componentes de preca e lead-times

### **Fase 3: Prototipagem & Testes (Meses 3-6)**
- 🔨 Fabricação de mock-up / protótipo funcional
- 🔨 Testes de temperatura (estufa, câmara térmica)
- 🔨 Testes de pressão (bomba pressurizada)
- 🔨 Testes de alcance & precisão (bancada)

### **Fase 4: Implantação Piloto (Meses 6-12)**
- 🚀 Montagem no Forno 5 (piloto)
- 🚀 Parametrização no forno em operação
- 🚀 Testes de campo (limpezas reais)
- 🚀 Coleta de dados de desempenho

### **Fase 5: Validation & Certificação (Meses 10-14)**
- ✅ Análise de dados de piloto
- ✅ Ajustes de design (se necessário)
- ✅ Certificação de segurança (NR-compliant)
- ✅ Documentação técnica final

### **Fase 6: Escalação (Ano 2+)**
- 📈 Implantação no Forno 4
- 📈 Replicação em outras unidades Lhoist
- 📈 Otimização de custos (produção em série)
- 📈 Potencial licensing global

---

## 🔒 Considerações de Segurança

- **Tripulação de respaldo:** Sempre alguém observando operação
- **Parada de emergência:** Botão "red button" acessível
- **Sensor de temperatura:** Alerta se >limite operacional
- **Válvula anti-refluxo:** Evita refluxo de gases do forno
- **Documentação NR-compliant:** Procedimento operacional formal

---

## 📝 Próximas Ações

- **Reunião com Lhoist:** Apresentação dos conceitos técnicos acima
- **Decisão de tecnologia:** Qual opção (A/B/C/D) melhor se alinha com visão da Lhoist
- **Contato com fornecedores:** Para validar disponibilidade & lead-times
- **Início de Projeto Executivo:** Uma vez alinhados na tecnologia

---

_Solução em desenvolvimento | Abril 2026_
