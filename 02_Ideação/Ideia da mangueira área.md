# 🏭 Sistema Automatizado de Limpeza de Canais — Fornos Lhoist Matozinhos

## Visão Geral da Solução

A solução é um **sistema aéreo fixo de limpeza automatizada**, instalado sobre os fornos, que elimina completamente a presença humana durante a operação de limpeza dos canais. O sistema combina uma estrutura de trilho aéreo, uma lança telescópica de aço resistente ao calor, jato de ar comprimido seco como agente de limpeza e abertura pneumática das tampas — tudo controlado por painel externo à zona de risco.

---

## Componentes e Funcionamento

### 1. 🛤️ Estrutura Aérea com Trilho (Eixos X e Y)

Uma estrutura metálica fixada acima da plataforma dos fornos sustenta dois trilhos lineares que permitem movimentação nos eixos **X** (ao longo do comprimento do forno) e **Y** (perpendicular, aproximando ou afastando do canal). Isso posiciona o sistema precisamente na frente de cada poken in door sem necessidade de reposicionamento manual.

**O que mudou em relação à ideia original:** a estrutura aérea foi mantida pois resolve o problema do espaço limitado na plataforma. Os dois motores de movimentação foram substituídos por **motores de passo** (stepper motors) com encoder, mais adequados para posicionamento preciso em ambiente industrial e com melhor custo-benefício que servos de alto torque para esse eixo.

---

### 2. 🔧 Lança Telescópica de Aço Inox Refratário

No lugar da mangueira flexível original, a lança passa a ser **telescópica** — composta por 3 segmentos de tubo de aço inox de alta temperatura que se estendem linearmente, controlados por um **atuador pneumático linear** (cilindro de ar). A lança avança de forma controlada dentro do canal, alcançando profundidades de **1 a 5 metros** com precisão.

Na ponta da lança há um **bocal convergente-divergente de aço inox** orientado com saída de ar em **120° de abertura angular**, distribuindo o jato em leque para cobrir as paredes laterais, a região acima das colunas e o fosso central — sem necessidade de rotação adicional da lança.

**O que mudou em relação à ideia original:** a mangueira flexível foi substituída pela lança telescópica rígida, que resolve o problema de profundidade (eixo Z) sem adicionar complexidade de motores extras. O bocal em leque de 120° resolve a cobertura angular sem necessidade de um terceiro eixo de rotação, simplificando o sistema e reduzindo custo.

---

### 3. 💨 Jato de Ar Comprimido Seco como Agente de Limpeza

O agente de limpeza passa a ser **ar comprimido seco em alta pressão** (recomendado: 6 a 8 bar), eliminando completamente o contato de água com o refratário. O ar comprimido:

- Desaloja os finos de cal fundido por impacto pneumático
- Não danifica o refratário
- Não gera resíduo líquido dentro do canal
- Pode ser aquecido previamente (opcional) para evitar choque térmico no refratário

A fonte de ar comprimido já existente na planta alimenta tanto a lança quanto o atuador de abertura da tampa, **unificando a fonte de energia pneumática do sistema inteiro** e reduzindo infraestrutura adicional.

**O que mudou em relação à ideia original:** a mangueira de água pressurizada foi completamente eliminada. Isso resolve o principal problema técnico do projeto anterior e coloca a solução em conformidade com a restrição explícita do desafio.

---

### 4. 🚪 Abertura Automática da Tampa — Atuador Pneumático

A tampa metálica de ~20kg com sistema de travamento tipo cunha passa a ser aberta por um **atuador pneumático de dupla ação** (cilindro de ar), que aplica força suficiente para destavar a cunha e deslocar a tampa lateralmente — reproduzindo exatamente o movimento que o operador fazia com a marreta de 5kg e flexão de tronco.

O atuador pneumático foi escolhido por ser:

- A opção de **menor custo** entre as alternativas
- Alimentado pela **mesma fonte de ar comprimido** do sistema de limpeza
- Robusto para ambientes quentes e sujo
- Simples de manter (menos componentes que hidráulico ou servo)

**O que mudou em relação à ideia original:** o servo motor industrial de alto torque foi substituído pelo atuador pneumático, reduzindo custo, simplificando a manutenção e aproveitando a infraestrutura de ar já presente.

---

### 5. 📡 Sensor de Detecção de Incrustação

O sensor ultrassônico da ideia original foi substituído por uma **câmera termográfica compacta** posicionada na entrada do canal (fora da zona de calor direto), com janela de proteção em vidro borossilicato resistente ao calor. A câmera detecta a presença e espessura de incrustação pela diferença de temperatura entre a parede limpa (mais quente) e a região com depósito de fino de cal (mais fria, pois o depósito atua como isolante).

Isso permite que o sistema opere em **modo reativo inteligente**: só aciona a limpeza quando o sensor detecta acúmulo real, e confirma a limpeza completa antes de recolher a lança.

**O que mudou em relação à ideia original:** o sensor ultrassônico foi descartado por inviabilidade a 1100°C. A câmera termográfica resolve o mesmo problema com tecnologia compatível com o ambiente.

---

### 6. 🎛️ Painel de Controle Externo à Zona de Risco

Todo o sistema é operado por um **painel de controle instalado fora da plataforma de risco**, com:

- Botão de ciclo automático (abre tampa → estende lança → jato de ar → retrai lança → fecha tampa)
- Controle manual para ajustes
- Display de status de cada poken in door
- Registro de ciclos realizados por forno (dado útil para manutenção preditiva)

---

## 📊 Tabela Comparativa: Antes vs. Depois

|Aspecto|Método Atual|Solução Proposta|
|---|---|---|
|**Agente de limpeza**|Água pressurizada (3,5 bar)|Ar comprimido seco (6-8 bar)|
|**Abertura da tampa**|Marreta 5kg + força manual|Atuador pneumático automático|
|**Alcance de profundidade**|Depende do braço do operador|Lança telescópica 1-5m controlada|
|**Cobertura angular**|Limitada pelo operador|Bocal em leque 120° fixo|
|**Detecção de incrustação**|Visual/subjetiva|Câmera termográfica|
|**Exposição humana**|Direta, 1100°C, EPI obrigatório|Zero — operador no painel externo|
|**Risco ao refratário**|Alto (água direta)|Nulo (ar seco)|
|**Fonte de energia**|Bomba de água + força humana|Ar comprimido unificado|
|**Replicabilidade**|N/A|Adaptável a todos os fornos verticais|

---

## 🎯 Alinhamento com os Critérios do Desafio

|Critério Lhoist|Como a solução atende|
|---|---|
|**Eliminar sobrecarga física**|Operador não toca em nada — apenas aciona o painel|
|**Eliminar exposição ao calor**|Operador permanece fora da zona de risco|
|**Não danificar o refratário**|Ar seco substitui água completamente|
|**Remoção total do material**|Lança telescópica + bocal 120° + confirmação por câmera|
|**Elevar produtividade**|Ciclo automatizado é mais rápido e consistente que manual|
|**Replicabilidade**|Estrutura modular adaptável a Forno 4, 5 e demais unidades|
|**Go for Zero**|Zero exposição humana durante a operação|