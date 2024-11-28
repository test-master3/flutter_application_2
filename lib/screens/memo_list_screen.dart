import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Memo App',
      theme: ThemeData.dark(),
      home: MemoListScreen(),
    );
  }
}

class MemoListScreen extends StatefulWidget {
  @override
  _MemoListScreenState createState() => _MemoListScreenState();
}

class _MemoListScreenState extends State<MemoListScreen> {
  // テストデータ
  final List<Map<String, String>> testData = [
    {"title": "First Memo", "date": "2024-11-28"},
    {"title": "Second Memo", "date": "2024-11-27"},
    {"title": "Shopping List", "date": "2024-11-26"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Memos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // 検索バー
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search memos...",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          // メモリスト
          Expanded(
            child: testData.isEmpty
                ? Center(
                    child: Text(
                      "No memos yet. Create your first one!",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: testData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(testData[index]['title']!),
                        subtitle: Text(testData[index]['date']!),
                        onTap: () {
                          // 詳細ページへの遷移（後で実装）
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      // 新規作成ボタン
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 新規作成画面への遷移（後で実装）
        },
        child: Icon(Icons.add),
      ),
    );
  }
}