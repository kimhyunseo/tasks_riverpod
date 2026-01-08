import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tasks/ui/pages/write_todo/write_todo_view_model.dart';

// 4. Todo를 추가하는 화면 만들기
class PlusTodo extends ConsumerStatefulWidget {
  const PlusTodo({super.key});
  @override
  ConsumerState<PlusTodo> createState() => _PlusTodoState();
}

class _PlusTodoState extends ConsumerState<PlusTodo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool isFavorite = false;
  bool isDescription = false;
  bool isTitleEmpty = true;

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    titleController.addListener(() {
      setState(() {
        isTitleEmpty = titleController.text.trim().isEmpty;
      });
    });
  }

  // 할 일 추가할 때 사용자 값이 비어있으면 동작하지 않게 구현
  void saveToDo() async {
    final value = titleController.text;
    final descriptionValue = descriptionController.text;

    if (isTitleEmpty) {
      titleFocusNode.requestFocus();
      return;
    }

    final viewModel = ref.read(writeTodoViewModel(null).notifier);
    await viewModel.addToDo(id: DateTime.now().toIso8601String(), title: value);

    Navigator.pop(context);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    titleFocusNode.dispose();
    descriptionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 12,
        bottom: MediaQuery.of(context).viewInsets.bottom + 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            focusNode: titleFocusNode,
            // 4-1. 자동으로 키보드가 뜨도록 구현 (autofocus)
            autofocus: true,
            // 4-1. title용 textfiled에서 줄바꿈 대신 저장이 되도록 구현, 비어있을 때는 구현 x
            textInputAction: TextInputAction.done,
            onSubmitted: (_) {
              saveToDo();
            },
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 20),
              hintText: "새 할 일",
              hintStyle: TextStyle(fontSize: 14),
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 16),
          ),

          if (isDescription)
            TextField(
              controller: descriptionController,
              focusNode: descriptionFocusNode,
              // 4-3 줄바꿈이 일어나게 구현
              textInputAction: TextInputAction.newline,
              minLines: 1,
              maxLines: 10,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                hintText: "세부정보 추가",
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none,
              ),
              style: TextStyle(fontSize: 14),
            ),

          Row(
            children: [
              // 4-2. bool 값을 이용하여 아이콘 상태 표시
              // ㄴ 설명 icon 눌렀을 때 description textfield 보이게 하고 표시시 icon 숨기기
              if (isDescription == false)
                IconButton(
                  onPressed: () {
                    setState(() {
                      isDescription = true;
                      descriptionFocusNode.requestFocus();
                    });
                  },
                  icon: Icon(Icons.short_text_rounded, size: 24),
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: isFavorite
                    ? Icon(Icons.star_rounded, size: 24)
                    : Icon(Icons.star_border_rounded, size: 24),
              ),
              Spacer(),
              TextButton(
                // 4-2. 저장 버튼 요소가 있을 때만 활성화 (색상 차이 구현)
                onPressed: isTitleEmpty ? null : saveToDo,
                child: Text("저장"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
