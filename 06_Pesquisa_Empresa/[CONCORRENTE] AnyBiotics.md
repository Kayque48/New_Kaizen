# 🤖 ANYbotics — Análise de Concorrente | SENAI GP

> **Categoria:** Robótica Industrial / Inspeção Autônoma de Segurança  
> **Origem:** Zürich, Suíça  
> **Fundação:** 2016  
> **Contexto:** Análise competitiva para o desafio Grand Prix do SENAI

---

## 📌 Visão Geral

A **ANYbotics AG** é uma empresa suíça de robótica avançada, fundada em **2016** como spin-off do **ETH Zurich** (Instituto Federal de Tecnologia de Zurique), a partir de pesquisas do _Robotic Systems Lab (RSL)_. Seus cofundadores são **Péter Fankhauser**, **Hanspeter Fässler**, **Roland Siegwart** e **Marco Hutter** — todos pesquisadores e engenheiros de alto nível em robótica quadrúpede.

A empresa é especializada no desenvolvimento de **robôs quadrúpedes autônomos** voltados para **inspeções industriais em ambientes perigosos**, substituindo trabalhadores humanos em situações de risco.

---

## 🧪 Como a ANYBotics Desenvolve seus Robôs

### Origem Acadêmica

O desenvolvimento partiu de anos de pesquisa em **robótica quadrúpede** no ETH Zurich. A empresa nasceu para transformar os resultados científicos em produtos comerciais robustos e escaláveis.

### Produto Principal: ANYmal

O carro-chefe da empresa é o robô **ANYmal** (e sua versão industrial certificada **ANYmal X**), uma plataforma quadrúpede desenvolvida especificamente para inspeções em **ambientes industriais severos**.

#### Especificações Técnicas do ANYmal:

- **Certificação:** IP67 (100% protegido contra água e poeira)
- **Navegação:** LiDAR 360°, 6 câmeras de profundidade e 2 câmeras ópticas de teleoperação
- **Processamento:** Intel 6-core 8ª geração (edge computing embarcado)
- **Sensores de carga útil:**
    - Câmera térmica: leituras entre **-40°C e 550°C**
    - Microfone ultrassônico: **0 a 384 kHz** (detecta vazamentos e falhas acústicas)
    - Câmera de alta resolução com iluminação de até **3.790 lm**
    - Sensores de gás (detectores de presença e concentração)
- **Carga útil adicional:** Suporte a até **10 kg** de sensores extras
- **Movimento:** Pan-tilt ±90° vertical e ±165° horizontal
- **Autonomia:** Sistema de docking autônomo para recarregamento

### Metodologia de Desenvolvimento: "Show & Go"

O processo de comissionamento do ANYmal é chamado de **Show & Go**:

1. Um operador guia o robô fisicamente pelo ambiente
2. O ANYmal cria um **mapa 3D do ambiente** durante o percurso
3. Define os **pontos de inspeção** e as tarefas a executar
4. Armazena tudo em banco de dados para missões futuras totalmente autônomas

### Plataforma de IA com NVIDIA

A ANYbotics utiliza as soluções de IA da **NVIDIA** para treinar e testar o ANYmal em **simulação em escala**, acelerando o desenvolvimento e validando comportamentos antes de aplicar no robô físico.

---

## ⚠️ Como Analisam e Gerenciam Riscos

### Identificação de Riscos

O ANYmal é projetado para operar em ambientes classificados como **perigosos para humanos**, incluindo:

- Espaços confinados (interior de moinhos, tanques, dutos)
- Áreas com rotação de equipamentos pesados
- Locais com ruído excessivo e poeira
- Zonas com potencial de explosão (ANYmal X é certificado Ex — antiexplosão)
- Ambientes subterrâneos escuros e úmidos

### Tipos de Inspeção de Risco

|Tipo de Inspeção|Método|
|---|---|
|Anomalias térmicas|Câmera térmica de alta precisão|
|Presença de gases tóxicos|Sensores de gás integrados|
|Falhas mecânicas acústicas|Microfone ultrassônico|
|Leitura de painéis e medidores|Câmera de alta resolução com IA|
|Mapeamento 3D de instalações|LiDAR + câmeras de profundidade|
|Detecção de vazamentos|Sensor de imageamento acústico|

### Análise de Dados: Data Navigator

Toda a informação coletada é consolidada na plataforma **Data Navigator**, que transforma os dados brutos de inspeção em **insights acionáveis** para manutenção preditiva e baseada em condições.

### Resultado Documentado

Em um dos casos de uso registrados, as leituras térmicas regulares do ANYmal ajudaram a **reduzir intervenções de manutenção** e aumentaram a disponibilidade de produção em **1,5%** diretamente atribuível ao robô.

---

## 🚀 A Jornada para Criar o Robô

```
ETH Zurich (pesquisa acadêmica)
        ↓
    2016 — Fundação da ANYbotics como spin-off
        ↓
    2018 — Primeira rodada de investimento
        ↓
    2020 — Série A: USD 22 milhões
        ↓
    2023 — Série B: USD 50 milhões (Walden Catalyst + NGP Capital)
        ↓
    2024 — Rodada adicional: EUR 57 milhões
        ↓
    2025 — Rodada adicional: USD 20 milhões | Total: +USD 150 milhões
        ↓
    ~200 robôs ANYmal ativos em instalações industriais globais
```

O que impulsionou a criação foi a necessidade real da indústria: **trabalhadores expostos a riscos** em inspeções rotineiras de plantas de petróleo, gás, química, mineração e energia. A pergunta foi: _"Como remover humanos de situações perigosas sem perder a qualidade e a frequência das inspeções?"_

---

## 🤝 Parcerias Brasileiras

### 🇧🇷 Vale S.A. — Mina de Cauê, Itabira (MG)

A **Vale**, gigante brasileira de mineração presente em ~30 países com 125.000 funcionários, foi uma das primeiras empresas brasileiras a adotar o ANYmal.

- **Local:** Mina de Cauê e instalação de processamento, em **Itabira, Minas Gerais**
- **Apelido interno:** A equipe da Vale carinhosamente chamou o ANYmal de **"filhote"** (_puppy_)
- **Missões realizadas:**
    - Inspeção de correias transportadoras, alavancas e painéis elétricos
    - Medição de temperatura de equipamentos por câmera térmica
    - Leitura de medidores de óleo e lubrificantes
    - Análise fotográfica de sistemas de sucção e drenagem
    - Acesso a espaços confinados (interior de moinhos)
- **Próximos passos:** Integração em **minas subterrâneas**, onde as condições são ainda mais adversas

> _"Com o robô, eliminamos riscos das atividades de inspeção, como partes rotativas de equipamentos, ruído e poeira. Também eliminamos atividades com risco ergonômico."_ — **Rayner Teixeira**, Coordenador de Manutenção Digital, Vale

A Vale também possui parceria com o **Instituto Tecnológico Vale (ITV – Mineração)** e a **Universidade Federal de Minas Gerais (UFMG)** para desenvolvimento de robótica própria, complementando o uso do ANYmal.

---

### 🇧🇷 Petrobras

A **Petrobras** investiu **USD 4 milhões** na aquisição de robôs ANYbotics para automatizar inspeções _offshore_ (plataformas de petróleo no mar).

- Faz parte do **Early Adopters Program** da ANYbotics — um grupo seleto de grandes empresas de Oil & Gas e Petroquímica que colaboram para testar e avaliar estratégias de implementação de robôs autônomos
- O ANYmal X é descrito pela Petrobras como **"o único robô com pernas articuladas antiexplosão do mundo"**
- O programa é liderado pelo **Centro de Excelência em Robótica (COE)** da Petrobras

> _"Petrobras espera qualificar o ANYmal X para automatizar atividades de inspeção de rotina, melhorando as capacidades de monitoramento de ativos."_ — **Gustavo Levin**, Gerente de Setor, COE Petrobras

---

## 🌍 Parcerias Internacionais

| Empresa                       | Papel                                                      |
| ----------------------------- | ---------------------------------------------------------- |
| **ETH Zurich**                | Base acadêmica e comunidade de pesquisa (ANYmal Research)  |
| **NVIDIA**                    | IA: treinamento e simulação em escala para o ANYmal        |
| **Siemens Energy**            | Parceiro estratégico e de integração (Siemens Xcelerator)  |
| **AWS (Amazon Web Services)** | Infraestrutura de nuvem para dados de inspeção             |
| **SAP**                       | Integração com sistemas de gestão de ativos industriais    |
| **SLB (Schlumberger)**        | Oil & Gas — cliente e parceiro de alcance global           |
| **BP**                        | Cliente no setor de energia                                |
| **Equinor**                   | Cliente no setor de petróleo e gás                         |
| **PETRONAS**                  | Cliente na Ásia (reservas de USD 150 mi em pré-encomendas) |
| **Shell**                     | Cliente no setor de energia                                |
| **BASF**                      | Cliente na indústria química                               |
| **Novelis**                   | Cliente na indústria de alumínio                           |
| **Outokumpu**                 | Cliente na indústria de aço inoxidável                     |
| **University of Oxford**      | Parceira de pesquisa                                       |
| **TDK Ventures**              | Investidora estratégica (€57 mi em 2024)                   |
| **Walden Catalyst**           | Investidor líder da Série B                                |
| **Qualcomm Ventures**         | Investidora                                                |
| **NGP Capital**               | Investidor Série B                                         |

---

## 💰 Histórico de Investimentos

|Ano|Rodada|Valor|
|---|---|---|
|2018|Seed/Inicial|Não divulgado|
|2020|Série A|USD 22 milhões|
|2023|Série B|USD 50 milhões|
|2024|Expansão|EUR 57 milhões|
|2025|Adicional|USD 20 milhões|
|**Total**||**+USD 150 milhões**|

---

## 📊 Mercados Atendidos

- ⛽ **Oil & Gas** (petróleo e gás — onshore e offshore)
- ⚗️ **Química e Petroquímica**
- ⛏️ **Mineração** (ferro, cobre, alumínio, aço)
- ⚡ **Energia e Utilities** (subestações de alta tensão)
- 🏭 **Manufatura e Plantas Industriais**

---

## 🔬 Comunidade de Pesquisa: ANYmal Research

A ANYbotics mantém uma **comunidade aberta de pesquisa** chamada _ANYmal Research_, em parceria com o ETH Zurich:

- Pesquisadores têm acesso ao **software de controle do ANYmal**, simulação, documentação e suporte
- O framework de simulação é baseado em **Gazebo** e totalmente compatível com **ROS** (Robot Operating System)
- Inclui simulação de estimador de estado, sensores de percepção, mapeamento e localização
- Instituições como **University of Oxford** e **ETH Zurich** já publicaram pesquisas baseadas na plataforma

---

## 🛡️ Posição Ética: Não Militarização

A ANYbotics assinou, junto com **Boston Dynamics**, **Agility Robotics**, **Clearpath Robotics** e **Open Robotics**, a carta aberta:

> _"General Purpose Robots Should Not Be Weaponized"_

Comprometendo-se publicamente a **não armar seus robôs** e não apoiar terceiros que o façam — um ponto importante que diferencia a empresa quanto ao uso responsável da tecnologia.

---

## 🧠 Diferenciais Competitivos

1. **Única plataforma quadrúpede** construída do zero para inspeções industriais severas
2. **Certificação IP67** — resistência total à água e poeira
3. **ANYmal X** — único robô do mundo com pernas articuladas **à prova de explosão (Ex-rated)**
4. **Solução turnkey** — pronta para uso, sem necessidade de personalização extensa
5. **Integração com ecossistema** (AWS, SAP, Siemens) via API
6. **Presença no Brasil** com clientes de grande porte (Vale e Petrobras)
7. **Comunidade científica ativa** garantindo evolução constante

---

## ⚔️ Concorrentes Diretos da ANYbotics

|Empresa|Origem|
|---|---|
|Unitree Robotics|China|
|Boston Dynamics (Spot)|EUA|
|xTerra Robotics|—|
|Zoa Robotics|—|
|Energy Robotics|Alemanha|

---

## 📝 Pontos de Atenção para o SENAI GP

> Use esta seção para mapear como nosso projeto se diferencia ou pode aprender com a ANYbotics.

- [ ] **Mobilidade:** O ANYmal usa quatro patas — como nosso robô navega em terrenos irregulares?
- [ ] **Sensores:** Qual combinação de sensores utilizamos vs. o ANYmal?
- [ ] **Autonomia:** Nosso robô opera de forma autônoma ou precisa de controle manual?
- [ ] **Segurança:** Temos certificações ou protocolos de segurança equivalentes?
- [ ] **Dados:** Como coletamos e apresentamos os dados de inspeção?
- [ ] **Custo-benefício:** Qual é o nosso diferencial frente a soluções como a deles?

---

## 🔗 Fontes e Referências

- [Site oficial ANYbotics](https://www.anybotics.com/)
- [Caso Vale – Mina de Cauê](https://www.anybotics.com/news/anymal-helps-vale-to-prioritize-people-in-mining/)
- [Petrobras investe em robôs ANYbotics](https://brazilenergyinsight.com/2023/11/22/petrobras-invests-in-robots-to-automate-offshore-inspections/)
- [Wikipedia – ANYbotics](https://en.wikipedia.org/wiki/ANYbotics)
- [EU Startups – Rodada EUR 57M](https://www.eu-startups.com/2024/12/anybotics-robots-take-a-giant-step-with-e57-million-in-funding/)
- [TechCrunch – Série B USD 50M](https://techcrunch.com/2023/05/16/anybotics-raises-50-million-to-help-deploy-its-robot-dog/)
- [ANYmal Research Community](https://www.anymal-research.org/)

---

_Documento criado para fins de análise competitiva — SENAI Grand Prix_  
_Última atualização: Abril de 2026_

