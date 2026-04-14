# Lean Canvas — Projetos

Bem-vindo ao diretório de Lean Canvas! Este folder contém modelos de negócio estruturados em formato de canvas.

## 📊 Projetos Disponíveis

### 1. **LHOIST-Lean-Canvas.canvas** ⭐ NOVO
Automação de limpeza em fornos da Lhoist Matozinhos-MG.

**Arquivos (resumidos para caber em cards):**
- `SEGMENTOS-DE-CLIENTES-LHOIST.md` — Cliente: Lhoist; Stakeholders
- `PROBLEMA-LHOIST.md` — 3 problemas principais + alternativas
- `PROPOSTA-VALOR-LHOIST.md` — 5 pilares de valor
- `SOLUCAO-LHOIST.md` — ⏳ AGUARDANDO DESENVOLVIMENTO (4 opções tecnológicas)
- `CANAIS-LHOIST.md` — 6 canais de comunicação
- `ESTRUTURA-CUSTOS-LHOIST.md` — Custos + COGS + Break-even
- `FLUXOS-RECEITA-LHOIST.md` — 4 modelos de negócio
- `METRICAS-CHAVE-LHOIST.md` — KPIs técnicas, financeiras, satisfação
- `VANTAGEM-INJUSTA-LHOIST.md` — 7 vantagens não-replicáveis

**Como abrir:**
1. Abra arquivo `LHOIST-Lean-Canvas.canvas` no Obsidian
2. Canvas view mostra todos os 9 cards visualmente
3. Clique em cada card para ver o conteúdo resumido

**Documentação Detalhada:**
Para análise aprofundada, consulte a pasta `06_Pesquisa_Empresa/02_LHOIST/PESQUISA_DETALHADA/`

---

### 2. **Obsidian Lean Canvas.canvas**
Template genérico com boilerplate original (em inglês).

---

## 🎯 Como Usar o Canvas

### Visualizar
```
Obsidian → Abrir arquivo .canvas
Resultado: Visualização gráfica com cards em layout canvas
```

### Navegar
- Clique em qualquer card azul para ver seu conteúdo
- Zoom com mouse wheel
- Mova cards com drag-and-drop (não afeta o arquivo)

### Editar
- Edite conteúdo dos arquivos .md
- Canvas atualiza automaticamente (referência viva)

---

## 📝 Padrão de Tamanho de Cards

Cada card é dimensionado para:
- **Altura:** 400-900px (dependendo da seção)
- **Largura:** 420px (padrão) ou 1080px (custos + receita)
- **Conteúdo:** 300-500 palavras (resumido, sem formatações complexas)

**Tipos de Seção:**
- **Altas** (900px): Problema, Segmentos, Proposta de Valor (muito conteúdo)
- **Médias** (460px): Canais, Métricas, Solução (conteúdo moderado)
- **Largas** (1080px): Custos, Receita (tabelas em 2 colunas)

---

## 🔗 Estrutura de Pastas

```
09_Lean_Canvas/
├── LHOIST-Lean-Canvas.canvas          ← Canvas visual (abrir no Obsidian)
├── SEGMENTOS-DE-CLIENTES-LHOIST.md    ← 9 arquivos resumidos
├── PROBLEMA-LHOIST.md
├── PROPOSTA-VALOR-LHOIST.md
├── SOLUCAO-LHOIST.md
├── CANAIS-LHOIST.md
├── ESTRUTURA-CUSTOS-LHOIST.md
├── FLUXOS-RECEITA-LHOIST.md
├── METRICAS-CHAVE-LHOIST.md
├── VANTAGEM-INJUSTA-LHOIST.md
├── Obsidian Lean Canvas.canvas        ← Template genérico
├── 💎 UNIQUE VALUE PROPOSITION.md      ← Arquivos template (ignore)
├── ... (mais arquivos template)
└── README.md                           ← Este arquivo

06_Pesquisa_Empresa/02_LHOIST/
└── PESQUISA_DETALHADA/
    └── [arquivos analyticamente detalhados para referência]
```

---

## 📋 Checklist para Novo Projeto

Se quiser criar um novo Lean Canvas:

- [ ] Criar 9 arquivos .md (sem emojis) com nomes descritivos
- [ ] Cada arquivo: 300-500 palavras (resumido para caber em card)
- [ ] Criar arquivo `.canvas` JSON com referências dos 9 arquivos
- [ ] Copiar estrutura do `LHOIST-Lean-Canvas.canvas` como template
- [ ] Testar abertura no Obsidian (abrir com "Open as canvas")

**Template JSON:**
```json
{
  "nodes": [
    {
      "type": "file",
      "file": "09_Lean_Canvas/SEU-ARQUIVO.md",
      "id": "seu-id-unico",
      "x": -460, "y": -760,
      "width": 420, "height": 900,
      "color": "2"
    }
    // ... mais 8 cards
  ],
  "edges": []
}
```

---

## 🎨 Cores dos Cards

| Cor | Uso | Código |
|-----|-----|--------|
| Azul 1 | Problema | `"color":"1"` |
| Verde 2 | Proposta de Valor | `"color":"2"` |
| Amarela 3 | Canais | `"color":"3"` |
| Roxa 4 | Métricas + Receita | `"color":"4"` |
| Laranja 5 | Solução | `"color":"5"` |
| Magenta 6 | Vantagem Injusta | `"color":"6"` |
| Custom | Personalized (hex) | `"color":"#014dfe"` |

---

## 💡 Dicas

1. **Resumir é arte:** Mantenha cada card a ~1 tela. Se não couber, mude para PESQUISA_DETALHADA/
2. **Consistência:** Use mesmo estilo/tom em todos os cards do projeto
3. **Links internos:** Você pode usar `[[arquivo.md]]` dentro dos cards para ligações
4. **Backup:** Sempre mantenha versões longas na pasta de pesquisa (para referência)

---

_Última atualização: 2026-04-14_
