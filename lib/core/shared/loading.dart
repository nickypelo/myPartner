import 'package:flutter/material.dart';

// 3rd party
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple[100],
      child: const Center(
        child: SpinKitWaveSpinner(
          color: Colors.deepPurple,
          size: 80.0,
        ),
      ),
    );
  }
}
