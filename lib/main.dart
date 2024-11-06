import 'package:flutter/material.dart';
import 'package:crud/core/presentation/widgets/app_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: AppWidget()));
}
