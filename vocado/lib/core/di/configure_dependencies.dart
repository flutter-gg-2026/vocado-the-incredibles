import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
<<<<<<< HEAD
import 'package:vocado/features/add_members/di/add_members_di.dart';
import 'package:vocado/features/user_task/di/user_task_di.dart';
import 'package:vocado/features/auth/di/auth_di.dart';

  final getIt = GetIt.instance;
=======
import 'package:vocado/features/task_create/di/task_create_di.dart';
import 'package:vocado/features/admin_dashboard/di/admin_dashboard_di.dart';
>>>>>>> origin/hatem

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  getIt.init();
<<<<<<< HEAD
    configureAddMembers(getIt);
    configureUserTask(getIt);
  configureAuth(getIt);
=======
    configureTaskCreate(getIt);
    configureAdminDashboard(getIt);
>>>>>>> origin/hatem
}
