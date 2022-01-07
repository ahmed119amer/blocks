import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class massengersimpe extends StatefulWidget {
  const massengersimpe({Key? key}) : super(key: key);

  @override
  _massengersimpeState createState() => _massengersimpeState();
}

class _massengersimpeState extends State<massengersimpe> {
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey Kriss, I am doing fine dude. wbu?",
        messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(
        messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];

  CollectionReference users = FirebaseFirestore.instance.collection('users');
  

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   flexibleSpace: SafeArea(
        //     child: Container(
        //       padding: EdgeInsets.only(right: 16),
        //       child: Row(
        //         children: <Widget>[
        //           IconButton(
        //             onPressed: () {
        //               Navigator.pop(context);
        //             },
        //             icon: Icon(
        //               Icons.arrow_back,
        //               color: Colors.black,
        //             ),
        //           ),
        //           SizedBox(
        //             width: 2,
        //           ),
        //           CircleAvatar(
        //             backgroundImage: NetworkImage(
        //                 "<https://randomuser.me/api/portraits/men/5.jpg>"),
        //             maxRadius: 20,
        //           ),
        //           SizedBox(
        //             width: 12,
        //           ),
        //           Expanded(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 Text(
        //                   "Kriss Benwat",
        //                   style: TextStyle(
        //                       fontSize: 16, fontWeight: FontWeight.w600),
        //                 ),
        //                 SizedBox(
        //                   height: 6,
        //                 ),
        //                 Text(
        //                   "Online",
        //                   style: TextStyle(
        //                       color: Colors.grey.shade600, fontSize: 13),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           Icon(
        //             Icons.settings,
        //             color: Colors.black54,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     addUser('ahmed', 'rmd', 31);
        //   },
        //   tooltip: 'Increment Counter',
        //   child: const Icon(Icons.add),
        // ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  itemCount: messages.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: 
                            (messages[index].messageType == "receiver"
                                ? Alignment.topLeft
                                : Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:
                                (messages[index].messageType == "receiver"
                                    ? Colors.grey.shade200
                                    : Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            messages[index].messageContent,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 10, bottom: 10, top: 10),
                        height: 60,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.lightBlue,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Write message...",
                                    hintStyle:
                                        TextStyle(color: Colors.black54),
                                    border: InputBorder.none),
                                // onChanged: () {}
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 18,
                              ),
                              backgroundColor: Colors.blue,
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}