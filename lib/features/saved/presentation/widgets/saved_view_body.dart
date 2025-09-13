import 'package:flutter/material.dart';
import 'package:styla/core/widgets/constrained_scaffold.dart';
import 'package:styla/core/widgets/custom_appbar.dart';

class SavedViewBody extends StatelessWidget {
  const SavedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const ConstrainedScaffold(
      appBar: CustomAppbar(),
      body: Center(
        child: Text('saved items'),
      ),
    );
  }
}
