import 'package:flutter/material.dart';

import 'package:birthday_app/common/strings.dart';


class ExpandedProvider with ChangeNotifier{
  bool _isExpanded = false;
  String _foldText = Strings.collapse;

  String get foldText => _foldText;
  bool get isExpanded => _isExpanded;

  void folding(){
    _isExpanded = !_isExpanded;
    _foldText = (_isExpanded) ? Strings.expand : Strings.collapse;
    notifyListeners();
  }

}
