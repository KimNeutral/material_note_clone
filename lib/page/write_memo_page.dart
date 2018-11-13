import 'package:flutter/material.dart';
import 'package:material_note/component/color_indicator.dart';
import 'package:material_note/component/memo_editor.dart';
import 'package:material_note/model/memo.dart';

class WriteMemoPage extends StatefulWidget {
  @override
  _WriteMemoPageState createState() => _WriteMemoPageState();
}

class _WriteMemoPageState extends State<WriteMemoPage> {
  Memo memo = Memo();

  changeColor(color) => setState(() => memo.color = color);

  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              ColorIndicator(color: memo.color, onColorSelected: changeColor,),
              Expanded(child: Container()),
              IconButton(
                icon: Icon(Icons.check, color: Colors.black38),
                onPressed: () => popAndPassMemo(),
              )
            ]
          ),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          brightness: Brightness.light,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black38),
              onPressed: () => pop(),
            ),
          ),
        ),
        body: MemoEditor(memo: memo,)
    );
  }

  void pop() {
    Navigator.of(context).pop();
  }

  void popAndPassMemo() {
    Navigator.of(context).pop(memo);
  }
}