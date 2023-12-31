# Bluetooth 用語集


## BLEとBluetooth Classicの違い
・BLEはBluetooth Classicよりも省電力な通信方式
・BLEはBluetooth Classicよりもデータ転送速度が低い
・BLEはBluetooth Classicよりもチャンネル数が少ない
・BLEはBluetooth Classicよりもパケットが短い

## プロトコル
「コントローラ」「ホスト」「アプリケーション」の３層で構成されている。
・コントローラはホストコントローラインターフェース（HCI）によってホストと命令・イベントをやり取りする
・ホストは通信の多重化やBluetoothの標準的な機能を実装する（Security Manager / SM）（L2CAP）（Attribute Protocol / ATT）（Generic Attribute Profile / GATT）（Generic Access Profile / GAP）など
・アプリケーションは各種APIを用いてホストと命令・イベントのやり取りを行う

## ルート
Bluetoothネットワークの中心デバイスで、他のデバイスからの通信を受信、送信する

## ポップ
Bluetooth機器同士の通信を管理する機能

## セントラル
BLE通信を開始するデバイス

## ペリフェラル
BLE通信を受けるデバイス

## アドバタイズ
ペリフェラルがセントラルに対して接続を待ち受ける状態

## サービスディスカバリー
セントラルがペリフェラルが提供するサービスを調べる処理

## 要求
セントラルからペリフェラルに対してデータを要求する方法

## RSSI
Bluetoothデバイスが受信した信号の相対的な品質レベル（信号の強度）の値。通常、負のデシベル単位（dBm）で表示され、値が0に近いほど信号が強いことを示す

## MTU
一度に送信できるデータパケットの最大サイズ
・BLE 4.0　＝　20バイト
・BLE 4.2　＝　257バイト（一般的には、BLE接続機器の性能に依存し150バイト前後まで下がる）

## Characteristic（キャラクタリスティック）
Bluetoothデバイスが提供する具体的なデータを指します。これは、デバイスの特定の機能や情報を表すもので、例えばバッテリーレベル、心拍数、温度などが該当します。
・read : 読み取り
・write : 書き込み
・notify : 通知（特性の値が変更されたときにデバイスにその変更を自動的に送信する機能を指します）
・indicate : 指示（通知と似ている。違う点は、変更を受け取ったことを確認する応答を返す必要があるため、送信側が値を受け取られたことを確認できる）

## プロファイル
特定デバイスに関する仕様書で、特にGAPはBLEにおける最上位の定義

## チャンネル
2.4GHz帯の電波を利用

## ペアリング
スマホ同士をBluetoothデバイスとして認識させること

## ボンディング
ペアリング後にBluetoothデバイスとして固定すること


ソース
https://houwa-js.co.jp/2018/06/20180629/


# 実行結果

## MTU
<img width="954" alt="スクリーンショット 2023-12-26 11 56 18" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/562317fa-1160-4d4d-b494-0391afe73c09">

## get service
<img width="954" alt="スクリーンショット 2023-12-26 11 56 08" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/9d617552-410b-458b-b0bc-e9faafea321b">

## read
<img width="954" alt="スクリーンショット 2023-12-26 11 56 42" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/23bbfbfa-d4b2-4795-a947-5bdf10105040">

## write
<img width="954" alt="スクリーンショット 2023-12-26 11 56 55" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/044fe4d5-f7b0-43c4-b463-cc386266a685">

## notify
<img width="954" alt="スクリーンショット 2023-12-26 11 57 02" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/d3ff0187-5ccb-42a3-84e6-bf25192edd55">

## pair & bond
<img width="954" alt="スクリーンショット 2023-12-26 11 57 14" src="https://github.com/mzunohkaru/Flutter-Sample-Bluetooth-blue_plus/assets/99012157/8daa5587-52aa-45d8-a5fa-8df0344a67f0">
