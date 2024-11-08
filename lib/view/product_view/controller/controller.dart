import 'package:flutter_riverpod/flutter_riverpod.dart';

final quantityProviderState = StateProvider.autoDispose<int>(
  (ref) => 1,
);

