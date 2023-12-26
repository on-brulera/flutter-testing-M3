
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//activado modo oscuro
final isDarkMode = StateProvider((ref) => false);

//estado de colores inmutables
final colorListProvider = Provider((ref) => colores);

final selectedIndexProvider = StateProvider((ref) => 0);