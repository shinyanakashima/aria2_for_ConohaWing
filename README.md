# 概要
Conoha Wingはレンタルサーバーであるため、任意のコマンドがインストールできない。
そのため、podmanを使ってコマンドをビルドし、出来上がったバイナリをサーバーにアップして利用する。

## ビルド対象
高速分散ダウンローダーのaria2。

## RPM file
https://dl.fedoraproject.org/pub/archive/epel/7/x86_64/Packages/a/

## Commands
```bash
podman build --network host -t conoha-aria2 .
```

- for Linux
```bash
podman run --rm -v $(pwd):/output conoha-aria2 cp /usr/bin/aria2c /output/
```

- for Windows
```bash
podman run --rm -v ${PWD}:/output conoha-aria2 cp /usr/bin/aria2c /output/
```
