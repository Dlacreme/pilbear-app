import 'package:pilbear_app/main.dart';
import 'package:pilbear_app/models/category.model.dart';
import 'package:pilbear_app/services/api.dart';

class CategoryService {
  List<CategoryModel> _categories = new List();

  Future<List<CategoryModel>> list() async {
    if (_categories.length > 0) {
      return _categories;
    }
    print('lets go');
    (await getIt<PilbearApi>().categories()).body.forEach((c) {
      _categories.add(CategoryModel(c));
    });
    return _categories;
  }
}
