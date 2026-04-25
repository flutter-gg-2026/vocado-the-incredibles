import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/add_members/di/add_members_di.dart';
import 'package:vocado/features/user_task/di/user_task_di.dart';

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  final getIt = GetIt.instance;
  getIt.init();
    configureAddMembers(getIt);
    configureUserTask(getIt);
}
