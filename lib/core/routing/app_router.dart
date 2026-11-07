import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../../features/tools/presentation/tools_screen.dart';
import '../../features/travel_plan/presentation/create_travel_plan_screen.dart';
import '../../shared/presentation/main_scaffold.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

/// go_router 설정 및 라우터 프로바이더
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    debugLogDiagnostics: true,
    routes: [
      // 하단 네비게이션 바가 유지되는 ShellRoute (StatefulShellRoute)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScaffold(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: 홈 (Home)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: 'home',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          // Branch 1: 도구 (Tools)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/tools',
                name: 'tools',
                builder: (context, state) => const ToolsScreen(),
              ),
            ],
          ),
          // Branch 2: 설정 (Settings)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: 'settings',
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
          // Branch 3: 프로필 (Profile)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                name: 'profile',
                builder: (context, state) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // 쉘 외부(전체 화면)에서 열리는 여행 계획 생성 화면
      GoRoute(
        path: '/travel-plan/create',
        name: 'createTravelPlan',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreateTravelPlanScreen(),
      ),
    ],
  );
});
