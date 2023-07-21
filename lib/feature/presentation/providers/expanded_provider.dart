import 'package:flutter/material.dart';


class ExpandedProvider with ChangeNotifier{
  bool _isExpanded = false;
  String _foldText = "Свернуть ▲";

  String get foldText => _foldText;
  bool get isExpanded => _isExpanded;

  void folding(){
    _isExpanded = !_isExpanded;
    _foldText = (_isExpanded) ? "Развернуть ▼" : "Свернуть ▲";
    notifyListeners();
  }

}
