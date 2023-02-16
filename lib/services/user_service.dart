import 'package:get/get.dart';
import 'package:gtxserv01/models/user.dart';
import 'package:isar/isar.dart';

class UserService extends GetxController with StateMixin<RxList<User>> {
  late Future<Isar> db;

  RxList<User>? users = <User>[].obs;

  UserService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [UserSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  printUsers() {
    for (var i = 0; i < users!.length; i++) {
      print('users[$i].id => ${users![i].id}');
      print('users[$i].name => ${users![i].name}');
    }
  }

  Future<RxList<User>> getUsers() async {
    final isar = await db;
    users!.value = await isar.users.where().findAll();
    if (users!.isNotEmpty) change(users, status: RxStatus.success());
    change(users, status: RxStatus.empty());

    printUsers();

    return users!;
  }

  createUser(String name, int age) async {
    final isar = await db;

    final newUser = User()
      ..name = name
      ..age = age;

    try {
      isar.writeTxnSync<int>(() => isar.users.putSync(newUser));
    } catch (e) {
      print(e.toString());
    }

// este metodo  asegura que el id del user
// sea el mismo que el index de la lista users
// el problema es cuando el 1er user tiene
// por ejemplo el id 1042, esto implicaria
// crear 1041 user VACIOS antes de poder
// insertar el user 1042
// lo que es inviable
// ni hablar si el id del user sea 1.000.000 o inlcuso mucho mas..
    // users![newUser.id!].id = newUser.id;
    // users![newUser.id!].name = newUser.name;
    // users![newUser.id!].age = newUser.age;

    users!.add(newUser);
  }

  Future deleteUser(int id) async {
    final isar = await db;

    try {
      isar.writeTxnSync(() => isar.users.deleteSync(id));
    } catch (e) {
      print(e.toString());
    }

    users!.removeWhere((user) => user.id == id);
    printUsers();
  }

  updateUser(User updateUser) async {
    final isar = await db;

    // if I set the id => the register will be updated
    // if not, the register will be created..

    await isar.writeTxn(() async {
      await isar.users.put(updateUser);
    });

// indexWhere is used to find the index of a user with a specific id

    users![users!.indexWhere((user) => user.id == updateUser.id)] = updateUser;

    printUsers();
  }

  findUser(String username) {
    // TODO: implement findUser
    throw UnimplementedError();
  }

  @override
  void onInit() {
    getUsers().then((users) => change(users, status: RxStatus.success()),
        onError: (e) => change(null, status: RxStatus.error(e.toString())));
    change(null, status: RxStatus.loading());
    super.onInit();
  }
}
