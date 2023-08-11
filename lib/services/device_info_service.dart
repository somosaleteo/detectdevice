import '../interfaces/interfaces.dart';
import '../models/device_model.dart';

abstract class DeviceInfoService extends Service {
  DeviceModel getInfo();
  bool getIsModified();
}
