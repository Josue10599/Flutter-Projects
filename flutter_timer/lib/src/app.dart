import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/src/bloc/timer/timer_bloc.dart';
import 'package:flutter_timer/src/page/timer_page.dart';

import 'model/ticker_model.dart';

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      home: BlocProvider(
        builder: (context) => TimerBloc(ticker: Ticker()),
        child: TimerPage(),
      ),
    );
  }
}
