# pre
sudo apt install python3-pip python3-venv

# virtual env - inside cloned project
python3 -m venv ./venv

# start env
source .venv/bin/activate

# install deps
pip install -e .
