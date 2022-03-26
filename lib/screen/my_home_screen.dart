import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../actions.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("How to use Redux")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StoreConnector<int, String>(
              converter: (store) => store.state.toString(),
              builder: (context, count) {
                return Text(
                  count,
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ReducerAction.Increment);
                  },
                  builder: (context, callback) {
                    return TextButton(
                      onPressed: callback,
                      child: const Icon(Icons.add),
                    );
                  },
                ),
                StoreConnector<int, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ReducerAction.Decrement);
                  },
                  builder: (context, callback) {
                    return TextButton(
                      onPressed: callback,
                      child: const Icon(Icons.remove),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
