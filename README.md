# 📝 Tasks (To-Do App)

Flutter 할 일 관리 애플리케이션입니다.
할 일 추가, 완료 체크, 즐겨찾기 설정 및 상세 보기 기능을 제공합니다.

---

## 📱 프로젝트 정보

프로젝트명: tasks
개발 환경: Flutter, Dart
주요 기능: 할 일 관리(CRUD), 상태 관리, 테마 변경(Light/Dark)

---

## 📸 실행 화면 (Screenshots)

- Empty View
<img width="300" alt="Empty View" src="https://github.com/user-attachments/assets/8d8b0035-9103-444d-8e24-576d55f5c4fb" />

- Add Task
<img width="300" alt="plustodo" src="https://github.com/user-attachments/assets/b3e1004e-0485-456c-87ad-3faacf188741" />
<img width="300"alt="plustodo2" src="https://github.com/user-attachments/assets/5dd50899-caca-428a-8a27-74014f639a6b" />

- To-Do List
<img width="300" alt="todolistview" src="https://github.com/user-attachments/assets/a9812389-8c3d-4f7f-bb87-baf1a3146c5d" />

- Detail View
<img width="300" alt="detail view" src="https://github.com/user-attachments/assets/3280ad03-d506-4cab-b488-dc5ef7f4f9bf" />

- Dark Mode
<img width="300" alt="Empty View:dark" src="https://github.com/user-attachments/assets/b6668519-ae7c-4ee9-ae30-4eb5f1ba8430" />
<img width="300" alt="todolistview:dark" src="https://github.com/user-attachments/assets/c5454ebb-caa0-4e02-a9c1-094834b24708" />
<img width="300" alt="detail view:dark" src="https://github.com/user-attachments/assets/35711add-392f-4959-88eb-46d6eb622b39" />


---

## 📂 폴더 구조 (Folder Structure)

데이터 모델(models)과 UI(pages)를 분리하여, 여러 화면에서 데이터를 쉽게 공유할 수 있도록 구조화했습니다.

```
Plaintext
lib/
├── main.dart                        # 앱 진입점
├── theme.dart                       # 테마 설정 (Light/Dark Data)
├── models/
│   └── todo_entity.dart             # todo 데이터 모델
└── pages/
    ├── home/
    │   ├── home_page.dart           # 메인 화면
    │   └── widgets/
    │       ├── empty_todo.dart      # 할 일이 없을 때 표시되는 안내 위젯
    │       ├── plus_todo.dart       # 할 일 추가 BottomSheet 위젯
    │       ├── todo_view.dart       # 할 일 리스트 전체 뷰
    │       └── todo_widget.dart     # 개별 할 일 아이템
    └── todo_detail/
        └── todo_detail_page.dart    # 할 일 상세 보기 화면
```

---

## ✨ 주요 기능

### 1️⃣ 기본 기능 (Essential)

#### 1. 프로젝트 구조 및 데이터 모델

화면 구성: 초기 화면(HomePage)과 상세 화면(ToDoDetailPage)으로 네비게이션 구조 설계

#### 2. 데이터 모델

ToDoEntity 클래스를 생성하여 title, description, isFavorite, isDone 필드로 할 일 객체를 관리

#### 3. 기본 화면 (To Do 리스트가 없는 화면) 만들기

AppBar: 사용자 이름을 포함한 타이틀('Hyunseo’s Tasks') 적용 및 디자인 커스터마이징

빈 화면 안내: 할 일이 없을 경우, 이미지와 텍스트를 Column으로 배치하여 안내 메시지 표시

추가 버튼: FloatingActionButton을 배치하여 할 일 추가 기능(addTodo)과 연결

#### 4. 할 일 추가 (Add ToDo BottomSheet)

입력 UI: showModalBottomSheet를 활용하여 제목(title) 입력 필드 구현 및 자동 포커스 처리

키보드 대응: MediaQuery.viewInsets 및 Scaffold 설정을 통해 키보드가 올라와도 UI가 가려지지 않도록 구현

설명(Description) 아이콘 클릭 시 추가 입력 필드 토글

즐겨찾기(Favorite) 아이콘으로 작성 전 상태 미리 설정 가능

저장 로직: 제목이 비어있을 경우 '저장' 버튼을 비활성화하여 빈 데이터 생성을 방지

#### 5. 할 일 목록 표시 (List View)

위젯 분리: ToDoView 위젯을 생성하여 리스트 뷰 관리

완료 처리: 버튼 클릭 시 isDone 상태를 변경하고, 텍스트에 취소선적용

상태 동기화: VoidCallback을 통해 자식 위젯의 이벤트를 부모 위젯에서 처리하여 데이터 일관성 유지

#### 6. 상세 보기 (Detail Page)

화면 이동: 리스트 아이템 클릭 시 ToDoEntity를 전달하며 상세 화면으로 전환

기능 연동:
AppBar의 leading 버튼으로 뒤로 가기 구현.
actions 영역에 즐겨찾기 버튼을 배치하여, 상세 화면에서도 상태 변경이 가능하도록 구현(메인 화면과 동기화)

### 2️⃣ 도전 기능 및 추가 구현 (Challenge & Additional Features)

#### 1. 다크 모드 & 간편 테마 전환 (Dark Mode & Easy Toggle)

기능: ThemeData를 활용하여 시스템 설정에 구애받지 않고 다크 모드와 라이트 모드를 지원

\+ UX 개선: HomePage의 AppBar에 테마 변경 버튼을 배치하여 즉시 테마를 전환할 수 있도록 접근성을 높임

#### 2. 위젯 컴포넌트화 (Componentization)

구조 개선: 반복되거나 독립적인 UI 요소를 별도의 위젯으로 분리

#### 3. 입력 검증 UX

UX 개선: 빈 값 입력 방지를 위해 SnackBar 대신 저장 버튼 비활성화(Disabled Button) 방식을 채택하여 사용자가 입력 단계에서부터 직관적으로 상태를 인지할 수 있도록 개선

#### 4. 할 일 수정 및 삭제 (Edit & Delete)

기능 확장: 단순히 할 일을 추가하고 완료하는 것을 넘어 잘못 입력된 내용을 수정하거나 더 이상 필요 없는 항목을 삭제할 수 있는 CRUD 기능을 구현

---

## 🚀 트러블 슈팅 (Trouble shooting)

개발 과정에서 발생한 주요 문제와 해결 과정입니다.

### 1. final 필드 수정 오류 (Immutable Pattern)

문제: isDone 상태를 변경하려고 todo.isDone = true로 접근했으나, final 필드라 수정 불가 오류 발생

해결: 객체를 직접 수정하는 대신, copyWith 메서드를 구현하여 변경된 값을 가진 새로운 객체로 교체하는 방식으로 해결

### 2. VoidCallback 타입 불일치 및 실행 시점

문제: onToggle: toggleDone(index)와 같이 작성하여, 함수가 렌더링 시점에 즉시 실행되고 반환값(void)이 전달되는 오류 발생

해결: () => toggleDone(index) 형태의 익명 함수로 감싸서, 클릭 시점에만 함수가 실행되도록 수정하고 파라미터도 정상적으로 전달함

### 3. 입력 검증 UX (SnackBar vs Button Disable)

문제: BottomSheet 내부에서 빈 값 경고를 위해 SnackBar를 사용하려 했으나, 키보드 가림 및 레이어 이슈로 시인성이 좋지 않음

해결: TextEditingController의 리스너를 활용하여, 입력값이 비어있을 경우 저장 버튼 자체를 비활성화(onPressed: null)하는 방식으로 변경하여 UX를 개선함
