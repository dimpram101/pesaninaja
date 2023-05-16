import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pesaninaja/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  return dummyMeals;
});
