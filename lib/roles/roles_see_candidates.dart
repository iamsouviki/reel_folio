import 'package:flutter/material.dart';

class SeeCandidatesPage extends StatelessWidget {
  const SeeCandidatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Center(
          child: Text('See Candidates'),
        ),
      ),
    );
  }
}
