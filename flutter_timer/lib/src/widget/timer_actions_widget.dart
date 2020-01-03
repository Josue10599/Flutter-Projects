import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/src/bloc/bloc.dart';

class TimerActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _mapStateToActionButtons(
        timerBloc: BlocProvider.of<TimerBloc>(context),
      ),
    );
  }

  List<Widget> _mapStateToActionButtons({TimerBloc timerBloc}) {
    final TimerState currentState = timerBloc.state;
    if (currentState is Ready) {
      return [_startTimer(timerBloc, currentState)];
    }
    if (currentState is Running) {
      return [_pauseTimer(timerBloc), _resetTimer(timerBloc)];
    }
    if (currentState is Paused) {
      return [_resumeTimer(timerBloc), _resetTimer(timerBloc)];
    }
    if (currentState is Finished) {
      return [_resetTimer(timerBloc)];
    }
    return [];
  }

  FloatingActionButton _startTimer(TimerBloc timerBloc, Ready currentState) {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () => timerBloc.add(Start(duration: currentState.duration)),
    );
  }

  FloatingActionButton _resumeTimer(TimerBloc timerBloc) {
    return FloatingActionButton(
      child: Icon(Icons.play_arrow),
      onPressed: () => timerBloc.add(Resume()),
    );
  }

  FloatingActionButton _pauseTimer(TimerBloc timerBloc) {
    return FloatingActionButton(
      child: Icon(Icons.pause),
      onPressed: () => timerBloc.add(Pause()),
    );
  }

  FloatingActionButton _resetTimer(TimerBloc timerBloc) {
    return FloatingActionButton(
      child: Icon(Icons.replay),
      onPressed: () => timerBloc.add(Reset()),
    );
  }
}
