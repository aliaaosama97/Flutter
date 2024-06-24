import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:taskawi_flutter/presentation/providers/TasksProvider.dart';
import 'package:taskawi_flutter/presentation/screens/login/Login.dart';
import 'package:taskawi_flutter/presentation/screens/home/tasks/DefaultPage.dart';
import 'package:taskawi_flutter/presentation/screens/SelectedTask/SelectedTask.dart';
import 'package:taskawi_flutter/presentation/screens/AddNewTask/AddNewTask.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskawi_flutter/core/Theme.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(ChangeNotifierProvider(
    create: (context)=> tasksProvider(),
      child: const MyApp()));

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          theme: lightTheme,
          themeMode: ThemeMode.system,
          darkTheme: darkTheme,
          /*home: BlocProvider(
            create: (_) => CounterCubit(),
            child: CounterPage(),
          ),*/
          routes: {
            '/':(context) => Login(),
            '/home':(context) => TasksDefaultPage(),
            '/task':(context) => SelectedTask(),
            '/newtask':(context) => AddNewTask(),
          },
        );
      },
    );

  }
}


