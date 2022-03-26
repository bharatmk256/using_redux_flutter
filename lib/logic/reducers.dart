import '../actions.dart';

int counterReducer(int state, dynamic action) {
  if (action == ReducerAction.Increment) {
    state = state + 1;
  } else if (action == ReducerAction.Decrement) {
    state = state - 1;
  }
  return state;
}
