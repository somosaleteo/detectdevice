import 'package:detectdevice/models/device_model.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import 'device_info_service.dart';

class FlutterDeviceTypeService extends DeviceInfoService {
  @override
  DeviceModel getInfo() {
    final device = Device.get();
    final deviceInfo = {
      'property1': 'value1',
      'property2': 'value2',
    };
    final deviceModel = DeviceModel(
      deviceInfo: deviceInfo,
      nameOs: device.isAndroid ? 'Android' : 'No android',
      deviceSerial: '123456789',
    );
    return deviceModel;
  }

  @override
  bool getIsModified() {
    return getInfo().copyWith(isModified: true).isModified;
  }
}
