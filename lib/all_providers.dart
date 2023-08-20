import 'package:deneme/model/sayac_model.dart';
import 'package:deneme/sayac_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final titleProvider = Provider<String>((ref) => "Riverpod Basics");
final titleProvider2 =
    Provider<String>((ref) => "Riverpod StateNotifier Kullanimi");
final textProvider = Provider<String>((ref) => "basılma sayısısııı ");
final sayacStateProvider = StateProvider<int>((ref) => 0);
final sayacNotifierProvider = StateNotifierProvider<SayacManager, SayacModel>(
    (ref) =>
        SayacManager()); //state de bir değişiklik olduğunda bunu bildiren provider

final tekCiftProvider = Provider<bool>((ref) {
  var sayacModel = ref.watch(sayacNotifierProvider);
  /* if (sayacModel.sayacDegeri % 2 == 0) {
    return true;
  } else {
    return false;
  } */

  return sayacModel.sayacDegeri % 2 == 0;
});
