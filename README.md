# MOA (모아)
> **사용자 이동시간 기반 집결지 추천 및 공동 일정 관리 애플리케이션**  
> 인천대학교 정보통신공학과 모바일 프로그래밍 프로젝트 (D-Bugs)

---

## 1. Project Overview

**MOA(모아)**는 약속 장소를 정할 때 발생하는 **이동 시간의 불균형**과 **계획 조정의 번거로움**을 해결하기 위해 개발된 서비스입니다.  
참여자의 출발 위치와 이동 수단별 시간을 종합적으로 계산하여 **최적의 공평한 중간 집결지를 추천**하고, 집결 이후의 일정을 **실시간으로 공동 작성 및 관리**할 수 있는 모바일 통합 플랫폼입니다.

---

## 2. Team D-Bugs
| 이름 | 맡은 파트 |
| :--- | :--- |
| 강지석 | 팀장 & 앱 개발 |
| 배경석 | 백엔드 |
| 이연우 | 앱 개발(내부 로직 담당) |

## 3. Key Features

- **이동시간 고려 중간지점 추천**:
  - 사용자별 출발 위치(GPS) 및 이동시간을 분석하여 구성원 간 이동 부담을 균등하게 다듬는 추천 알고리즘 적용
  - 추천된 중간 집결지 주변 매장/장소 필터링 제공
- **Drag & Drop 기반 공동 일정 관리**:
  - 직관적인 타임라인 UI를 통해 여러 사용자가 동시에 일정 및 순서를 편집
  - WebSocket 프로토콜 기반 실시간 일정 동기화
- **로컬 캐싱 & 오프라인 지원**:
  - Flutter 앱 내 SQLite 기반 Cache 및 Eviction 정책을 적용하여 네트워크 불안정/오프라인 환경에서도 무결성과 빠르게 접근 가능한 성능 보장

---

## 4. Tech Stack & Architecture

### 4-1. Tech Stack
| Domain | Technologies |
|---|---|
| **Mobile App (Frontend)** | Flutter (Dart), SQLite Cache, Drag & Drop Widgets, GPS Module |
| **Backend Server** | Java 17, Spring Boot 3.x, Spring Data JPA, MySQL, WebSocket |
| **Infrastructure** | AWS Cloud Distributed Server, Push Notification Engine |

### 4-2. System Architecture
```
[ Client (Flutter App) ] ─── (REST API / WebSocket) ───> [ Spring Boot Server ] ───> [ MySQL DB ]
│                                                         │
[ SQLite Cache ]                                      [ Ext. Map / Transit APIs ]
```

### 4-3. Objective Function for Meeting Point
그룹 구성원 $n$명에 대해 최대 이동시간 부담을 최소화하도록 설계된 목적 함수입니다[cite: 16].
$$Cost(P) = \alpha \cdot T_{avg}(P) + \beta \cdot \max_{1 \le i \le n} T_i(P)$$
[cite: 16]

---
