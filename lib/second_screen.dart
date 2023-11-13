import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'number_list_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumbersListProvider>(
      builder: ((context, numbersListProvider, child) => Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(
              numbersListProvider.numbers.last.toString(),
            ),
            Container(
              height: 200,
              width: double.maxFinite,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                      numbersListProvider.numbers[index].toString());
                },
                itemCount: numbersListProvider.numbers.length,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            numbersListProvider.add();
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      )),
    );
  }
}
