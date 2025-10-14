# FIAP — Fase 6 (Parte 2) • FarmTech Solutions
**Comparação YOLOv5 (baseline e custom) vs CNN do zero**

> Este repositório contém a **Entrega 2** da Fase 6 do PBL: comparação entre **YOLOv5 padrão**, **YOLOv5 customizada** (pesos da Entrega 1) e **CNN do zero** (classificação), **usando a mesma base** preparada na Entrega 1.

## 🧭 Sumário
- [Visão Geral](#-visão-geral)
- [Pré-requisitos](#-pré-requisitos)
- [Estrutura do Dataset](#-estrutura-do-dataset)
- [Como Executar (Google Colab)](#-como-executar-google-colab)
- [O que Preencher/Editar](#-o-que-preenchereditar)
- [Saídas e Evidências](#-saídas-e-evidências)
- [Comparação e Conclusões](#-comparação-e-conclusões)
- [Gravação do Vídeo (5 min)](#-gravação-do-vídeo-5-min)
- [Solução Técnica](#-solução-técnica)
- [Créditos](#-créditos)
- [Licença](#-licença)

---

## 🔎 Visão Geral
- **Objetivo**: avaliar criticamente três abordagens sobre a **mesma base**:
  1. **YOLOv5 Padrão (baseline)** — treino rápido com hiperparâmetros default.
  2. **YOLOv5 Custom** — **reaproveita os pesos (best.pt)** treinados na Entrega 1.
  3. **CNN do zero (Keras/TensorFlow)** — classificação por classes (sem *bounding boxes*).

- **Critérios comparados**:
  - Facilidade de uso/integração
  - Precisão (mAP/Accuracy/F1)
  - Tempo de treinamento/customização
  - Tempo de inferência (latência s/imagem)

---

## ✅ Pré-requisitos
- Google Colab com **GPU ativada** (Runtime → Change runtime type → **GPU**).
- **Google Drive** com:
  - `dataset.yaml` no formato YOLO (com `train`, `val`, `test` e `names`).
  - Pastas `images/` e `labels/` com as anotações **YOLO** da Entrega 1.
  - **Pesos customizados** da Entrega 1: `.../runs/train/expX/weights/best.pt`.
- Python ≥ 3.10 (gerenciado pelo Colab).
- Espaço livre no Drive para salvar resultados.

---

## 🗂️ Estrutura do Dataset
Exemplo (sugestivo, adapte ao seu):

/MyDrive/fase6/
  dataset/
    dataset.yaml
  images/
    train/...
    val/...
    test/...
    labels/
    train/...
    val/...
    test/...
  yolo_runs/ # 


**Atenção**: o `dataset.yaml` deve apontar corretamente para os caminhos de `train`, `val` e `test` (pasta ou arquivo .txt com a lista de imagens) e conter `names` com a lista das classes.

---

## ▶️ Como Executar (Google Colab)
1. Abra o notebook **`parte2_fase6_farmtech_yolo_cnn.ipynb`** no Colab.  
2. Execute a célula **Montar Google Drive**.  
3. **Edite os caminhos** no bloco “🔧 Configuração de caminhos (EDITE AQUI)”.  
   - `DATASET_YAML_PATH` → seu `dataset.yaml`  
   - `CUSTOM_WEIGHTS_PATH` → `best.pt` (Entrega 1)  
   - `OUTPUT_DIR` → pasta de saída no Drive  
4. Execute as seções na ordem (setup → YOLO baseline → avaliação custom → conversão → CNN → comparação).  
5. Ao final, colete as evidências (imagens, métricas e CSV/JSON) para o README e para o vídeo.

---

## ✏️ O que Preencher/Editar
No topo do notebook:
- **Autor/RM** (no cabeçalho Markdown).
- `DATASET_YAML_PATH`, `CUSTOM_WEIGHTS_PATH`, `OUTPUT_DIR`.
- Na seção **“Discussão e Conclusões”**, substitua os placeholders (**X/Y/Z**) pelos seus resultados.

---

## 📦 Saídas e Evidências
O notebook gera automaticamente:

- **YOLOv5 baseline**
  - Treino: `/content/yolo_runs/fase6_yolo_baseline/...`
  - Validação (test): `/content/yolo_val/fase6_yolo_baseline_test/...`

- **YOLOv5 custom (Entrega 1)**
  - Validação (test): `/content/yolo_val/fase6_yolo_custom_test/...`

- **Inferências (prints)**
  - `/content/yolo_detect/baseline/...`
  - `/content/yolo_detect/custom/...`

- **CNN (classificação)**
  - Pesos: `/content/cnn_baseline.h5`
  - Matriz de confusão: `cnn_confusion_matrix.png` (em `OUTPUT_DIR`)
  - Métricas: `cnn_metrics.json` (em `OUTPUT_DIR`)

- **Comparativos consolidados**
  - `comparativo_metrics.json`
  - `comparativo_metrics_table.csv`

> **Inclua no README** algumas imagens de detecção (`yolo_detect/...`) e a matriz de confusão da CNN.

---

## 📊 Comparação e Conclusões
Após rodar, preencha uma tabela de síntese como:

| Modelo            | Facilidade | Precisão (mAP/Acc/F1) | Treino (min) | Latência (s/img) | Observações |
|-------------------|------------|------------------------|--------------|------------------|------------|
| YOLOv5 Baseline   | Alta       | mAP@50=… / mAP@50-95=… | …            | …                | Setup rápido |
| YOLOv5 Custom     | Média      | **mAP@50=…**           | …            | **…**            | Melhor no meu dataset |
| CNN (Keras)       | Média      | Acc=… / F1=…           | …            | …                | Sem caixas (classificação) |

**Conclusão sugerida**: para cenários de **detecção em tempo real** (p. ex., segurança patrimonial), **YOLO custom** tende a equilibrar **alta precisão** e **baixa latência**. A **CNN** é adequada para **classificação pura** (classe por imagem), com implementação simples, porém não fornece *bounding boxes*.

---

## 🎥 Gravação do Vídeo (5 min)
- Mostre o **dataset.yaml** e a estrutura das pastas.
- Mostre de 1 a 2 **prints** das detecções (baseline vs custom).
- Mostre a **matriz de confusão** e **métricas** da CNN.
- Mostre a **tabela comparativa** (`comparativo_metrics_table.csv`) e cite a conclusão.

---

## 🧠 Solução Técnica
- **YOLOv5** (Ultralytics) para baseline e avaliação dos pesos custom (`val.py`, `detect.py`).
- **Conversão YOLO → Classificação**: seleciona **classe dominante** por imagem; empates são ignorados para a CNN.
- **CNN (Keras/TensorFlow)**: `Conv2D → MaxPool → Conv2D → MaxPool → Conv2D → Flatten → Dense → Dropout → Dense(softmax)`.
- **Métricas**:
  - YOLO: *results.txt* (mAP@50, mAP@50-95, etc.).
  - CNN: Accuracy, Precision, Recall, F1 (weighted), **latência** (s/imagem).
- **Consolidação**: CSV/JSON com latências e métricas das três abordagens.

---

## 👤 Créditos
- **Autor**: `<Seu Nome Completo>` — **RM**: `<Seu RM>`
- **Grupo**: `<1 a 5 pessoas>` (se aplicável)

---

## 📝 Licença
Este projeto é distribuído sob a licença **MIT**. Veja `LICENSE` para mais detalhes.

