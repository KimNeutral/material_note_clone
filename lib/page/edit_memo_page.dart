import 'package:flutter/material.dart';
import 'package:material_note/component/color_indicator.dart';
import 'package:material_note/component/memo_editor.dart';
import 'package:material_note/model/memo.dart';

class EditMemoPage extends StatefulWidget {
  final Memo memo;

  EditMemoPage(this.memo);

  @override
  _EditMemoPageState createState() => _EditMemoPageState();
}

class _EditMemoPageState extends State<EditMemoPage> {
  changeColor(color) => setState(() => widget.memo.color = color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ColorIndicator(color: widget.memo.color, onColorSelected: changeColor,),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0.0,
          brightness: Brightness.light,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black38),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
        body: MemoEditor(memo: widget.memo)
    );
  }
}