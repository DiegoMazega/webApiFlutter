import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


///Create a function of navigate to use for all projetct.
/// The type [T] is to confirm that the route will receive a widget.
///  Don't pass a not screen widget, or will crash the routine.
/// And the type [R] is the response fom navigate, if has a one.
/// To not have a response you can pass [Void] to param [R]
Future<R?> navigateTo<T extends Widget, R extends Object>(
      {required BuildContext context, required T widget}) async {
    return Navigator.of(context).push<R>(MaterialPageRoute(builder: (context) => widget));
  }