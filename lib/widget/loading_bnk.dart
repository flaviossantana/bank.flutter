
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading {

  static SpinKitWave wave(BuildContext context, {double size}){
    return SpinKitWave(
      color: Theme.of(context).accentColor,
      size: 50.0,
    );

}


}