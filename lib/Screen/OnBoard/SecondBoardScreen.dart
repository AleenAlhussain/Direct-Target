import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/AllSettingController.dart';
import '../../Service/SettingsServices.dart';

class OnBoard2 extends StatelessWidget {
  OnBoard2({super.key});
  final AllSettingController _controller = Get.put(AllSettingController(SettingsServices()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SizedBox.expand(
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: _controller.secondImageUrl.value.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: _controller.secondImageUrl.value,
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Image.asset(
                  'Assets/images/02-D.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
                  : Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        );
      }),
    );
  }
}
