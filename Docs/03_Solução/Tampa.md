# 🛡️ Detalhamento Técnico: Tampa Integrada SonicGuard

## 📌 Visão Geral da Inovação
O sistema **SonicGuard** abandona o conceito de "porta que abre" para adotar uma **Tampa-Flange Integrada Permanente**. Esta solução elimina o esforço físico de manuseio de tampas de 20kg e o uso de marretas, selando o forno definitivamente e permitindo a limpeza automática via ondas sonoras.

## 🏗️ Geometria e Especificações de Montagem
O conjunto foi modelado para garantir que o som alcance os 5m de profundidade, enquanto os componentes sensíveis ficam protegidos do calor de 1100°C.
* **Pescoço de Inserção (Waveguide):**
    * **Material:** Aço Inox AISI 310S (Refratário).
    * **Comprimento:** 380mm (posicionamento estratégico para projeção acústica).
    * **Função:** Atua como um guia de onda, canalizando a energia sonora para dentro do canal sem permitir o contato direto da carcaça da buzina com a chama.
* **Corpo do Gerador de Som:**
    * **Diâmetro da Base:** 220mm.
    * **Material do Diafragma:** Inconel 625 (Resistência extrema a fadiga térmica).
* **Blindagem Térmica Refratária:**
    * O espaço entre o "pescoço" da buzina e as paredes da *poken in door* é preenchido com **concreto refratário de alta densidade**, substituindo a antiga tampa interna.

## 📡 Monitoramento IoT e Sensores Integrados
A tampa deixa de ser um componente isolado e passa a ser uma interface de dados em tempo real:
* **[Termopar tipo K]:** Monitora a temperatura na flange externa, garantindo que o isolamento refratário está funcionando e o calor não ultrapassou os limites do projeto.
* **[Sensor de pressão]:** Mede a pressão diferencial entre o canal do forno e o ambiente, acusando imediatamente se houver tentativa de refluxo de gases.
* **[Acelerômetro MEMS]:** Monitora a vibração na estrutura (segurança). Garante que a frequência da buzina está no range projetado e evita ressonâncias mecânicas na carcaça do forno.

## 🛡️ Diferenciais de Segurança
1.  **Sistema de Bloqueio de Refluxo (Válvula de Retenção):** Permite a entrada do ar comprimido (4-6 bar) para o disparo, mas bloqueia instantaneamente qualquer retorno de gases tóxicos (CO) ou calor para a rede de ar.
2.  **Vedação de Pressão Total:** A tampa de aço é parafusada com juntas de grafite expandido, garantindo estanqueidade contra vazamentos térmicos e de gases.

## 🔇 Controle de Emissão Sonora (Vazamento Acústico)
Para evitar que o ruído traseiro da buzina se torne um risco ocupacional (NR-15) nos passadiços:
1.  **Cápsula de Abafamento Acústico:** O gerador externo é encapsulado por lã de rocha de alta densidade e tecido de fibra de vidro siliconado.
2.  **Juntas de Desacoplamento:** A fixação evita o contato direto "metal com metal" usando juntas elastoméricas para que a carcaça do forno não amplifique a vibração.

## 🚨 Mapeamento de Riscos e Soluções (Troubleshooting)
1.  **Problema: Umidade e Óleo na Linha de Ar Comprimido**
    * *Solução:* Instalação de um Filtro Coalescente e Purgador Automático para garantir ar 100% seco, evitando choque térmico e trincas no diafragma de Inconel.
2.  **Problema: Afrouxamento por Fadiga Térmica**
    * *Solução:* Uso de Arruelas Belleville (Molas Prato) nos parafusos de fixação. Elas mantêm o aperto constante mesmo com a dilatação e contração do metal do forno.
3.  **Problema: Desgaste do Diafragma por Fadiga Cíclica**
    * *Solução:* Monitoramento preditivo. O acelerômetro IoT lê a assinatura de vibração. Se os padrões alterarem, o dashboard avisa para agendar a substituição da peça de forma programada e rápida (por fora do forno).