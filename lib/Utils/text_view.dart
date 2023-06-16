import 'package:flutter/material.dart';

class TextView extends StatefulWidget {
  final text;
  final color;
  final double? fontSize;
  final fontFamily;
  final fontWeight;
  final TextAlign textAlign;
  final TextDecoration underLine;
  final TextOverflow overflow;

  const TextView({
    Key? key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textAlign = TextAlign.start,
    this.underLine = TextDecoration.none,
    this.overflow = TextOverflow.visible,
  }) : super(key: key);

  @override
  State<TextView> createState() => _TextViewState();
}

class _TextViewState extends State<TextView> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        decoration: widget.underLine,
        color: widget.color,
        fontSize: widget.fontSize,
        fontFamily: widget.fontFamily,
        fontWeight: widget.fontWeight,
      ),
      overflow: widget.overflow,
      textAlign: widget.textAlign,
    );
  }
}
