import 'package:get_it/get_it.dart';
import 'package:vocado/core/di/configure_dependencies.config.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/features/auth/di/auth_di.dart';

  final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', 
  preferRelativeImports: true,
  asExtension: true, 
  generateForDir: ['lib/core'],
)

Future<void> configureDependencies() async {
  getIt.init();
  configureAuth(getIt);
}
