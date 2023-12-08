abstract class StorageInterface {
  Future<void> saveStringList(List<String> data, String key);

  Future<List<String>?> readStringList(String key);

  Future<void> deleteData(String key);
}
