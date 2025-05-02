import 'package:assignment/ui/controllers/login_controller.dart';
import 'package:assignment/ui/controllers/new_task_controller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(NewTaskController());
  }
}