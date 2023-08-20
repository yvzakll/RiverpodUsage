import 'package:deneme/all_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: StateNotifierKullanimi()));
}

class StateNotifierKullanimi extends StatelessWidget {
  const StateNotifierKullanimi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Consumer(
        builder: (context, ref, child) {
          var title = ref.watch(titleProvider2);
          return Text(title);
        },
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            MyText(),
            MyCounterText(),
            CiftMiWidget(),
          ],
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        //ref.read(sayacNotifierProvider) bize SayacModeli verir
        //arttirma ve azaltma metodları sayacManager içinde olduğu için bu sınıfa erişmek için .notifier kullanılır
        ref.read(sayacNotifierProvider.notifier).arttir();
      },
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }
}

class MyCounterText extends ConsumerWidget {
  const MyCounterText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sayac = ref.watch(sayacNotifierProvider);
    return Text(
      sayac.sayacDegeri.toString(),
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}

class MyText extends ConsumerWidget {
  const MyText({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var text = ref.watch(textProvider);
    return Text(
      text,
    );
  }
}

class CiftMiWidget extends ConsumerWidget {
  const CiftMiWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("ÇİFTMİ TETİKLENDİ");
    var ciftMi = ref.watch(tekCiftProvider);
    return Text(ciftMi ? 'Çift' : "TEK");
  }
}
