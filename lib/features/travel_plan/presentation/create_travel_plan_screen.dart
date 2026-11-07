import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// 여행 계획 생성 화면 (Travel Plan Feature)
class CreateTravelPlanScreen extends StatefulWidget {
  const CreateTravelPlanScreen({super.key});

  @override
  State<CreateTravelPlanScreen> createState() => _CreateTravelPlanScreenState();
}

class _CreateTravelPlanScreenState extends State<CreateTravelPlanScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _destinationController = TextEditingController();
  DateTimeRange? _selectedDateRange;

  @override
  void dispose() {
    _titleController.dispose();
    _destinationController.dispose();
    super.dispose();
  }

  Future<void> _selectDateRange() async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
      initialDateRange: _selectedDateRange ??
          DateTimeRange(start: now, end: now.add(const Duration(days: 3))),
    );
    if (picked != null) {
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('새 여행 계획이 성공적으로 생성되었습니다!')),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('새 여행계획 만들기'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '여행 기본 정보',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(height: 16),

              // 여행 제목 입력
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: '여행 제목',
                  hintText: '예: 2025 제주도 우정 여행',
                  prefixIcon: const Icon(Icons.flight_land_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '여행 제목을 입력해 주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 여행 목적지 입력
              TextFormField(
                controller: _destinationController,
                decoration: InputDecoration(
                  labelText: '목적지',
                  hintText: '예: 제주특별자치도, 도쿄, 파리',
                  prefixIcon: const Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return '목적지를 입력해 주세요.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // 여행 기간 선택 버튼
              InkWell(
                onTap: _selectDateRange,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border.all(color: colorScheme.outline),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today_rounded, color: colorScheme.primary),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '여행 일정 선택',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              _selectedDateRange == null
                                  ? '날짜를 선택하세요'
                                  : '${_selectedDateRange!.start.toString().substring(0, 10)} ~ ${_selectedDateRange!.end.toString().substring(0, 10)}',
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down_rounded),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // 생성 버튼
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: _submit,
                  child: const Text('여행 계획 생성하기'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
