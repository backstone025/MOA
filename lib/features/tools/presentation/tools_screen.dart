import 'package:flutter/material.dart';

/// 도구 화면 (Tools Feature)
class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final tools = [
      {
        'title': '정산 & N빵 계산기',
        'subtitle': '함께한 여행 경비를 손쉽게 나누어 정산하세요.',
        'icon': Icons.calculate_outlined,
        'color': colorScheme.primary,
      },
      {
        'title': '실시간 환율 변환기',
        'subtitle': '해외 여행 시 각국 통화를 빠르게 계산합니다.',
        'icon': Icons.currency_exchange_rounded,
        'color': colorScheme.secondary,
      },
      {
        'title': '준비물 체크리스트',
        'subtitle': '놓치기 쉬운 여행 준비물을 팀원과 공유하세요.',
        'icon': Icons.checklist_rounded,
        'color': colorScheme.tertiary,
      },
      {
        'title': '오프라인 지도 및 메모',
        'subtitle': '네트워크 없이도 일정과 주요 위치를 확인하세요.',
        'icon': Icons.map_outlined,
        'color': colorScheme.primary,
      },
    ];

    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: tools.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final tool = tools[index];
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: CircleAvatar(
                radius: 24,
                backgroundColor: (tool['color'] as Color).withValues(alpha: 0.15),
                child: Icon(
                  tool['icon'] as IconData,
                  color: tool['color'] as Color,
                ),
              ),
              title: Text(
                tool['title'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  tool['subtitle'] as String,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
              trailing: const Icon(Icons.chevron_right_rounded),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${tool['title']} 기능 준비 중입니다.')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
