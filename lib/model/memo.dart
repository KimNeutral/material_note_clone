import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Memo {
  String id;
  String title;
  String content;
  Color color;

  Memo({this.title = "", this.content = "", this.color = Colors.blue}){
    id = Uuid().v1();
  }


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Memo &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Memo{idx: $id, title: $title, content: $content, color: $color}';
  }
}