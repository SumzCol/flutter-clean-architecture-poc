import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_poc/core/presentation/widgets/fliipa_button.dart';
import 'package:flutter_clean_architecture_poc/routes/app_router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fliipa PoC',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Container(
                child: Image.network(
                    'https://logopond.com/logos/31dacb3314cbbf3977cce6a9eeffddd3.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              FliipaButton(
                title: 'Enchulame la máquina',
                onPressed: () => showPimpMyRideDialog(context),
                icon: Icons.car_repair_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              FliipaButton(
                title: 'Random numbers',
                onPressed: () => navigateToNumberTrivia(context),
                icon: Icons.monetization_on_sharp,
              ),
              const SizedBox(
                height: 10,
              ),
              FliipaButton(
                title: 'Léase este',
                onPressed: () => navigateToBarcodeScanner(context),
                icon: Icons.qr_code,
              )
            ],
          ),
        ),
      )),
    );
  }

  Future showPimpMyRideDialog(BuildContext context) {
    return showDialog<String>(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Lo sentimos!'),
              content: const Text('Tu carro está muy peye para tunear.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context, 'Cancel'),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'OK'),
                  child: const Text('OK'),
                ),
              ],
            ));
  }

  void navigateToNumberTrivia(BuildContext context) {
    final router = AutoRouter.of(context);
    router.push(const NumberTriviaRoute());
  }

  void navigateToBarcodeScanner(BuildContext context) {
    final router = AutoRouter.of(context);
    router.push(const BarcodeScannerRoute());
  }
}
