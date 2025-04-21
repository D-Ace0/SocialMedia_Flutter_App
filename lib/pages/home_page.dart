import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/database/firestore.dart';
import 'package:socialmediaapp/helper_functions/helper_functions.dart';
import 'package:socialmediaapp/widgets/my_drawrer.dart';
import 'package:socialmediaapp/widgets/my_list_tile.dart';
import 'package:socialmediaapp/widgets/my_post_button.dart';
import 'package:socialmediaapp/widgets/my_textfield.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final FirestoreDatabase postsDatabase = FirestoreDatabase();
  final TextEditingController postController = TextEditingController();

  void addPost() {
    if (postController.text.isNotEmpty) {
      postsDatabase.addPost(postController.text);
    }
    postController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("W A L L"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawrer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: MyTextfield(
                    controller: postController,
                    obsecure: false,
                    hint: "Say Something",
                  ),
                ),
                MyPostButton(onTap: addPost),
              ],
            ),
          ),

          StreamBuilder(
            stream: postsDatabase.getPostsStream(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                displayMessage(context, snapshot.error.toString());
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              final posts = snapshot.data!.docs;
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Text("No posts found... Post something!"),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // get each post
                    final post = posts[index];

                    // get data from each post
                    String message = post["PostMessage"];
                    String email = post["UserEmail"];
                    Timestamp timestamp = post["TimeStamp"];

                    // return a list_tile for each
                    return MyListTile(
                      title: message,
                      subTitle: email,
                      timestamp: timestamp,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
