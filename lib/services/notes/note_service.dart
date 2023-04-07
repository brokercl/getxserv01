import 'package:get/get.dart';
import 'package:gtxserv01/main.dart';
import 'package:isar/isar.dart';

class NoteService extends GetxController {
  late Future<Isar> db;
  NoteService() {
    db = openIsarDB();
  }
}
