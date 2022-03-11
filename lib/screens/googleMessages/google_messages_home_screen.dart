import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GoogleMessagesHomeScreen extends StatefulWidget {
  const GoogleMessagesHomeScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMessagesHomeScreen> createState() =>
      _GoogleMessagesHomeScreenState();
}

class _GoogleMessagesHomeScreenState extends State<GoogleMessagesHomeScreen> {
  bool _isFABExpanded = true;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        floatingActionButton: MyFAB(
          isExpanded: _isFABExpanded,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Icon(CupertinoIcons.search),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Text(
                        "Search conversations",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: ((notification) {
                    if (_scrollController.position.userScrollDirection ==
                            ScrollDirection.reverse &&
                        _isFABExpanded) {
                      setState(() {
                        _isFABExpanded = false;
                      });
                    } else if (_scrollController.position.userScrollDirection ==
                            ScrollDirection.forward &&
                        !_isFABExpanded) {
                      setState(() {
                        _isFABExpanded = true;
                      });
                    }

                    return true;
                  }),
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor:
                              Colors.primaries[index % Colors.primaries.length],
                          foregroundColor: Colors.black,
                          radius: 30,
                          child: const Icon(Icons.person),
                        ),
                        title: Text(
                          "555111",
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam pulvinar, risus vel pulvinar sagittis, ligula nulla dignissim nisl, id efficitur.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.subtitle1!.copyWith(
                                    color: Colors.grey,
                                  ),
                        ),
                        trailing: const Text(
                          "10 min",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFAB extends StatelessWidget {
  final bool isExpanded;

  const MyFAB({
    Key? key,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 70,
        width: isExpanded ? 160 : 70,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 56, 84, 245),
          borderRadius: isExpanded
              ? BorderRadius.circular(20.0)
              : BorderRadius.circular(70.0),
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 350),
              top: !isExpanded ? 0 : null,
              bottom: !isExpanded ? 0 : null,
              left: !isExpanded ? 0 : null,
              right: !isExpanded ? 0 : null,
              child: const Icon(Icons.message),
            ),
            const AnimatedPositioned(
              duration: Duration(milliseconds: 200),
              left: 30,
              child: Text(
                "Start chat",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
