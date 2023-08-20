import 'package:deneme/model/sayac_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SayacManager extends StateNotifier<SayacModel> {
  SayacManager() : super(SayacModel(0));

  void arttir() {
    var oankiSayacDegeri = state.sayacDegeri;
    state = SayacModel(oankiSayacDegeri + 1);
  }

  void azalt() {
    var oankiSayacDegeri = state.sayacDegeri;
    state = SayacModel(oankiSayacDegeri - 1);
  }
}
