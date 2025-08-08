import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

void showSuccess(String message) {
  Get.snackbar("Success", message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.white,
  );
}

void showDeleteConfirmation({required VoidCallback onConfirm}) {
  Get.defaultDialog(
    title: "Delete Recipe",
    middleText: "Are you sure you want to delete this recipe?",
    textConfirm: "Yes",
    textCancel: "Cancel",
    confirmTextColor: Colors.white,
    onConfirm: onConfirm,
  );
}