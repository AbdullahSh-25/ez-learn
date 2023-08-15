import 'package:ez_learn/features/comment/presentation/ui/widget/comment_item.dart';
import 'package:ez_learn/features/quiz/presentation/ui/widget/coustom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fancy_tree_view/flutter_fancy_tree_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyNode {
  const MyNode({
    required this.title,
    this.children = const <MyNode>[],
  });

  final String title;
  final List<MyNode> children;
}

class MyTreeView extends StatefulWidget {
  const MyTreeView({super.key});

  @override
  State<MyTreeView> createState() => _MyTreeViewState();
}

class _MyTreeViewState extends State<MyTreeView> {
  static const List<MyNode> roots = <MyNode>[
    MyNode(
      title: 'Root 1',
      children: <MyNode>[
        MyNode(
          title: 'Node 1.1',
        ),
        MyNode(title: 'Node 1.2'),
        MyNode(title: 'Node 2.2'),
        MyNode(title: 'Node 2.2')
      ],
    ),
  ];
  late final TreeController<MyNode> treeController;

  @override
  void initState() {
    super.initState();
    treeController = TreeController<MyNode>(
      roots: roots,
      childrenProvider: (MyNode node) => node.children,
    );
    treeController.expandAll();
  }

  @override
  void dispose() {
    // Remember to dispose your tree controller to release resources.
    treeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          45.verticalSpace,
          const CustomAppBar(
            text: 'المحاضرة السابعة',
          ),
          3.verticalSpace,
          Center(
            child: Text(
              'التعليقات',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          20.verticalSpace,
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24.r,
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 0) return CommentItem();
                  return Padding(
                    padding: EdgeInsets.only(right: 15.r),
                    child: CommentItem(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Create a widget to display the data held by your tree nodes.

