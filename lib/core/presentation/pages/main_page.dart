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
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text('Fliipa', style: Theme.of(context).textTheme.headline1,),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: FliipaButton(
                      title: 'Pimp my ride',
                      onPressed: () => showPimpMyRideDialog(context),
                      icon: Icons.car_repair_rounded,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                     child: FliipaButton(
                      title: 'Random numbers',
                      onPressed: () => navigateToNumberTrivia(context),
                      icon: Icons.monetization_on_sharp,
                                 ),
                   ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: FliipaButton(
                      title: 'Barcode scanner',
                      onPressed: () => navigateToBarcodeScanner(context),
                      icon: Icons.qr_code,
                    ),
                  ),
                ],
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
