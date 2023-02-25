ARG CUDA=nocuda
FROM anibali/pytorch:1.10.2-${CUDA}-ubuntu20.04

COPY requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt
USER root
COPY data_modules/ /app/data_modules
COPY models/ /app/models
COPY toolbox/ /app/toolbox

# copy unzipped human_value_trained_models
RUN mkdir -p /app/checkpoints/human_value_trained_models/
COPY checkpoints/human_value_trained_models/*.pkl /app/checkpoints/human_value_trained_models/
COPY checkpoints/human_value_trained_models/HCV-364-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-364-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-366-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-366-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-368-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-368-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-371-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-371-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-372-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-372-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-375-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-375-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-402-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-402-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-403-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-403-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-405-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-405-danschr-roberta-large-BS_16-EPOCHS_8-LR_5e-05-ACC_GRAD_2-MAX_LENGTH_165-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-406-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-406-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-408-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-408-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
COPY checkpoints/human_value_trained_models/HCV-409-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt /app/checkpoints/human_value_trained_models/HCV-409-microsoft-deberta-large-BS_8-LR_2e-05-HL_None-DROPOUT_None-SL_None.ckpt
# download pretrained data for models
COPY checkpoints/model_sources.txt /app/checkpoints/model_sources.txt
COPY download_pretrained_models.py /app/download_pretrained_models.py
RUN python3 /app/download_pretrained_models.py /app/checkpoints/model_sources.txt

COPY predict.py /app/predict.py
