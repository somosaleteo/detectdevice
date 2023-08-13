import 'package:detectdevice/interfaces/interfaces.dart';
import 'package:freerasp/freerasp.dart';

class TamperingService extends Service {
  /// Esta clase debe inicializarse una unica vez
  static final TamperingService _singleton = TamperingService._internal();
  factory TamperingService() {
    return _singleton;
  }

  TamperingService._internal() {
    init();
  }

  bool tamperingRisk = false;

  void init() async {
    // create configuration for freeRASP
    final config = TalsecConfig(
      /// For Android
      androidConfig: AndroidConfig(
        packageName: 'co.com.jocaagura.detectdevice',
        signingCertHashes: ['AKoRuyLMM91E7lX/Zqp3u4jMmd0A7hH/Iqozu0TMVd0='],
        supportedStores: ['com.sec.android.app.samsungapps'],
      ),

      /// For iOS
      iosConfig: IOSConfig(
        bundleIds: ['co.com.jocaagura.detectdevice'],
        teamId: 'M8AK35...',
      ),
      watcherMail: 'albert.jimenez@pragma.com.co',
      isProd: true,
    );
    await Talsec.instance.start(config);
    Talsec.instance.attachListener(ThreatCallback(onAppIntegrity: () {
      tamperingRisk = true;
    }));
  }

  Stream<Threat> get tamperingStream => Talsec.instance.onThreatDetected;
}
