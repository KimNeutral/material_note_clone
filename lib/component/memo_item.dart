import 'package:flutter/material.dart';
import 'package:material_note/model/memo.dart';
import 'package:material_note/page/edit_memo_page.dart';

typedef MemoCallback(Memo memo);

class MemoItem extends StatefulWidget {
  final Memo memo;
  final MemoCallback onTap;
  final MemoCallback onArchive;
  final MemoCallback onDelete;
  final MemoCallback onShare;

  MemoItem({@required this.memo, this.onTap, this.onArchive, this.onDelete, this.onShare});

  @override
  State<StatefulWidget> createState() {
    return _MemoItemState();
  }
}

class _MemoItemState extends State<MemoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0).add(EdgeInsets.symmetric(horizontal: 15.0)),
      child: GestureDetector(
        onLongPress: () => showMenuDialog(),
        child: RaisedButton(
          onPressed: () {
            if (widget.onTap != null) widget.onTap(widget.memo);
          },
          color: widget.memo?.color,
          padding: const EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(widget.memo?.title, style: Theme.of(context).textTheme.title.copyWith(color: Colors.white),),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Text(widget.memo?.content, style: Theme.of(context).textTheme.body2.copyWith(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }

  void showMenuDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
          children: <Widget>[
            new SimpleDialogOption(
              onPressed: () {
                if (widget.onArchive != null) widget.onArchive(widget.memo);
                Navigator.pop(context);
              },
              child: Text('Archive note'),
            ),
            new SimpleDialogOption(
              onPressed: () {
                if (widget.onDelete != null) widget.onDelete(widget.memo);
                Navigator.pop(context);
              },
              child: Text('Delete note'),
            ),
            new SimpleDialogOption(
              onPressed: () {
                if (widget.onShare != null) widget.onShare(widget.memo);
                Navigator.pop(context);
              },
              child: Text('Share note'),
            ),
          ],
        );
      },
    );
  }
}
