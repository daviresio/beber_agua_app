import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 50,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ola,', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
              SizedBox(height: 15.0,),
              Text('Sou seu companheiro de hidratacao pessoal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),),
              SizedBox(height: 15.0,),
              Text('Para fornecer consultoria personalizada sobre hidratacao, preciso de alguns dados basicos. E nao se preoculpe, vou manter isso em segredo!',
              style: TextStyle(color: Colors.black38),)
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
