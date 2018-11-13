import 'package:flutter/material.dart';
import 'package:material_note/behavior/no_scroll_glow_behavior.dart';
import 'package:material_note/model/memo.dart';

class MemoEditor extends StatefulWidget {
  final Memo memo;

  final VoidCallback titleListener;
  final VoidCallback contentListener;

  MemoEditor({Key key, @required this.memo, this.titleListener, this.contentListener}) : super(key: key);

  @override
  MemoEditorState createState() => MemoEditorState();
}

class MemoEditorState extends State<MemoEditor> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      widget.memo.title = _titleController.text;
    });
    _contentController.addListener(() {
      widget.memo.content = _contentController.text;
    });

    if (widget.titleListener != null)
      _titleController.addListener(widget.titleListener);
    if (widget.contentListener != null)
      _contentController.addListener(widget.contentListener);

    _titleController.text = widget.memo.title;
    _contentController.text = widget.memo.content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: ScrollConfiguration(
        behavior: NoScrollGlowBehavior(),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextField(
                controller: _titleController,
                style: Theme.of(context).textTheme.title.copyWith(color: widget.memo.color),
                decoration: InputDecoration.collapsed(
                  hintText: "Title",
                  hintStyle: Theme.of(context).textTheme.title.copyWith(color: widget.memo.color),
                ),
              ),
            ),
            TextField(
              keyboardType: TextInputType.multiline,
              controller: _contentController,
              style: Theme.of(context).textTheme.body1,
              decoration: InputDecoration.collapsed(
                hintText: "Note",
                hintStyle: Theme.of(context).textTheme.body1.copyWith(color: Colors.black38),
              ),
              maxLines: 100000,
            )
          ],
        ),
      ),
    );
  }
}