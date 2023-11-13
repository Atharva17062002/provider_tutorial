import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/number_list_provider.dart';
import 'package:provider_tutorial/second_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Text(
                          numbersListProvider.numbers[index].toString());
                    },
                    itemCount: numbersListProvider.numbers.length,
                  ),
                ),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondScreen()));
                }, child: Text('Second'))
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
