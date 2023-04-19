import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_countup/data/count_data.dart';

final titleProvider = Provider<String>((ref) => 'niko~~~~');

final messageProvider = Provider<String>((ref) => 'oduto-yoi');

final countProvider = StateProvider<int>((ref) => 0);
final CountDataProvider = StateProvider<CountData>((ref) => CountData(
      count: 0,
      countUp: 0,
      countDown: 0,
    ));
