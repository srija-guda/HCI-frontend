import 'package:flutter/material.dart';

class Job {
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String price;
  final String task;

  Job({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.price,
    required this.task,
  });
}
