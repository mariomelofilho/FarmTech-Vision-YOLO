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
- **Google Drive** com:
  - `dataset.yaml` no formato YOLO (com `train`, `val`, `test` e `names`).
  - Pastas `images/` e `labels/` com as anotações **YOLO** da Entrega 1.
  - **Pesos customizados** da Entrega 1: `MyDrive/FarmTech-Parte2/results/farmtech_60_epochs/weights/best.pt`.

---

**Atenção**: o `dataset.yaml` foi copiado do notebook da parte1(/content/drive/MyDrive/FarmTech_YOLO_PROJECT/dataset) e editado para apontar para path da parte2(/content/drive/MyDrive/FarmTech-Parte2/dataset)

---

## �� **Como Executar o Projeto**

### **1. Acesso ao Notebook Principal**
📓 **[Abrir Notebook no Google Colab](https://drive.google.com/drive/folders/1QClCMvIgSrBdM7y5b_coLSUgCYieDRm9?usp=sharing)**


## ▶️ Como Executar (Google Colab)
1. **[Abrir Notebook da Parte2 no Google Colab](https://drive.google.com/drive/folders/1A_6KW9Ah3LVeyLyXPSC8_EA4S67eavAj?usp=sharing)
2. Copiar arquivos de dataset para seu drive
3. Execute a célula **Montar Google Drive**.  
4. **Paths importantes** 
   - `DATASET_YAML_PATH` → seu `dataset.yaml`  
   - `CUSTOM_WEIGHTS_PATH` → `best.pt` (Entrega 1)  
   - `OUTPUT_DIR` → pasta de saída no Drive  
5. Execute as seções na ordem (setup → YOLO baseline → avaliação custom → conversão → CNN → comparação).  
6. Ao final, colete as evidências (imagens, métricas e CSV/JSON) para o README e para o vídeo.

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

---

## 📊 Comparação e Conclusões

 No próprio  Notebook Jupyter a sessões de análise e no finial uma sessão mais extença de conclusões.


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
- **Autores**: `Carlos Mário` — **RM**: `RM563769` e group