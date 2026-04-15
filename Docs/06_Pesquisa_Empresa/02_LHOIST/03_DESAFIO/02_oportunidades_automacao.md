# 🚀 OPORTUNIDADES E REQUISITOS DE AUTOMAÇÃO

---

## 🎯 REQUISITOS DO SISTEMA AUTOMATIZADO

### Dimensionais e Geométricos

| Requisito | Valor |
|-----------|-------|
| **Abertura de acesso** | Circular, Ø 300 mm |
| **Profundidade de acesso** | 470 mm até primeira curva |
| **Alcance de limpeza (profundidade no canal)** | Mínimo: 5 m |
| **Cobertura angular** | 120° (variação horizontal) |
| **Número de pontos de acesso** | 36 (Forno 4) ou 48 (Forno 5) |

### Operacionais

| Requisito | Especificação |
|-----------|---|
| **Capacidade de limpeza** | Aplicar jato d'água ≥ 3,5 bar |
| **Temperatura de operação** | Ambiente 100°C+; partes em contato até 900°C |
| **Ambiente** | Espaço confinado com pó fino de CaO/CaCO₃ |
| **Método de limpeza** | Sem danificar refratário (material crítico) |

### Operação e Controle

| Requisito | Descrição |
|-----------|---|
| **Segurança do operador** | Remover exposição direta ao calor |
| **Não exigir parada do forno** | Idealmente operar com forno quente |
| **Monitoramento** | Sensores de deposição/pressão para agendamento automático |
| **Frequência flexível** | Adaptar-se a variações de PCI do LDG |

---

## 🛠️ TECNOLOGIAS DE REFERÊNCIA

### 1. Braços Robóticos Refratários

- **Aplicação:** Limpeza de fornos siderúrgicos em altas temperaturas
- **Vantagem:** Precisão, alcance, repetibilidade
- **Desafio:** Espaço confinado (Ø 300 mm é muito pequeno)
- **Fabricantes:** KUKA, ABB, Universal Robots (versões industriais)

### 2. Lança Articulada com Atuação Pneumática/Hidráulica

- **Aplicação:** Sistemas de limpeza já existentes em indústria de cimento e cal
- **Vantagem:** Simples, robusto, sem eletricidade no ambiente quente
- **Desafio:** Mecânica precisa de miniaturização para caber em Ø 300 mm

### 3. Robô Tubular Endoscópico

- **Aplicação:** Inspeção e limpeza de tubulações e espaços confinados
- **Vantagem:** Flexível, pode navegar curvas, câmera integrada
- **Desafio:** Pressão d'água de 3,5 bar pode ser agressiva

### 4. Câmeras Termográficas + PLC

- **Aplicação:** Monitoramento contínuo de deposição no canal
- **Vantagem:** Prediz necessidade de limpeza antes que canal esteja bloqueado
- **Benefício:** Agendamento inteligente de limpezas

### 5. Sistema Automático de Tampa

- **Aplicação:** Atuador pneumático para destravamento da cunha
- **Vantagem:** Mais simples, **primeiro ponto de automação viável**
- **Impacto:** Elimina uso de marreta de 5kg

---

## 💡 OPORTUNIDADES ESPECÍFICAS (PRIORIDADES)

### PRIORIDADE 1: Automatizar Abertura da Tampa

**Por quê?** 
- Primeira etapa da sobrecarga ergonômica
- Tecnologia simples (atuador pneumático)
- **ROI rápido:** Elimina 1 operação por limpeza

**Proposta:**
- Atuador pneumático acoplado ao sistema de cunha
- Comando remoto via botão
- Operador fica 5 metros distante (segurança)

**Impacto:**
- Remove esforço de marreta 5kg
- Reduz flexão de tronco inicial
- Operação mais segura (baixa força necessária)

---

### PRIORIDADE 2: Lança Automatizada com Alcance 5m

**Por quê?**
- Sistema principal de limpeza
- Tecnologia bem consolidada (fornos industriais)
- Elimina exposição direta ao calor

**Proposta:**
- Lança telescópica robusta (aço inox) com jato controlado por PLC
- Movimento vertical (em profundidade) + movimento angular (120°)
- Acionamento inicial: operador em remoto
- Progressão: Automação com câmera infravermelha para guia

**Impacto:**
- Remove operador do risco térmico
- Repetibilidade de limpeza
- Parâmetros consistentes (pressão, tempo)

---

### PRIORIDADE 3: Monitoramento Preditivo

**Por quê?**
- Incrustação é função de PCI do LDG (variável)
- Limpeza reativa (agora) → proativa (prevenir)

**Proposta:**
- Sensores de pressão diferencial no forno
- Câmera térmica observando canal regularmente
- Algoritmo que prevê necessidade de limpeza
- Agendamento automático ou alerta

**Impacto:**
- Reduz frequência de limpeza (menor manutenção)
- Otimiza eficiência energética
- Permite planejamento operacional

---

## 🚦 REQUISITOS DE INTEGRAÇÃO

### Com Supervisório do Forno

```
PLC Forno (Maerz)
    ↓
Medição: Pressão diferencial
Medição: Temperatura gases
Sinal: Ciclo de inversão de cubas (12-15 min)
    ↓
Automação de Limpeza
    ↓
Comando: Ativar sistema de limpeza
Feedback: Pressão do jato, tempo de operação
Logging: Histórico de limpezas (manutenção preditiva)
```

### Com Segurança

- **Interlocks:** Não permitir abertura simultânea de múltiplos poken in doors
- **Botão de emergência:** Parar jato imediatamente
- **Monitoramento:** Detectar falha de mangueira (queda de pressão)
- **Sensores:** Confirmação de fechamento de tampa antes de reiniciar forno

---

## 📋 TABELA COMPARATIVA: MANUAL vs AUTOMATIZADO

| Aspecto | Manual | Automatizado |
|---------|--------|---|
| **Risco ergonômico** | Crítico | Eliminado |
| **Risco térmico** | Crítico | Minimizado |
| **Frequência de parada do forno** | Frequente | Reduzida |
| **Tempo de resfriamento** | 24-48h | 2-4h (máq em 200-300°C) |
| **Ganho de produção** | ~1 dia/semana perdido | Recupera dias |
| **Conformidade NR-33** | Difícil | Facilitada |
| **Custos operacionais** | Equipes revezamento + resgate | Investimento inicial +  manutenção |
| **Inovação** | Nenhuma | Patenteável |

---

## 🎓 BENCHMARKS INTERNACIONAIS

- **Fornos Siderúrgicos (EUA/Europa):** 80% com algum nível de automação
- **Fornos de Cimento (China):** Comenzando adotar robótica (últimos 5 anos)
- **Fornos de Cal (Brasil):** Ainda maioritariamente manual

→ **Oportunidade:** Ser pioneer em Brasil

---

> **Próximo:** Consulte `../04_ANALISE/quimica_incrustacao.md` para entender soluções químicas
