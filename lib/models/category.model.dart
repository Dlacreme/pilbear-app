// ignore_for_file: non_constant_identifier_names
class CategoryModel {
  String id;
  String label;
  bool is_disabled;

  CategoryModel(data) {
    this.id = data['id'];
    this.label = data['label'];
    this.is_disabled = data['is_disabled'];
  }
}
