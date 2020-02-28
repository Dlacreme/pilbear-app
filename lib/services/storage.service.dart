
class StorageService {
  Future<bool> save() async {
    await Future.delayed(Duration(seconds: 2));
    return true;
  }
}