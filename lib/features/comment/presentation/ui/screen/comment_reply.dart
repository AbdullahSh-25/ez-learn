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
            child: TreeView<MyNode>(
              treeController: treeController,
              // Provide a widget builder callback to map your tree nodes into widgets.
              nodeBuilder: (BuildContext context, TreeEntry<MyNode> entry) {
                return MyTreeTile(
                  key: ValueKey(entry.node),
                  entry: entry,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Create a widget to display the data held by your tree nodes.
class MyTreeTile extends StatelessWidget {
  const MyTreeTile({
    super.key,
    required this.entry,
    required this.onTap,
  });

  final TreeEntry<MyNode> entry;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // Wrap your content in a TreeIndentation widget which will properly
      // indent your nodes (and paint guides, if required).
      //
      // If you don't want to display indent guides, you could replace this
      // TreeIndentation with a Padding widget, providing a padding of
      // `EdgeInsetsDirectional.only(start: TreeEntry.level * indentAmount)`
      child: TreeIndentation(
        entry: entry,
        // Provide an indent guide if desired. Indent guides can be used to
        // add decorations to the indentation of tree nodes.
        // This could also be provided through a DefaultTreeIndentGuide
        // inherited widget placed above the tree view.
        guide: const IndentGuide.connectingLines(indent: 40),
        // The widget to render next to the indentation. TreeIndentation
        // respects the text direction of `Directionality.maybeOf(context)`
        // and defaults to left-to-right.
        child: CommentItem(),
      ),
    );
  }
}
