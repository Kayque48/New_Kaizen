## Desenvolvimento
- Validação e projeto técnico: especificação das 84 buzinas sônicas (flange 300 mm, Aço Inox AISI 310S/316Ti, diafragma Inconel 625) para os pokendors dos Fornos 4 e 5.
- Prototipagem e testes em ambiente simulado (temperatura, pressão acústica, geometria do canal 728mm).
- Piloto em campo: Forno 4 — 1 cuba (18 buzinas) — validação por 30 dias de operação contínua sem limpeza manual.
- Certificação: conformidade com NR-15, NR-17, NR-33, NR-35 e normas de equipamentos industriais pneumáticos.

## Faixa de investimento inicial (referência)
- **SonicGuard — Sistema de Limpeza Acústica Preventiva (solução adotada):** R$120–220k total (84 buzinas + IoT).
  - Inclui: buzinas sônicas, flanges, sistema de controle CLP/ESP32, sensores IoT (termopar, pressão diferencial, acelerômetro MEMS), instalação e comissionamento.
- Comparativo: processo manual atual envolve 5 operadores × ~2h/sessão × 3x/semana de exposição de risco + EPI premium + risco de acidente grave.
- Custo de 1 acidente grave (afastamento + multa NR + impacto reputacional) supera o CAPEX total do sistema.

## Operação
- Consumo de ar comprimido: duty cycle de ~1,7% por buzina (10 s a cada 10 min) — compatível com rede pneumática existente (6 bar).
- Manutenção preventiva: inspeção semestral do diafragma (Inconel 625), vedações em grafite expandido e válvulas solenóides.
- Monitoramento contínuo via IoT com shutdown automático por anomalia — reduz intervenções corretivas.
- Treinamento de supervisão remota para equipe operacional (dashboard Node-RED / Grafana).

## Riscos de custo
- Variabilidade do LDG (30–60% CO) pode alterar a taxa de deposição de pó de cal — monitorar via IoT no piloto para ajuste dos intervalos de pulso.
- Adaptação de flange para fornos Maerz de modelos distintos do PFR pode gerar custo de reengenharia na expansão global.
