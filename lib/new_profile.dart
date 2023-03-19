import 'package:flutter/material.dart';

class OptionMenuPage extends StatelessWidget {
  final String studentName;
  final String studentDept;
  final String studentRollNo;
  final int studentYear;

  const OptionMenuPage(
      {super.key,
      required this.studentDept,
      required this.studentRollNo,
      required this.studentName,
      required this.studentYear});

  @override
  Widget build(BuildContext context) {
    final List<List> ListofOptions = [
      [
        "Time Table",
        Icons.schedule,
      ],
      [
        "Attendence",
        Icons.fingerprint,
      ],
      [
        "Lost n found",
        Icons.search,
      ],
      [
        "Room-mate",
        Icons.person_outline,
      ],
      [
        "Old Books",
        Icons.menu_book_sharp,
      ],
      [
        "Calender",
        Icons.calendar_month_outlined,
      ],
      [
        "Notices",
        Icons.newspaper,
      ],
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        elevation: 0,
        centerTitle: true,
        title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.transparent,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.notifications_none_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(22),
                color: Colors.lightBlue.shade300,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(
                        //   Icons.verified_user,
                        //   size: 80,
                        // ),
                        const CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              AssetImage("assets/images/college_logo.png"),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              studentName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const Text("Second Year"),
                            Text(studentDept),
                            Text(studentRollNo),
                          ],
                        )
                      ],
                    )
                  ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: ListofOptions.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            ListofOptions[index][1],
                            size: 40,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          Text(
                            ListofOptions[index][0],
                            style: const TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
