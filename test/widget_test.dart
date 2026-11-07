// MOA 기본 위젯 테스트

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:moa/main.dart';

void main() {
  testWidgets('MoaApp 렌더링 테스트', (WidgetTester tester) async {
    // MoaApp을 ProviderScope로 감싸서 빌드합니다.
    await tester.pumpWidget(
      const ProviderScope(
        child: MoaApp(),
      ),
    );

    // MOA 텍스트 타이틀이 표시되는지 확인합니다.
    expect(find.text('MOA'), findsOneWidget);
  });
}
