// import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// void sendData() async {
//   FlutterBluePlus flutterBlue = FlutterBluePlus.instance;

//   // デバイスをスキャン
//   var scanResults = await flutterBlue.scanForDevices(scanMode: ScanMode.lowLatency);

//   // 適切なデバイスを選択
//   BluetoothDevicePlus device = scanResults.firstWhere((device) => device.name == 'your device name');

//   // デバイスに接続
//   await device.connect();

//   // サービスを取得
//   List<BluetoothServicePlus> services = await device.discoverServices();

//   // 適切なサービスを選択
//   BluetoothServicePlus service = services.firstWhere((service) => service.uuid == 'your service uuid');

//   // 特性を取得
//   List<BluetoothCharacteristicPlus> characteristics = service.characteristics;

//   // 適切な特性を選択
//   BluetoothCharacteristicPlus characteristic = characteristics.firstWhere((characteristic) => characteristic.uuid == 'your characteristic uuid');

//   // データを送信
//   await characteristic.write([0x01, 0x02, 0x03, 0x04]);
// }