import './_model.dart';

class EventModel extends Model {

  Future save() async {
    await storageService.save();
  }

}