import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';





class Poll extends StatefulWidget {
  const Poll({Key? key}) : super(key: key);

  @override
  State<Poll> createState() => _PollState();
}

class _PollState extends State<Poll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ...List.generate(3, (index) {
                      return const PollCard(
                        avatarUrl: "https://c8.alamy.com/comp/2A0063N/human-character-vector-logo-concept-illustration-abstract-man-figure-logo-people-logo-friendship-icon-people-icon-teamwork-icon-happy-people-2A0063N.jpg",
                        username: "Arun",
                        question: "What is your favorite programming language?",
                        options: [
                          {"option": "Dart", "votes": 0}, // Default votes set to 0
                          {"option": "Python", "votes": 0}, // Default votes set to 0
                        ],
                        totalVotes: 0, // Default total votes set to 0
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PollCard extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final String question;
  final List<Map<String, dynamic>> options;
  final int totalVotes;

  const PollCard({
    Key? key,
    required this.avatarUrl,
    required this.username,
    required this.question,
    required this.options,
    required this.totalVotes,
  }) : super(key: key);

  Future<void>qwer()async {
    await FlutterShare.share(
        title: question ,
        text: "user name :  $username\nQuestion : $question\nTotal Votes : $totalVotes "
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.teal.shade900,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
            ),
            title: Text(username, style: TextStyle(color: Colors.white54,fontWeight: FontWeight.bold)),
            trailing: IconButton(icon:Icon(Icons.share,color: Colors.white,),
                onPressed: qwer,
                  // showModalBottomSheet(
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return Container(
                  //       height: 300,
                  //       child: Center(
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           mainAxisSize: MainAxisSize.min,
                  //           children: <Widget>[
                  //
                  //           ],
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );


            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height/20,
            width: MediaQuery.of(context).size.width/20,
            decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://www.flaticon.com/free-icon/check_6780361"))
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(question, style: TextStyle(color: Colors.white54,fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 8),
          ...options.map((option) {
            return PollOption(
              optionText: option["option"],
              votes: option["votes"],
              totalVotes: totalVotes,
            );
          }).toList(),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("Total Votes: $totalVotes", style: TextStyle(color: Colors.white54)),
          ),
        ],
      ),
    );
  }
}

class PollOption extends StatefulWidget {
  final String optionText;
  final int votes;
  final int totalVotes;

  const PollOption({
    Key? key,
    required this.optionText,
    required this.votes,
    required this.totalVotes,
  }) : super(key: key);

  @override
  _PollOptionState createState() => _PollOptionState();
}

class _PollOptionState extends State<PollOption> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: isSelected ? Colors.green : Colors.black),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, size: 16, color: Colors.green)
                      : null,
                ),
                const SizedBox(width: 20),
                Text(
                  widget.optionText,
                  style: TextStyle(fontSize: 16,color: Colors.white54),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 15,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.teal.shade300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Container(
                  height: 20, // Match the height with the above container
                  width: widget.votes > 0 ? (widget.votes / widget.totalVotes) * MediaQuery.of(context).size.width : 0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
