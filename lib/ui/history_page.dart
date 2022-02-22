import 'package:flutter/material.dart';
import 'package:ibilling/widgets/app_bar.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar1(
          title: 'History',
        ),
      ),
    );
  }
}
