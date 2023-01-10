import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


/* ------------ Page Section Widgets ------------------ */
class _PageCard extends StatelessWidget {
  final Widget content;
  final Widget illustration;
  const _PageCard(
      {Key? key, required this.content, required this.illustration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // soften the shadow
                spreadRadius: 0.15, //extend the shadow
                offset: Offset(
                  2.0, // Move to right 10  horizontally
                  2.0, // Move to bottom 10 Vertically
                ),
              )
            ],
          ),
          width: kIsWeb ? 400 : MediaQuery.of(context).size.width - 40,
          height: 200,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1.25,
                child: Container(
                    padding: const EdgeInsets.all(12),
                    height: 200,
                    child: content),
              ),
              AspectRatio(
                aspectRatio: 0.57,
                child: SizedBox(height: 200, child: illustration),
              ),
            ],
          )),
    );
  }
}

class PageMenuBlock extends StatelessWidget {
  final String? emUserId;
  const PageMenuBlock({Key? key, this.emUserId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Text(
          "Welcome $emUserId",
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 12,
        ),
        const _PageCard(
          content: _PageContent(),
          illustration: _PageIcon(),
        ),
        const SizedBox(
          height: 12,
        ),
        const _PageCard(
          content: _TableContent(),
          illustration: _TableIcon(),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

class _PageIcon extends StatelessWidget {
  const _PageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.settings_applications_outlined,
      color: Colors.blue.shade300,
      size: 90,
    );
  }
}


class _PageContent extends StatelessWidget {
  const _PageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle headingStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.99);

    const TextStyle subtitleStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.2);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "Drawer Menu",
            style: headingStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Sign-Up, Sign-In, Notifications, Settings, Sign-Out",
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Text("Open Menu Left"), 
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 38)),
                backgroundColor:  MaterialStateProperty.all(Colors.blue),
                foregroundColor:  MaterialStateProperty.all(Colors.white),
                ),
          )
        ],
      ),
    );
  }
}

class _TableIcon extends StatelessWidget {
  const _TableIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.table_chart_outlined,
      color: Colors.blue.shade300,
      size: 90,
    );
  }
}


class _TableContent extends StatelessWidget {
  const _TableContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle headingStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.99);

    const TextStyle subtitleStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 1.2);

    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            "End Drawer Menu",
            style: headingStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Screen List and All Screen (Table) Menu Options",
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 8,
          ),
          OutlinedButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            child: const Text("Open Menu Right"), 
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(200, 38)),
                backgroundColor:  MaterialStateProperty.all(Colors.blue),
                foregroundColor:  MaterialStateProperty.all(Colors.white),
                ),
          )
        ],
      ),
    );
  }
}
