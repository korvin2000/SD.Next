#!/usr/bin/env bash

if [[ -z "$(cat extensions-builtin/multidiffusion-upscaler-for-automatic1111/scripts/tilediffusion.py | grep 'int(scale_factor')" ]];then
    sed -i 's/scale_factor \* p.width_original_md/int(scale_factor \* p.width_original_md)/' extensions-builtin/multidiffusion-upscaler-for-automatic1111/scripts/tilediffusion.py
    sed -i 's/scale_factor \* p.height_original_md/int(scale_factor \* p.height_original_md)/' extensions-builtin/multidiffusion-upscaler-for-automatic1111/scripts/tilediffusion.py
fi
[[ -z "$(cat extensions-builtin/multidiffusion-upscaler-for-automatic1111/tile_methods/multidiffusion.py | grep "# assert p.sampler_name != 'UniPC'")" ]] && sed -i "s/assert p.sampler_name != 'UniPC'/# assert p.sampler_name != 'UniPC'/" extensions-builtin/multidiffusion-upscaler-for-automatic1111/tile_methods/multidiffusion.py
if [[ -z "$(cat extensions-builtin/sd-dynamic-thresholding/scripts/dynamic_thresholding.py | grep "# if orig_sampler_name == 'UniPC' and p.enable_hr")" ]];then
    sed -i 's/raise RuntimeError(f"UniPC/# raise RuntimeError(f"UniPC/' extensions-builtin/sd-dynamic-thresholding/scripts/dynamic_thresholding.py
    sed -i "s/if orig_sampler_name == 'UniPC' and p.enable_hr/# if orig_sampler_name == 'UniPC' and p.enable_hr/" extensions-builtin/sd-dynamic-thresholding/scripts/dynamic_thresholding.py
fi
