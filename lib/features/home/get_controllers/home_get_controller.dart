import 'package:get/get.dart';

class HomeGetController extends GetxController {
  //RxList to hold the list of even numbers. This observable will be used to update the ListViewBuilder in the UI
  RxList<int> listOfEvenNumbers = <int>[].obs;

  //RxBool to hold the loading state of the application. This observable will be used to show the CircularProgressIndicator in the UI
  RxBool isLoading = true.obs;
  //Note that the computation in this case is very fast, so the CircularProgressIndicator might not be visible.

  void countEvenNumbers() async {
    //Set the isLoading value to true
    isLoading.value = true;

    //Future Delayed to run the computation in a separate event loop
    Future.delayed(Duration.zero, () {
      //Loop through the numbers from 1 to 100
      for (int i = 1; i <= 100; i++) {
        //Check if the number is even
        if (i % 2 == 0) {
          //Add the even number to the list
          listOfEvenNumbers.add(i);
        }
      }
      //Set the isLoading value to false
      isLoading.value = false;
    });
  }

  //onInit method to call the countEvenNumbers method when the controller is initialized
  @override
  void onInit() {
    //Call the countEvenNumbers method
    countEvenNumbers();
    super.onInit();
  }
}
