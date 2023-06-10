import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_getx_ripple_reactive_state_manage_project/my_controller.dart';

void main() =>runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});



  //if init property is not used in Getx<Type of Controller> then,
  //create instance of controller as follows
  //MyController myController = Get.put(MyController())


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(title: const Text("Reactive State Management")),
        body: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetX<MyController>(init: MyController(),builder: (controller){return Text("The Value is ${controller.count}", style: const TextStyle(fontSize: 25));}),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: (){
              //if instance of controller is created at top 
              //myController.increment()

              //if instance of controller is not created at top and created in GetX(), it is available only in builder
              Get.find<MyController>().increment();

            }, child: const Text("Increment"))

          ],
        ))
      )
    );
  }
}
