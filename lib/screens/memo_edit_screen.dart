import 'package:flutter/material.dart';

class MemoEditScreen extends StatefulWidget {
  final String? title;
  final String? content;

  const MemoEditScreen({Key? key, this.title, this.content}) : super(key: key);

  @override
  _MemoEditScreenState createState() => _MemoEditScreenState();
}

class _MemoEditScreenState extends State<MemoEditScreen> {
  // コントローラ（タイトルと内容の入力管理）
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // 初期値を設定（編集時に既存データを反映）
    if (widget.title != null) {
      _titleController.text = widget.title!;
    }
    if (widget.content != null) {
      _contentController.text = widget.content!;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _saveMemo() {
    // 保存処理（仮実装）
    final newTitle = _titleController.text;
    final newContent = _contentController.text;

    // テスト用の保存ロジック（データベース未使用）
    print("Memo Saved:");
    print("Title: $newTitle");
    print("Content: $newContent");

    // メモ一覧画面に戻る
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Memo"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // タイトル入力フィールド
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // 内容入力フィールド
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  labelText: "Content",
                  border: OutlineInputBorder(),
                ),
                maxLines: null,
                expands: true,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ],
        ),
      ),
      // 保存ボタン
      floatingActionButton: FloatingActionButton(
        onPressed: _saveMemo,
        child: Icon(Icons.save),
      ),
    );
  }
}