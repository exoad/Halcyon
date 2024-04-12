import 'package:flutter/material.dart';

/// macro function
void syncTask(void Function() task) =>
    WidgetsBinding.instance.addPostFrameCallback((_) => task());
