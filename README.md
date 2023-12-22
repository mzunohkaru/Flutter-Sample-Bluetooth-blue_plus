# Bluetooth 用語集


## ルート
Bluetoothネットワークの中心デバイスで、他のデバイスからの通信を受信、送信する

## ポップ
Bluetooth機器同士の通信を管理する機能

## BLEとBluetooth Classicの違い
・BLEはBluetooth Classicよりも省電力な通信方式
・BLEはBluetooth Classicよりもデータ転送速度が低い
・BLEはBluetooth Classicよりもチャンネル数が少ない
・BLEはBluetooth Classicよりもパケットが短い

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




