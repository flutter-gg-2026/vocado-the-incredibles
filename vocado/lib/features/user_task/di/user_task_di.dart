import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'user_task_di.config.dart'; 

@InjectableInit(
  initializerName: 'initUserTask',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/user_task'],
)
void configureUserTask(GetIt getIt) {
  getIt.initUserTask();
}
