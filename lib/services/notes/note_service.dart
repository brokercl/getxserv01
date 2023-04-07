import 'package:get/get.dart';
import 'package:gtxserv01/utils.dart';
import 'package:isar/isar.dart';

class NoteService extends GetxController {
  late Future<Isar> db;
  NoteService() {
    db = openDB();
  }
}
