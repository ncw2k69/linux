## Configuration Methods
### Via Lemonade CLI (TESTED, WORKING)
Run the configuration command in your terminal to set the backend to Vulkan (`cuda`, `rocm`, `vulkan`, `cpu`)
```bash
lemonade config set llamacpp.backend=vulkan
```
### Via Environment Variable (NOT TESTED) 
Set the environment override before launching the server:
```bash
export LEMONADE_LLAMACPP="vulkan"
```
### Via JSON Config File (NOT TESTED) 
Open your configuration file (typically located at `~/.cache/lemonade/config.json` or your system equivalent) and change the model or global backend property:
```json
{
  ...
  "llamacpp_backend": "vulkan"
  ...
}
```
### Additional Device Targeting (NOT TESTED) 
If you need to specify a particular physical GPU device index when multiple adapters are present, pass the device flag:
```bash
lemonade config set llamacpp_device 0
```
