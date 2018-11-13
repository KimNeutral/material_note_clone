import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/material_picker.dart';

typedef ColorSelectedCallback(Color selectedColor);

class ColorIndicator extends StatefulWidget {
  final Color color;
  final ColorSelectedCallback onColorSelected;

  ColorIndicator({
    @required this.color,
    @required this.onColorSelected
  });

  @override
  State<StatefulWidget> createState() {
    return _ColorIndicatorState();
  }
}

class _ColorIndicatorState extends State<ColorIndicator> {
  Color color;

  _ColorIndicatorState();


  @override
  void initState() {
    super.initState();
    this.color = widget.color;
  }

  changeMaterialColor(Color color) => setState(() {
    this.color = color;
    widget.onColorSelected(color);
    Navigator.of(context).pop();
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.color
        ),
      ),
      onTap: () {
        showColorDialog();
      },
    );
  }

  void showColorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.all(0.0),
          contentPadding: EdgeInsets.all(0.0),
          content: SingleChildScrollView(
            child: MaterialPicker(
              pickerColor: widget.color,
              onColorChanged: changeMaterialColor,
              enableLabel: true,
            ),
          ),
        );
      },
    );
  }
}
