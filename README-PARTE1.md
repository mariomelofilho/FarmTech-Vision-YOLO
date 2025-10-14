# 🎯 FarmTech Vision Solutions - Sistema de Detecção de Objetos com YOLO

## 📋 Visão Geral do Projeto

Este projeto faz parte da **Fase 6** do curso de Inteligência Artificial da FIAP, desenvolvido para a **FarmTech Solutions**. O objetivo é demonstrar a implementação prática de um sistema de visão computacional utilizando a arquitetura **YOLOv5** para detecção de objetos em tempo real.

### 🎯 **Objetivos Principais**
- Desenvolver um sistema de detecção de objetos usando YOLOv5
- Comparar performance entre diferentes configurações de treinamento (30 vs 60 épocas)
- Demonstrar aplicabilidade prática da visão computacional
- Avaliar métricas de acurácia, precisão e recall

## 🧠 **Fundamentação Teórica**

### **YOLO (You Only Look Once)**
O YOLO revolucionou a detecção de objetos ao tratar o problema como uma única regressão end-to-end, diferente dos métodos tradicionais de duas etapas (R-CNN, Fast R-CNN).

**Principais Vantagens:**
- ⚡ **Velocidade**: Processamento em tempo real (>30 FPS)
- 🎯 **Precisão**: mAP competitivo com métodos estado-da-arte
- 💡 **Eficiência**: Menor uso de recursos computacionais

### **Arquitetura YOLOv5**
- **Backbone**: CSPDarknet53 para extração de features
- **Neck**: PANet para fusão de features multi-escala
- **Head**: Camadas de detecção para predição final

## 📊 **Dataset e Metodologia**

### **Classes de Objetos Selecionadas**
- **Classe 0**: Veículos (carros, motos, caminhões)
- **Classe 1**: Pedestres (pessoas caminhando)

### **Distribuição dos Dados**
- **Treinamento**: 64 imagens (32 por classe)
- **Validação**: 8 imagens (4 por classe)
- **Teste**: 8 imagens (4 por classe)
- **Total**: 80 imagens

### **Experimentos Planejados**
1. **Experimento 1**: 30 épocas de treinamento
2. **Experimento 2**: 60 épocas de treinamento

## �� **Como Executar o Projeto**

### **1. Acesso ao Notebook Principal**
📓 **[Abrir Notebook no Google Colab](https://drive.google.com/drive/folders/1QClCMvIgSrBdM7y5b_coLSUgCYieDRm9?usp=sharing)**

