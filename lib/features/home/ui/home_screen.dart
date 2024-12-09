import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../get_controllers/home_get_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  //Initialize the getController
  final HomeGetController getController = Get.put(HomeGetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('List of Even Numbers till 100'),
      ),
      body: Obx(() {
        return getController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: getController.listOfEvenNumbers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text((index + 1).toString()),
                    title: Text(
                        getController.listOfEvenNumbers[index].toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  );
                },
              );
      }),
    );
  }
}
