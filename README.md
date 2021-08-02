# Device Tree for OnePlus Nord N200 5G (holi)

The OnePlus Nord N200 5G (codenamed _"holi"_) is a budget smartphone from OnePlus.
It was released June 25th, 2021.

| Basic                   | Spec Sheet                                                                                                                     |
| -----------------------:|:------------------------------------------------------------------------------------------------------------------------------ |
| CPU                     | Octa-core (2x2.0 GHz Kryo 460 & 6x1.8 GHz Kryo 460)                                                                            |
| Chipset                 | Qualcomm SM4350 Snapdragon 480 5G (8 nm)                                                                                       |
| GPU                     | Adreno 619                                                                                                                     |
| Memory                  | 4 GB RAM                                                                                                                       |
| Shipped Android Version | 11.0                                                                                                                           |
| Storage                 | 64 GB                                                                                                                          |
| Battery                 | Non-removable Li-Po 5000 mAh battery                                                                                           |
| Display                 | LTPS IPS LCD, 90Hz, 1080 x 2400 pixels, 20:9 ratio (~405 ppi density)                                                          |

Copyright 2021 - The LineageOS Project.

## Compile

TODO: verify this!

First download omni-9.0 tree:

```
repo init --depth 1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-11
```

Then add these projects to .repo/local_manifests/roomservice.xml:

```xml
<project path="device/oneplus/holi"
  name="daboross/android_device_oneplus_holi"
  remote="github"
  revision="android-11.0" />
<project name="daboross/android_device_oneplus_holi" path="device/oneplus/holi" remote="github" revision="android-11.0" />
```

If you don't have the file, create the whole file as follows:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <remote name="github"
    fetch="https://github.com" />
  <project path="device/oneplus/holi"
    name="daboross/android_device_oneplus_holi"
    remote="github"
    revision="android-11.0" />
</manifest>
```

Now you can sync your source:

```
repo sync
```

Finally execute these:

```
. build/envsetup.sh
export ALLOW_MISSING_DEPENDENCIES=true
export LC_ALL=C
lunch aosp_holi-eng
mka adbd recoveryimage
```

To test it:

```
fastboot boot out/target/product/holi/recovery.img
```

Kernel Source: https://github.com/pappschlumpf/op6/tree/9.0

## Credits

This whole thing was originally by @mauronoforio, so big thanks to you!

Original repo: https://github.com/TeamWin/android_device_oneplus_fajita

---
Original credits for Fajita:

I want to say a big thanks to @twinnfamous
