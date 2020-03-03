import './_model.dart';

// ignore_for_file: non_constant_identifier_names
class EventModel extends Model {
  Future save() async {
    await storageService.save();
  }
}
