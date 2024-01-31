import 'package:flutter/material.dart';

class MyObject {
  int _value;
  MyObject(this._value);
  int get value => _value;
  set value(int newValue) => _value = newValue;
  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  void square() {
    _value = _value * _value;
  }

  int power(int exponent) {
    int initialValue = _value;
    if (exponent == 0) {
      _value = 1;
    }
    else {
      while(exponent-- > 1 ){
        _value *= initialValue;
      }
      if (exponent < 0) {
         _value = 1.0 ~/ _value;
      }
    }
    return _value;
  }
}
