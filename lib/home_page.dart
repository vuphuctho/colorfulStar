import 'package:colorful_star/starModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StarModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Home page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Icon(Icons.star,
                  color: model.starColor,
                  size: 80.0,
                ),
                Text(model.text,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ]
            )
          )
        );
      }
    );
  }
  
}