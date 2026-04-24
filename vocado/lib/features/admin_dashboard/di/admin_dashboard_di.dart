import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'admin_dashboard_di.config.dart'; 

@InjectableInit(
  initializerName: 'initAdminDashboard',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/admin_dashboard'],
)
void configureAdminDashboard(GetIt getIt) {
  getIt.initAdminDashboard();
}
