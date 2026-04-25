import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/task_create/di/task_create_di.dart';
import 'package:vocado/features/admin_dashboard/di/admin_dashboard_di.dart';
import 'package:vocado/features/profile/di/profile_di.dart';
import 'package:vocado/features/auth/di/auth_di.dart';
import 'package:vocado/features/add_members/di/add_members_di.dart';
import 'package:vocado/features/user_task/di/user_task_di.dart';


  final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  getIt.init();
    configureTaskCreate(getIt);
    configureAuth(getIt);
    configureAddMembers(getIt);
    configureUserTask(getIt);
    configureAdminDashboard(getIt);
    configureProfile(getIt);
}
