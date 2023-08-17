
import 'package:conversorapp/controllers/conversor_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../widgets/main_result.dart';

class conversorScreen extends StatelessWidget {
  final conversorCtl = Get.find<conversorController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            //SubResult(text: '${conversorCtl.firstValue}'),
            //SubResult(text: '${conversorCtl.secondValue}'),
            MainResultText(text: '${conversorCtl.result}')
          ],
        ));
  }
}
