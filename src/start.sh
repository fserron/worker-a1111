#!/bin/bash

echo "Worker Initiated"

echo "Directory checks"
ls -la
echo "stable-diffusion-webui"
cd stable-diffusion-webui
ls -la
echo "models"
cd models
ls -la
echo "Stable-diffusion"
cd Stable-diffusion
ls -la
echo "Back to root"
cd /
ls -la
echo "runpod-volume"
cd runpod-volume
ls -la
echo "models"
cd models
ls -la

echo "Starting WebUI API"
python /stable-diffusion-webui/webui.py --skip-python-version-check --skip-torch-cuda-test --no-tests --skip-install --lowram --opt-sdp-attention --disable-safe-unpickle --port 3000 --api --nowebui --skip-version-check  --no-hashing --no-download-sd-model &

echo "Starting RunPod Handler"
python -u /rp_handler.py
