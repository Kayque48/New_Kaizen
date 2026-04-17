## Sistema de limpeza acústica preventiva — buzinas sônicas instaladas nos *Poken In Doors*, operando em ciclos automáticos para impedir a formação de incrustações sem presença humana e sem parada de produção.

### ⚙️ Como funciona

A incrustação ocorre em fases. O SonicGuard age na **primeira fase** — quando o pó de cal ainda está solto — impedindo que o processo avance para crosta química fundida (K₂O/Na₂O a 700–800°C).

Buzinas sônicas emitem ondas de **75–160 Hz e 140–150 dB** geradas por ar comprimido. Ondas graves preenchem **todo o volume do canal** — incluindo os 5 m de profundidade e os 120° de variação angular — sem linha de visada. O pó é fluidizado e carreado pelo fluxo ativo de gases do forno.

### 🔩 Configuração

- **6 buzinas por ciclo de pulso** — 3 por cuba, trianguladas a 120°
- **Pulso:** 10 segundos a cada 10 minutos, automático, 24h
- **Acionamento:** válvula solenóide por CLP/ESP32
- **84 buzinas no total** — Forno 4 (36) + Forno 5 (48)
- Opera **exclusivamente com o forno em funcionamento** — fluxo ativo do soprador absorve o ar injetado

### 🛡️ Tampa Integrada (SonicGuard)

A buzina substitui a tampa original — **tampa nunca mais é removida em operação normal**. Materiais selecionados para 1.100°C contínuo:

| Componente | Material |
|:---|:---|
| Pavilhão / Horn | Aço Inox AISI 310S |
| Diafragma | Inconel 625 |
| Vedações | Grafite expandido |
| Flange | Aço Inox AISI 316Ti |

### ⚠️ Segurança de Pressão

Canal com **~122 m³** de volume total. Com 6 buzinas trianguladas, o ΔP total é de apenas **25,3 mBar — 7,2% da margem de segurança** disponível antes da chapa de explosão (700 mBar). Pior caso absoluto: 47,8 mBar (13,7%).

### 📡 Monitoramento IoT

Termopar tipo K + sensor de pressão diferencial + acelerômetro MEMS → ESP32 → MQTT → Node-RED / Grafana. Shutdown automático em caso de anomalia.

### 🏎️ Resultado

**Zero operadores expostos** a risco térmico, ergonômico ou químico por ciclo de limpeza. Canal limpo continuamente = sem parada de produção para limpeza preventiva.