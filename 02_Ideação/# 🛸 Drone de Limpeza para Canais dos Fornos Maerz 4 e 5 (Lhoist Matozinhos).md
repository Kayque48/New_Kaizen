# Projeto de Automatização - Conceito Proposto v2.0

## 📝 Descrição Geral
Sistema composto por um **drone hexacóptero/octocóptero de alta carga** (payload 15–25 kg) integrado a um **carretel terrestre inteligente** (sistema tethered independente). O objetivo é a limpeza e inspeção técnica de fornos industriais sem exposição humana ao risco.

---

## 🛠️ Componentes Principais

### 1. Drone Principal
* **Função:** Voa até a boca do *poken in door* (300 mm) e posiciona a ponta da mangueira.
* **Sensores:** Câmera 4K térmica + LiDAR para mapeamento 3D autônomo ou visualização em tempo real.
* **Alcance:** Profundidade de 1–5 m com ângulo de visão de 120°.

### 2. Carretel Terrestre (Sistema Tethered)
* **Mecânica:** Carretel motorizado independente com 40–60 m de mangueira ½" ultra-leve.
* **Operação:** Enrolamento automático e controle remoto.
* **Interface do Operador:** Console com alternância de telas:
    * **Tela 1:** Visão geral do drone (posicionamento e trajeto).
    * **Tela 2:** Visão exclusiva da câmera na ponta da mangueira.

### 3. Ponta da Mangueira (Tip Assembly)
* **Visão:** Câmera térmica de alta temperatura (suporta até 1100 °C).
* **Estabilização:** *Thrusters* pneumáticos integrados (4–6 micro-jatos de ar comprimido) com estabilização automática via **IMU + PID** (controle vetorial de alta precisão).
* **Limpeza:** Jato de água a 3,5 bar controlado por válvula proporcional.
* **Controle:** Joystick para movimentação fina e limpeza direcionada (acima dos pilares ou região central do fosso).

### 4. Proteção Térmica
* **Blindagem:** Carenagem cerâmica + manta de aerogel + ventilação ativa.
* **Resistência:** Suporta temperaturas superiores a 150 °C na boca do forno.

---

## ✅ Vantagens Estratégicas

* **Eliminação de Risco Ergonômico e Térmico:** Zero exposição do OMP³/Auxiliar ao calor, esforço físico com marretas ou EPIs pesados.
* **Precisão Cirúrgica:** Estabilização automática remove 100% do material fino fundido sem danificar o refratário.
* **Segurança Máxima:** Operador posicionado a uma distância segura (40–60 m).
* **Eficiência Operacional:** Limpeza contínua de múltiplos *poken in doors* sem interrupção do forno Maerz.
* **Manutenção Preditiva:** Geração de mapas 3D e relatórios térmicos de incrustação históricos por porta.

---

## 📈 Escalabilidade

* 🟢 **Alta:** Expansão facilitada para frota de 2–4 drones (um por cuba).
* 🟢 **Integração:** Conectividade direta com o supervisório do forno (monitoramento de PCI do LDG).
* 🟢 **Versatilidade:** Mesma plataforma para inspeção de lanças, mangotes e canal cruzado.
* 🟢 **ROI:** Versão 100% autônoma com redução de custo operacional prevista em >70% após o primeiro ano.

---

## ⚠️ Desafios e Soluções

| Desafio | Solução Proposta |
| :--- | :--- |
| **Temperatura Extrema** | Carenagem cerâmica + Aerogel + Refrigeração Ativa. |
| **Peso/Arrasto da Mangueira** | Sistema Tethered terrestre + Mangueira ultra-leve de alta pressão. |
| **Precisão do Jato** | Thrusters pneumáticos + Estabilização PID + Joystick manual. |
| **Regulamentação** | Adequação às normas NR-12 e NR-35 da Lhoist. |

---

## 💰 Custos Detalhados (Estimativa Abril/2026 – Brasil)

| Item | Quantidade | Custo Unitário (R$) | Custo Total (R$) | Observação |
| :--- | :---: | :---: | :---: | :--- |
| Drone base (hexacóptero industrial) | 1 | 350.000 | 350.000 | Customizado (estilo Elios 3) |
| Câmera 4K térmica + LiDAR | 1 | 80.000 | 80.000 | Mapeamento 3D |
| Carretel motorizado + tethered | 1 | 65.000 | 65.000 | 60 m + rolo automático |
| Mangueira ½" ultra-leve 40–60 m | 1 | 12.000 | 12.000 | Alta pressão + leve |
| Câmera térmica ponta (1100 °C) | 1 | 120.000 | 120.000 | CESYCO ou equivalente |
| Thrusters pneumáticos + kit ar | 1 | 45.000 | 45.000 | Estabilização automática |
| Proteção térmica (Cerâmica/Aerogel) | 1 | 15.000 | 15.000 | Carenagem completa |
| Estação de controle (Dual Screen) | 1 | 40.000 | 40.000 | Console com software IA |
| **TOTAL ESTIMADO** | - | - | **727.000** | *Faixa: R$ 680k – 950k* |

---

## 🚀 Cronograma e Próximos Passos

**Viabilidade em 5 dias:** 🟡 Média (Prova de conceito inicial).
**Implementação Full:** 3–6 meses.

1.  **Mock-up:** Montar simulador de *poken in door* com carga térmica (1 semana).
2.  **Parcerias:** Engajar com integradores como Flyability, DroneVolt ou especialistas nacionais.
3.  **Engenharia:** Coletar plantas exatas dos Fornos 4 e 5.
4.  **Teste Piloto:** Execução em uma única porta do Forno 4 para validação de baixa complexidade.

**Status:** Conceito maduro, técnico e pronto para pitch de inovação na Lhoist Matozinhos!