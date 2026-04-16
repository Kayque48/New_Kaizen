---
tags:
  - lhoist
  - inovacao
  - automacao
  - manutencao_preventiva
  - limpeza_acustica
---

---

# 📢 Proposta de Solução: Limpeza Acústica (Buzinas Sônicas)

> [!abstract] Resumo da Proposta
> Substituir o método atual de **limpeza corretiva manual** (uso de marreta, lança e água a 1100°C) por um sistema de **limpeza preventiva automatizada** utilizando ondas sonoras de baixa frequência (Buzinas Sônicas / *Sonic Soot Blowers*). O objetivo é impedir a incrustação dos finos de cal antes que eles se fundam ao refratário.

## 🎯 Resolução Direta das Dores do Desafio

| Dor do Desafio (Matozinhos) | Como a Buzina Sônica Resolve |
| :--- | :--- |
| **Uso de Água no Refratário** | **100% a seco.** Utiliza apenas som (ar comprimido), prolongando a vida útil do forno. |
| **Acesso a Ângulos (120°) e 5m profundidade** | **Cobertura Omnidirecional.** O som não viaja em linha reta; ele preenche todo o volume do canal, alcançando todos os pontos cegos. |
| **Esforço Físico e Calor (1100°C)** | **Risco Zero.** O operador não precisa vestir o macacão JGB nem chegar perto do canal. A operação é remota. |
| **Marreta (5kg) e Tampa (20kg)** | **Eliminado.** A buzina é instalada de forma *fixa* (ou semi-fixa) na própria porta (*poken in door*). Não é mais necessário abrir a tampa duas vezes por semana. |

## 📈 Alinhamento Estratégico com o Grupo Lhoist

* **Pilar *Go for Zero* (Segurança):** Elimina a exposição humana ao risco de choque térmico, ergonomia extrema e trabalho a quente.
* **Sustentabilidade e Eficiência:** Mantém os canais de fluxo de gás permanentemente limpos, otimizando a queima, economizando combustível e reduzindo emissões de $CO_2$.
* **Propriedade Intelectual (PI):** A aplicação de limpeza acústica em fornos de fluxo paralelo regenerativo, operando a 1100°C para finos de cal, tem alto potencial de patente de processo.

---

## ⚙️ Como Funciona a Tecnologia

Em vez de impactar a rocha já fundida, a buzina sônica emite ondas sonoras de baixa frequência e alta energia (até 150 dB), geradas por ar comprimido ou nitrogênio.
* **Frequência de Atuação:** Acionamentos curtos e automatizados (ex: 10 segundos a cada 10 minutos).
* **Mecanismo:** A onda sonora causa uma flutuação rápida na pressão do ar dentro do canal. Essa vibração constante "fluidiza" o pó fino recém-depositado, fazendo com que ele seja levado pelo próprio fluxo de gases do forno antes de derreter e grudar na parede.

### ✏️📄 Rascunho Físico
![[rascunho_buzina_físico.jpeg]]

### ✏️💻 Rascunho Digital
![[rascunho_buzina_digital.png]]

---

## 🎯 Especificação Técnica da Buzina — Forno Maerz PFR

> [!warning] Janela de Eficácia
> A buzina sônica atua como **prevenção**, não como remoção de crosta já sinterizada. O K₂O entra em fase líquida a **~700–750°C** — abaixo disso, o pó ainda é particulado solto e a buzina é eficaz. Acima dessa temperatura, inicia a sinterização e a buzina não resolve mais.

### 📊 Métricas Sonoras Necessárias

| Parâmetro | Valor Recomendado | Justificativa |
|---|---|---|
| **Frequência** | **60 – 120 Hz** | Comprimento de onda longo (~2,8 m a 120 Hz) penetra nos 5 m de profundidade do canal sem atenuar. Acima de 250 Hz a energia dissipa antes de alcançar as regiões internas. |
| **Nível de Pressão Sonora (SPL)** | **≥ 140 dB** (na saída da corneta) | Pó de cal fino (d50 < 10 mm) requer pressão acústica suficiente para superar a força de adesão inicial. Referência industrial: Sonic Soot Blowers em caldeiras operam 140–150 dB. |
| **Duração do pulso** | **5–10 segundos** por ciclo | Suficiente para fluidizar sem impacto térmico acumulado na corneta. |
| **Ciclo de acionamento** | **A cada 8–15 minutos** | Impede acúmulo antes da fase líquida do K₂O (~700°C). |
| **Pressão de entrada de ar** | **3,5 – 6 bar** | Compatível com a rede de ar comprimido já existente (mesma pressão da lança atual: 3,5 bar). |
| **Consumo de ar por pulso** | ~200–400 NL/pulso | A rede precisa ser verificada para suportar múltiplas buzinas simultâneas (36 portas no Forno 4). |

### 🔒 Por que 60–120 Hz NÃO danifica o refratário

A frequência baixa gera **vibração de pressão (ondas de pressão)**, não vibração mecânica direta nas paredes. O refratário do Maerz suporta dilatação térmica cíclica de até 1.100°C — a flutuação de pressão gerada por 140 dB a 80 Hz equivale a ~200 Pa (0,002 bar), insignificante frente às variações de ±50 mbar de operação normal do forno.

> [!danger] Evitar
> - **Ultrassom (>20 kHz):** Vibrações mecânicas diretas — risco real de dano ao refratário.
> - **Frequências de ressonância estrutural** do revestimento — nunca operar próximo à frequência natural da estrutura.

### 🔩 Especificação do Hardware da Buzina

| Critério | Especificação |
|---|---|
| **Tipo de gerador** | Diafragma metálico acionado por ar comprimido (não piezoelétrico — temperatura inviabiliza piezo) |
| **Categoria do produto** | *Sonic Soot Blower / Acoustic Cleaner* (referências: Martin Engineering BigBlaster, Primasonics, Pneumatic Scale Angelus) |
| **Material da corneta** | **Inconel 625** ou aço refratário **310S** — suporta exposição contínua a >900°C |
| **Diâmetro de acoplamento** | ≤ **280 mm** (margem de folga na poken in door de 300 mm) |
| **Comprimento interno** | 150–200 mm (projeta o campo acústico sem tocar o refratário) |
| **Vedação bocal/porta** | Anel de grafite expandido (resiste a 1100°C, veda contra retorno de gases) |
| **Conexão de ar** | Tubo inox ½" com válvula solenóide 2/2 vias (ASCO G551A — já mapeada no BOM IoT) |

---

## 🏭 Automação e Limpeza Acústica - Fornos PFR

*Status:* Dashboard IoT Funcional (Portas, acionamento manual e modos operacionais via UI).

### 🛠️ Lista de Materiais — Sistema IoT

| Componente | Modelo | Função |
| :--- | :--- | :--- |
| *MCU Principal* | ESP32-S3 | Conectividade Wi-Fi + Bluetooth, atualizações OTA |
| *Sensor de Pressão* | Honeywell MPRLS | Monitorar linha de ar comprimido (0–6 bar) |
| *Sensor de Temp.* | MAX31855 + Termopar Tipo K | Leitura da temperatura na carcaça do forno |
| *Relay de Acionamento*| Relay SSR 40A | Ligar/desligar válvula solenoide da buzina |
| *Válvula Solenoide* | 2/2 via ASCO G551A | Controlar fluxo de ar para a buzina sônica |
| *Fonte Industrial* | Mean Well DR-60-24 | Alimentação em trilho DIN, 24V |
| *Caixa Hermética* | IP66 em Policarbonato | Proteção ambiental na plataforma do forno |

### 💻 Stack de Software IoT

| Camada | Tecnologia |
| :--- | :--- |
| *Firmware ESP32* | ESP-IDF ou Arduino + MQTT |
| *Broker* | MQTT (Mosquitto) ou HiveMQ Cloud |
| *Backend* | Node-RED ou Python FastAPI |
| *Dashboard* | Grafana + InfluxDB (Time-series) |
| *Armazenamento* | InfluxDB (Para séries temporais) |
| *Auth / Acesso Remoto*| HTTPS + token JWT |

---

## 🔩 Sugestões de Designs da Tampa Integrada com Buzina

Propostas adaptadas para as portas de acesso (*poken in door*) de *∅300 mm*:

### Tampa A — Flange Modular com Corneta Lateral
* *Material:* Aço inox 310S (resistente a 1100°C).
* *Fixação:* Rosca M8 para encaixe fixo no poken in door. A corneta sônica é acoplada lateralmente por flange de 4 parafusos, com vedação por anel de grafite expandido.
* *Conexão:* Bocal de entrada de ar comprimido localizado na face externa.
* *Peso estimado:* ~12 kg (redução de 8 kg em comparação com a tampa atual).

### 🌟 Tampa B — Tampa Monobloco com Buzina Embutida (Recomendado)
* *Material:* Peça única fundida em Inconel 625.
* *Design:* Corneta já integrada ao corpo (sem juntas expostas ao calor). A linha de ar sobe pela lateral da carcaça do forno em tubo de aço inox ½", com conector rápido tipo Stäubli na face externa.
* *Operação:* Abertura com manípulo de 1/4 de volta (elimina a necessidade de marreta).
* *Peso estimado:* ~15 kg, mas ergonomicamente neutro na abertura.

### Tampa C — Tampa com Abertura Pneumática
* *Material:* Aço refratário com pistão pneumático integrado para abertura automática.
* *Operação:* O operador aciona a abertura pelo painel IoT (sem toque físico na tampa). A buzina fica acoplada ao eixo da tampa.
* *Aplicação:* Mais complexa, porém ideal para o *Forno 4* (36 portas, limpeza 2× por semana), onde a frequência de operação exige maior automação.

---

## ⚠️ Análise de Riscos: O Problema da Fadiga Acústica

Embora as frequências de 60-120 Hz sejam seguras em operações pontuais, o uso de múltiplas buzinas operando simultaneamente ou em frequências incorretas gera um sério risco estrutural.

Com **18 buzinas sonoras** operando **simultaneamente** a ~200 Hz e níveis de 120-160 dB cada, o sistema gera uma onda acústica de alta intensidade e baixa frequência. Diferente de vibrações mecânicas comuns, a energia acústica se propaga como **ondas de pressão** que excitam diretamente as estruturas, criando **cargas cíclicas repetidas** que podem levar a **fadiga acústica**.

**Por que 200 Hz é crítico?**
- É uma frequência típica de *sonic horns* (60-250 Hz), mas propaga-se longe e excita **modos de vibração de grandes estruturas** (painéis planos, tubulações longas, refratário suspenso).
- Com 18 fontes simultâneas, a pressão sonora combinada pode ultrapassar **150-155 dB**, gerando forças que ressoam com as frequências naturais do forno.

### Mecanismo da Fadiga Acústica (*Acoustic Fatigue*)
Ocorre quando ondas sonoras impõem cargas cíclicas alternadas na estrutura. Cada ciclo de pressão causa micro-deformações que geram microfissuras e podem levar à falha. Fases típicas:
1. **Início (0-100 h):** Vibração elástica reversível.
2. **Acumulação (100-1.000 h):** Microfissuras em soldas e interfaces refratário-aço.
3. **Propagação (1.000+ h):** Rachaduras, afrouxamento de fixações, desprendimento de tijolos.
4. **Falha:** Perda de integridade e paradas não programadas.

### Efeitos nos Componentes do Forno Maerz PFR
- **Refratário:** Vibração a 200 Hz pode causar *spalling* (desprendimento). Com 18 buzinas, há risco de reduzir a vida útil do revestimento em 20-50%.
- **Estruturas Metálicas e Dutos:** Modos de vibração são excitados, levando a *fatigue cracking* em soldas e parafusos.
- **Componentes Sensíveis:** Falha por vibração em sondas, válvulas e ancoragens do refratário.

### Análise Quantitativa e Riscos Estimados

| Parâmetro | Valor com 18 buzinas simultâneas | Risco associado | Limite aceitável industrial |
|---|---|---|---|
| **Nível de pressão sonora** | 150-155 dB | Fadiga acelerada | <140 dB |
| **Frequência** | 200 Hz | Excitação de modos naturais | 60-75 Hz (ótimo) ou >250 Hz |
| **Ciclos por hora** | ~720.000 ciclos/h | Alta taxa de fadiga | <100.000 ciclos/h |
| **Deflexão em tubos** | 10-26 mm (SASOL) | Tensão >180 MPa → fadiga | <5 mm |
| **Vida útil do refratário** | Redução de 30-60% | Parada não programada | Sem redução |

### Evidências Reais de Casos Industriais
- **Caldeiras SASOL:** O projeto otimizado usou 75 Hz e força controlada para evitar defeitos no refratário. Frequências fora da faixa de 60-75 Hz causaram dano estrutural.
- **Fornos e baghouses:** Sucesso com manutenção frequente e monitoramento.
- **NASA:** Painéis sofrem fadiga acústica em 200-2.000 Hz, mecanismo idêntico ao do refratário.

### Recomendações de Mitigação
1. **Operação não simultânea:** Ativar buzinas em sequência ou grupos de 3-4 (reduz SPL em ~10-12 dB).
2. **Afinação de frequência:** Testar 75-160 Hz (faixa mais segura) e evitar a frequência natural do forno.
3. **Monitoramento:** Instalar sensores de vibração (acelerômetros) e sistema de *shutdown* automático.
4. **Amortecimento:** Adicionar *dampers* viscoelásticos nos suportes.
5. **Simulação obrigatória:** Usar COMSOL ou ANSYS para mapear vibração dos canais + pressão acústica de 18 buzinas.
6. **Piloto em escala:** Testar 1-2 buzinas em um único canal com amostra de refratário real (1.100 °C).

---

## 🛠️ Desafios Técnicos a Mapear (Próximos Passos)

- [ ] **Dimensionamento do Ar Comprimido:** Verificar se a rede de ar comprimido da unidade de Matozinhos suporta o consumo das buzinas.
- [ ] **Material da Corneta:** A parte da buzina que entra em contato com a temperatura interna precisa ser fundida em ligas especiais (como Inconel ou aços refratários) para suportar os 1100°C contínuos.
- [ ] **Poluição Sonora Ambiental:** Como as buzinas são barulhentas, será necessário calcular o impacto acústico externo e prever isolamento (abafadores).
- [ ] **Replicabilidade:** Criar um design de flange universal que permita acoplar a buzina tanto nas 36 portas do Forno 4 quanto nas 48 portas do Forno 5.
- [ ] **Apresentar plano à Lhoist:** Incluir "vibration risk assessment" alinhado ao "Go for Zero", com simulação acústica pré-protótipo.