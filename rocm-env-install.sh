#!/bin/bash
rm -rf ./venv
python3 -m venv ./venv
source venv/bin/activate
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/rocm7.1
python3 -c "import torch; print(f'CUDA available: {torch.cuda.is_available()}'); print(f'Device: {torch.cuda.get_device_name(0) if torch.cuda.is_available() else "None"}')"
deactivate
