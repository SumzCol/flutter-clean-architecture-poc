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
                    'https://1000marcas.net/wp-content/uploads/2019/12/Star-Wars-Logo-5.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              FliipaButton(
                title: 'Enchulame la máquina',
                onPressed: () {},
                icon: Icons.car_repair_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              FliipaButton(
                title: 'Random numbers',
                onPressed: () => navigateToNumberTrivia(context),
                icon: Icons.monetization_on_sharp,
              )
            ],
          ),
        ),
      )),
    );
  }

  void navigateToNumberTrivia(BuildContext context) {
    final router = AutoRouter.of(context);
    router.push(const NumberTriviaRoute());
  }
}
