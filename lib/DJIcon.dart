import 'package:flutter/material.dart';

class DJIcon extends StatefulWidget {
  final String _mIconNormalPath;
  final String _mIconHoldPath;
  final Function _mClickListener;

  DJIcon(this._mIconNormalPath, this._mIconHoldPath, this._mClickListener);

  @override
  _DJIconState createState() => _DJIconState();
}

class _DJIconState extends State<DJIcon> {
  String _mIconPath;

  @override
  Widget build(BuildContext context) {
    if (_mIconPath == null) {
      _mIconPath = widget._mIconNormalPath;
    }

    return GestureDetector(
        child: Image(image: AssetImage(_mIconPath)),
        onTapDown: (TapDownDetails details) => setIconPathToHold(),
        onTapUp: (TapUpDetails details) => setIconPathToNormal(),
        onTapCancel: () => setIconPathToNormal(),
        onTap: () => onClick());
  }

  void setIconPathToHold() {
    setState(() {
      _mIconPath = widget._mIconHoldPath;
    });
  }

  void setIconPathToNormal() {
    setState(() {
      _mIconPath = widget._mIconNormalPath;
    });
  }

  void onClick() {
    print("測試Log_DJIcon - onClick()");
    if (widget._mClickListener != null) {
      widget._mClickListener();
    }
  }
}
