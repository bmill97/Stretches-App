import 'package:sp/Stretch.dart';
import 'package:flutter/material.dart';

class StretchChip extends StatefulWidget {
  final Stretch stretch;
  final Function(Stretch stretch)? onClick;

  StretchChip({required this.stretch, this.onClick, Key? key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return StretchChipState();
  }
}

class StretchChipState extends State<StretchChip> {
  // Here, the late keyword indicates that we WILL receive a stretch object
  // See: Flutter null-safety
  late Stretch stretch;

  @override
  void initState() {
    super.initState();
    stretch = widget.stretch;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onClick != null) {
          widget.onClick!(stretch);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0, vertical: 2.0),
          child: Card(
            color: const Color(0xFF7D98A1),
            child: SizedBox(
              width: 400,
              height: 75,
              child: Text(
                stretch.getName(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 33,
                  height: 1.85
                ),
              ),
          ),
    ),
    )
    );
  }
}
