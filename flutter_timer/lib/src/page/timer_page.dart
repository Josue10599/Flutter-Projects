import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/src/bloc/bloc.dart';
import 'package:flutter_timer/src/widget/timer_actions_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class TimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 100.0),
                child: Center(
                  child: BlocBuilder<TimerBloc, TimerState>(
                    builder: (context, state) {
                      return _calculaTempo(state);
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerBloc, TimerState>(
                condition: (previousState, state) => state.runtimeType != previousState.runtimeType,
                builder: (context, state) => TimerActions(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _calculaTempo(TimerState state) {
    final String minuteStr = ((state.duration / 60) % 60).floor().toString().padLeft(2, '0');
    final String secondsStr = (state.duration % 60).floor().toString().padLeft(2, '0');
    return Stack(
      children: [
        Text(
          '$minuteStr:$secondsStr',
          style: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _background() {
    return WaveWidget(
      config: CustomConfig(
        gradients: [
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(184, 189, 245, 0.7)
          ],
          [
            Color.fromRGBO(72, 74, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(172, 182, 219, 0.7)
          ],
          [
            Color.fromRGBO(72, 73, 126, 1),
            Color.fromRGBO(125, 170, 206, 1),
            Color.fromRGBO(190, 238, 246, 0.7)
          ],
        ],
        durations: [19440, 10800, 6000],
        heightPercentages: [0.03, 0.01, 0.02],
        gradientBegin: Alignment.bottomCenter,
        gradientEnd: Alignment.topCenter,
      ),
      size: Size(double.infinity, double.infinity),
      waveAmplitude: 25,
    );
  }
}
