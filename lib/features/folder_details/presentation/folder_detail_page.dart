import 'package:aicycle_buyme_lib/features/common/c_loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/folder_detail_controller.dart';

class FolderDetailPage extends StatefulWidget {
  const FolderDetailPage({super.key});

  @override
  State<FolderDetailPage> createState() => _FolderDetailPageState();
}

class _FolderDetailPageState extends State<FolderDetailPage> {
  late final FolderDetailController controller;
  @override
  void initState() {
    super.initState();
    if (Get.isRegistered<FolderDetailController>()) {
      controller = Get.find<FolderDetailController>();
    } else {
      controller = Get.put(FolderDetailController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingView<FolderDetailController>(
        child: Container(),
      ),
    );
  }
}
