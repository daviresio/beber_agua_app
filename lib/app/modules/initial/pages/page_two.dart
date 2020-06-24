import 'package:beber_agua/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

class PageTwo extends StatefulWidget {
  @override
  _PageTwoState createState() => _PageTwoState();
}

class _PageTwoState extends State<PageTwo> {
  final initialController = InitialController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0, bottom: 30.0, top: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Seu sexo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('taped');
                      initialController.setSexo('M');
                    },
                    child: Column(
                      children: <Widget>[
                        (initialController.config.sexo == 'M'
                            ? SvgPicture.asset(
                                "assets/images/man_active.svg",
                                width: 100.0,
                              )
                            : SvgPicture.asset(
                                "assets/images/man_deactive.svg",
                                width: 100.0,
                              )),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Masculino',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: (initialController.config.sexo == 'M'
                                  ? Colors.blueAccent
                                  : Colors.grey)),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initialController.setSexo('F');
                    },
                    child: Column(
                      children: <Widget>[
                        (initialController.config.sexo == 'F'
                            ? SvgPicture.asset(
                                "assets/images/woman_active.svg",
                                width: 100.0,
                              )
                            : SvgPicture.asset(
                                "assets/images/woman_deactive.svg",
                                width: 100.0,
                              )),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'Feminino',
                          style: TextStyle(
                              fontSize: 18.0,
                              color: (initialController.config.sexo == 'F'
                                  ? Colors.pinkAccent
                                  : Colors.grey)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}
