
import 'package:pilbear_app/services/api.dart';

import '../main.dart';
import '../services/storage.service.dart';

abstract class Model {
  StorageService storageService = getIt<StorageService>();
  PilbearApi api = getIt<PilbearApi>();
}
