import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 메인 스캐폴드 및 하단 바텀 네비게이션 레이아웃
/// go_router의 StatefulShellRoute와 연동하여 탭 전환 시 화면 상태를 유지합니다.
class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({
    super.key,
    required this.navigationShell,
  });

  void _onTapBranch(int index) {
    navigationShell.goBranch(
      index,
      // 이미 선택된 탭을 다시 누른 경우 첫 화면으로 리셋
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final currentIndex = navigationShell.currentIndex;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.map_rounded,
                color: colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text('MOA'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded),
            tooltip: '알림',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('새로운 알림이 없습니다.')),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      // 탭 화면 바디
      body: navigationShell,

      // 하단 중앙 '+' FloatingActionButton 배치
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/travel-plan/create'),
        tooltip: '새 여행계획 만들기',
        elevation: 4,
        child: const Icon(
          Icons.add_rounded,
          size: 32,
        ),
      ),

      // 하단 노치가 있는 바텀 네비게이션 바
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // 1. 홈 탭 (Index 0)
              _buildNavItem(
                context: context,
                index: 0,
                currentIndex: currentIndex,
                icon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: '홈',
              ),
              // 2. 도구 탭 (Index 1)
              _buildNavItem(
                context: context,
                index: 1,
                currentIndex: currentIndex,
                icon: Icons.grid_view_outlined,
                activeIcon: Icons.grid_view_rounded,
                label: '도구',
              ),

              // 정중앙 FAB를 위한 빈 공간
              const SizedBox(width: 48),

              // 3. 설정 탭 (Index 2)
              _buildNavItem(
                context: context,
                index: 2,
                currentIndex: currentIndex,
                icon: Icons.settings_outlined,
                activeIcon: Icons.settings_rounded,
                label: '설정',
              ),
              // 4. 프로필 탭 (Index 3)
              _buildNavItem(
                context: context,
                index: 3,
                currentIndex: currentIndex,
                icon: Icons.person_outline_rounded,
                activeIcon: Icons.person_rounded,
                label: '프로필',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required int index,
    required int currentIndex,
    required IconData icon,
    required IconData activeIcon,
    required String label,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isSelected = index == currentIndex;

    final color = isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: () => _onTapBranch(index),
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: color,
              size: 24,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: color,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
