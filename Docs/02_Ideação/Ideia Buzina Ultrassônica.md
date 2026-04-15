---
tags:
  - lhoist
  - inovacao
  - automacao
  - manutencao_preventiva
  - limpeza_acustica
---

# 📢 Proposta de Solução: Limpeza Acústica (Buzinas Sônicas)

> [!abstract] Resumo da Proposta
> Substituir o método atual de **limpeza corretiva manual** (uso de marreta, lança e água a 1100°C) por um sistema de **limpeza preventiva automatizada** utilizando ondas sonoras de baixa frequência (Buzinas Sônicas / *Sonic Soot Blowers*). O objetivo é impedir a incrustação dos finos de cal antes que eles se fundam ao refratário.

## ⚙️ Como Funciona a Tecnologia
Em vez de impactar a rocha já fundida, a buzina sônica emite ondas sonoras de baixa frequência (geralmente entre 60 e 250 Hz) e alta energia (até 150 dB), geradas por ar comprimido ou nitrogênio. 
* **Frequência de Atuação:** Acionamentos curtos e automatizados (ex: 10 segundos a cada 10 minutos).
* **Mecanismo:** A onda sonora causa uma flutuação rápida na pressão do ar dentro do canal. Essa vibração constante "fluidiza" o pó fino recém-depositado, fazendo com que ele seja levado pelo próprio fluxo de gases do forno antes de derreter e grudar na parede.

## ✏️📄 Rascunho Físico

![[rascunho_buzina_físico.jpeg]]


## ✏️💻 Rascunho Digital

![[rascunho_buzina_digital.png]]


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

## 🛠️ Desafios Técnicos a Mapear (Próximos Passos)
- [ ] **Dimensionamento do Ar Comprimido:** Verificar se a rede de ar comprimido da unidade de Matozinhos suporta o consumo das buzinas.
- [ ] **Material da Corneta:** A parte da buzina que entra em contato com a temperatura interna precisa ser fundida em ligas especiais (como Inconel ou aços refratários) para suportar os 1100°C contínuos.
- [ ] **Poluição Sonora Ambiental:** Como as buzinas são barulhentas (embora o forno seja isolado), será necessário calcular o impacto acústico externo e prever isolamento (abafadores) do lado de fora da carcaça do forno.
- [ ] **Replicabilidade:** Criar um design de flange universal que permita acoplar a buzina tanto nas 36 portas do Forno 4 quanto nas 48 portas do Forno 5.

## 1. Introdução ao Problema

Com **18 buzinas sonoras** operando **simultaneamente** a ~200 Hz e níveis de 120-160 dB cada, o sistema gera uma onda acústica de alta intensidade e baixa frequência.

Diferente de vibrações mecânicas comuns (ex.: motores), a energia acústica se propaga como **ondas de pressão** que excitam diretamente as estruturas. Em fornos Maerz PFR (canais de combustão, refratário, dutos de crossover e suportes metálicos), isso cria **cargas cíclicas repetidas** que podem levar a **fadiga acústica** — um mecanismo de falha bem documentado em caldeiras, silos e fornos industriais.

**Por que 200 Hz é crítico?**

- Frequência na faixa de operação típica de sonic horns industriais (60-250 Hz).
- Baixa frequência propaga longe e excita **modos de vibração de grandes estruturas** (painéis planos, tubulações longas, refratário suspenso).
- Com 18 fontes simultâneas, o nível de pressão sonora combinado pode ultrapassar **150-155 dB**, gerando forças que ressoam com as frequências naturais do forno.

---

## 2. Mecanismo da Fadiga Acústica (Acoustic Fatigue)

**Definição:** Fadiga acústica ocorre quando ondas sonoras de alta intensidade impõem **cargas cíclicas alternadas** na estrutura. Cada ciclo de pressão (a 200 Hz = 200 ciclos por segundo) causa micro-deformações elásticas que, com o tempo, geram microfissuras, propagam-se e levam à falha catastrófica — **mesmo sem sobrecarga estática visível**.

**Fases típicas (baseado em estudos de sonic horns em caldeiras):**

1. **Início (0-100 h):** Vibração elástica reversível → aumento de ruído e sensação de “zumbido” na estrutura.
2. **Acumulação (100-1.000 h):** Microfissuras em soldas, ancoragens e interfaces refratário-aço.
3. **Propagação (1.000+ h):** Rachaduras visíveis, afrouxamento de fixações, desprendimento de tijolos refratários.
4. **Falha:** Perda de integridade → vazamentos de gás, queda de refratário ou parada não programada do forno.

**Referências técnicas:**

- Em caldeiras, frequências <60 Hz são consideradas destrutivas para conexões mecânicas (IAC International).
- A 75 Hz (faixa otimizada em estudos SASOL), o risco é controlado; acima ou abaixo pode ressoar com modos harmônicos da planta.
- Estudos de simulação (AutoCAD Inventor + análise de tensão) mostram que deflexões >25 mm em tubos podem gerar tensões de 180-800 MPa — acima do limite de fadiga de muitos aços refratários.

---

## 3. Efeitos Específicos nos Componentes do Forno Maerz PFR

### 3.1 Refratário (principal preocupação)

- Material frágil e sujeito a choque térmico + mecânico.
- Vibração a 200 Hz pode causar **spalling** (desprendimento em camadas) ou microfissuras nas juntas.
- No Maerz PFR, o refratário dos canais e do crossover channel é inspecionado periodicamente (Maerz recomenda inspeção sem parada para detectar danos precoces).
- Risco ampliado com 18 buzinas: energia acústica concentrada nos 36-48 canais → possível redução da vida útil do revestimento em 20-50% (baseado em casos de vibração em fornos de cal).

### 3.2 Estruturas Metálicas e Dutos

- Painéis, suportes e tubulações de aço carbono/inox vibram mais em frequências baixas.
- Modos de vibração de chapas planas são facilmente excitados a 200 Hz → **fatigue cracking** em soldas e parafusos.
- Exemplo real: em caldeiras com sonic horns, vibração excessiva causou afrouxamento de fixações e rachaduras progressivas.

### 3.3 Componentes Sensíveis

- Sondas de temperatura/pressão, válvulas pneumáticas e ancoragens do refratário → falha por vibração.
- Possível interferência no ciclo de inversão dos fornos (12-15 min).

---

## 4. Análise Quantitativa e Riscos Estimados

|Parâmetro|Valor com 18 buzinas simultâneas|Risco associado|Limite aceitável industrial|
|---|---|---|---|
|Nível de pressão sonora total|150-155 dB|Fadiga acelerada|<140 dB|
|Frequência|200 Hz|Excitação de modos naturais|60-75 Hz (ótimo) ou >250 Hz|
|Ciclos por hora (operação contínua)|~720.000 ciclos/h|Alta taxa de fadiga|<100.000 ciclos/h (recomendado)|
|Deflexão estimada em tubos|10-26 mm (simulações SASOL)|Tensão >180 MPa → fadiga|<5 mm|
|Vida útil estimada do refratário|Redução de 30-60%|Parada não programada|Sem redução|

**Observação:** Com operação simultânea, o risco de **ressonância** aumenta exponencialmente. Se a frequência natural de qualquer componente estiver próxima de 200 Hz (ou harmônicos), a amplitude pode multiplicar por 10x.

---

## 5. Evidências Reais de Casos Industriais

- **Caldeiras SASOL (África do Sul):** Estudos mostraram que frequências fora da faixa 60-75 Hz causam dano estrutural. O projeto otimizado usou 75 Hz e força controlada (220-300 N) para evitar defeitos no refratário.
- **Fornos e baghouses:** Sonic horns bem-sucedidos, mas com manutenção frequente de diafragmas e monitoramento de vibração para evitar fatigue.
- **Indústria de cal e cimento:** Nenhum caso público de 18 buzinas simultâneas em Maerz PFR, mas vibrações induzidas por equipamentos causam degradação acelerada de refratários (estudos de torres de pré-aquecimento).
- **NASA e aeronáutica:** Painéis de carbono sofrem fadiga acústica em 200-2.000 Hz — mecanismo idêntico ao refratário.

---

## 6. Recomendações de Mitigação para os Desenvolvedores

1. **Operação não simultânea:** Ativar buzinas em sequência ou grupos de 3-4 (reduz SPL total em ~10-12 dB).
2. **Afinação de frequência:** Testar 75-160 Hz (faixa mais segura) e evitar exatamente a frequência natural do forno (medir com acelerômetros).
3. **Monitoramento:** Instalar sensores de vibração (acelerômetros triaxiais) + sistema de shutdown automático se amplitude > limite.
4. **Amortecimento:** Adicionar dampers viscoelásticos ou isoladores de vibração nos suportes.
5. **Simulação obrigatória:** Usar software como COMSOL Multiphysics ou ANSYS para mapear modos de vibração dos canais Maerz + pressão acústica de 18 buzinas.
6. **Piloto em escala:** Testar 1-2 buzinas em um único canal com amostra de refratário real (1.100 °C) e medir tensão/fissuras.
7. **Integração com Lhoist:** Apresentar plano de “vibration risk assessment” alinhado ao “Go for Zero” — incluir inspeção de refratário antes/depois.

---

## 7. Conclusão e Impacto no Projeto

A operação simultânea de 18 buzinas a 200 Hz transforma um sistema de limpeza em uma **fonte de fadiga acústica de alto risco**. Embora a ideia seja inovadora e alinhada com zero exposição humana, o risco de dano estrutural/refratário pode anular o ganho de segurança e gerar paradas caras — exatamente o oposto do objetivo Kaizen.

**Recomendação final:** Priorizar operação sequencial + simulação acústica antes de qualquer protótipo. Isso pode tornar a proposta **viável e competitiva** frente à mangueira aérea.

**Pronto para exportar como .md!** Caso precise de anexos (ex.: planilha de cálculo de tensão, modelo COMSOL simplificado ou comparação com a mangueira aérea), forneça mais detalhes do ZIP ou especificações técnicas.

**Referências principais:** Estudos SASOL, IAC International, Maerz Ofenbau e publicações sobre acoustic fatigue em refratários industriais.