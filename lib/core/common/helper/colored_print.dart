import 'package:flutter/cupertino.dart';

// Blue text
void printB(Object? msg) {
  debugPrint('\x1B[34m$msg\x1B[0m');
}

// Green text
void printG(Object? msg) {
  debugPrint('\x1B[32m$msg\x1B[0m');
}

// Yellow text
void printY(Object? msg) {
  debugPrint('\x1B[33m$msg\x1B[0m');
}

// Red text
void printR(Object? msg) {
  debugPrint('\x1B[31m$msg\x1B[0m');
}

// white text
void printW(Object? msg) {
  debugPrint('\x1B[37m$msg\x1B[0m');
}

// cyan text
void printC(Object? msg) {
  debugPrint('\x1B[36m$msg\x1B[0m');
}

// black text
void printK(Object? msg) {
  debugPrint('\x1B[30m$msg\x1B[0m');
}
