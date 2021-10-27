import 'package:flutter/material.dart';

abstract class LoginAdapter {
  Future<bool> authenticateWithBiometrics();
}