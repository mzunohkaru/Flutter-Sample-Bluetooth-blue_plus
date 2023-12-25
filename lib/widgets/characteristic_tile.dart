import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_blue_plus_sample/utils.dart/snackbar.dart';
import 'package:flutter_blue_plus_sample/widgets/descriptor_tile.dart';

class CharacteristicTile extends StatefulWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;

  const CharacteristicTile(
      {Key? key, required this.characteristic, required this.descriptorTiles})
      : super(key: key);

  @override
  State<CharacteristicTile> createState() => _CharacteristicTileState();
}

class _CharacteristicTileState extends State<CharacteristicTile> {
  List<int> _value = [];

  late StreamSubscription<List<int>> _lastValueSubscription;

  @override
  void initState() {
    super.initState();
    _lastValueSubscription =
        widget.characteristic.lastValueStream.listen((value) {
      _value = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _lastValueSubscription.cancel();
    super.dispose();
  }

  BluetoothCharacteristic get c => widget.characteristic;

  // 書き込むデータは4バイトのランダムなデータ
  List<int> _getRandomBytes() {
    final math = Random();
    // 0から255までのランダムな整数を4つ生成し、リストとして返す
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  Future onReadPressed() async {
    try {
      await c.read();
      Snackbar.show(ABC.c, "Read: Success", success: true);
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Read Error:", e), success: false);
    }
  }

  Future onWritePressed() async {
    try {
      // Bluetoothの特性（Characteristic）にランダムなバイトデータを書き込む
      await c.write(_getRandomBytes(),
          // 書き込み操作が応答なし（Response）で行われるべきかどうかを示します
          withoutResponse: c.properties.writeWithoutResponse);
      Snackbar.show(ABC.c, "Write: Success", success: true);
      if (c.properties.read) {
        // 特性の現在の値を読み取り
        await c.read();
      }
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Write Error:", e), success: false);
    }
  }

  Future onSubscribePressed() async {
    try {
      // 現在の通知の状態に基づいて、次の操作が Subscribe か Unubscribe かを決定します
      String op = c.isNotifying == false ? "Subscribe" : "Unubscribe";
      // 特性の通知の状態を切り替えます
      // c.isNotifying == falseの場合、通知を開始（Subscribe）します。それ以外の場合は通知を停止（Unubscribe）します
      await c.setNotifyValue(c.isNotifying == false);
      // 通知の状態の切り替えが成功した場合
      Snackbar.show(ABC.c, "$op : Success", success: true);
      if (c.properties.read) {
        // 特性の現在の値を読み取り
        await c.read();
      }
      setState(() {});
    } catch (e) {
      Snackbar.show(ABC.c, prettyException("Subscribe Error:", e),
          success: false);
    }
  }

  Widget buildUuid(BuildContext context) {
    // Bluetoothの特性（Characteristic）のUUID（Universally Unique Identifier）を取得し、それを大文字の16進数形式の文字列に変換しています
    // '0x${...}'という形式で結果を文字列に組み込みます。ここで0xは16進数を表すプレフィックスです
    String uuid = '0x${widget.characteristic.uuid.str.toUpperCase()}';
    return Text(uuid, style: const TextStyle(fontSize: 13));
  }

  Widget buildValue(BuildContext context) {
    // リストの内容を文字列に変換
    String data = _value.toString();
    return Text(data, style: const TextStyle(fontSize: 13, color: Colors.grey));
  }

  Widget buildReadButton(BuildContext context) {
    return TextButton(
        child: const Text("Read"),
        onPressed: () async {
          await onReadPressed();
          setState(() {});
        });
  }

  Widget buildWriteButton(BuildContext context) {
    bool withoutResp = widget.characteristic.properties.writeWithoutResponse;
    return TextButton(
        child: Text(withoutResp ? "WriteNoResp" : "Write"),
        onPressed: () async {
          await onWritePressed();
          setState(() {});
        });
  }

  Widget buildSubscribeButton(BuildContext context) {
    bool isNotifying = widget.characteristic.isNotifying;
    return TextButton(
        child: Text(isNotifying ? "Unsubscribe" : "Subscribe"),
        onPressed: () async {
          await onSubscribePressed();
          setState(() {});
        });
  }

  Widget buildButtonRow(BuildContext context) {
    bool read = widget.characteristic.properties.read;
    bool write = widget.characteristic.properties.write;
    bool notify = widget.characteristic.properties.notify;
    bool indicate = widget.characteristic.properties.indicate;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Characteristic が読み取り可能な場合
        if (read) buildReadButton(context),
        // Characteristic が書き込み可能な場合
        if (write) buildWriteButton(context),
        // Characteristic が通知と指示が可能な場合
        if (notify || indicate) buildSubscribeButton(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('Characteristic'),
            buildUuid(context),
            buildValue(context),
          ],
        ),
        subtitle: buildButtonRow(context),
        contentPadding: const EdgeInsets.all(0.0),
      ),
      children: widget.descriptorTiles,
    );
  }
}
