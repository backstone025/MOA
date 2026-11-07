import 'package:flutter/material.dart';

/// MOA 애플리케이션 전역 색상 상수 정의
/// 하드코딩된 색상 값을 방지하고, 테마 확장(라이트/다크 모드 등)을 용이하게 합니다.
abstract class AppColors {
  // --- 메인 브랜드 색상 (Soft Pastel Green) ---
  static const Color primary = Color(0xFF6EAA85); // 부드러운 파스텔 초록 메인
  static const Color primaryLight = Color(0xFF98CFAC);
  static const Color primaryDark = Color(0xFF497C5D);
  static const Color primaryContainer = Color(0xFFE2F3E9); // 파스텔 그린 컨테이너
  static const Color onPrimaryContainer = Color(0xFF1E482F);

  // --- 세컨더리 및 억센트 색상 ---
  static const Color secondary = Color(0xFF729B93);
  static const Color secondaryContainer = Color(0xFFE5F0ED);
  static const Color onSecondaryContainer = Color(0xFF1D3530);

  // --- 배경 및 표면 색상 (Light Mode) ---
  static const Color lightBackground = Color(0xFFF8FAF8);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF0F4F1);
  static const Color lightOnBackground = Color(0xFF191C19);
  static const Color lightOnSurface = Color(0xFF191C19);
  static const Color lightOnSurfaceVariant = Color(0xFF414943);

  // --- 배경 및 표면 색상 (Dark Mode) ---
  static const Color darkBackground = Color(0xFF121413);
  static const Color darkSurface = Color(0xFF1A1C1B);
  static const Color darkSurfaceVariant = Color(0xFF262B28);
  static const Color darkOnBackground = Color(0xFFE2E3E0);
  static const Color darkOnSurface = Color(0xFFE2E3E0);
  static const Color darkOnSurfaceVariant = Color(0xFFC1C8C2);

  // --- 상태 및 중립 색상 ---
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color outline = Color(0xFF717973);
  static const Color outlineVariant = Color(0xFFC1C8C2);
  static const Color shadow = Color(0xFF000000);
}
