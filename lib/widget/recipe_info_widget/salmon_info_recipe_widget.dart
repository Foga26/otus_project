import 'package:flutter/material.dart';

class SalmonInfoRecipeWidget extends StatelessWidget {
  const SalmonInfoRecipeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('Рецепт'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [Text('data')],
        ),
      ),
    );
  }
}
