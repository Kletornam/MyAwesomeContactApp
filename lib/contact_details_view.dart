import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'contact_details_model.dart';

class ContactDetailsView extends StatelessWidget {
  const ContactDetailsView({Key? key, required this.contact}) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.teal),
        title: const Text(
          'Contacts',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.w600, color: Colors.teal),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      body: ListView(
        children: [
          const CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('assets/avatar3.jpg'),
          ),
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Text(
              contact.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Text(
              '${contact.region}, ${contact.country}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            color: Colors.grey[500],
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    'Mobile',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  subtitle: Text(contact.phone,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    TextButton(
                      onPressed: null,
                      child: const Icon(Icons.message),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder()),
                    ),
                    TextButton(
                        onPressed: null,
                        child: const Icon(Icons.phone),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder(),
                        )),
                  ]),
                ),
                ListTile(
                  title: const Text(
                    'E-mail',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  subtitle: Text(contact.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      )),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    TextButton(
                      onPressed: null,
                      child: const Icon(Icons.mail),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: const CircleBorder()),
                    ),
                  ]),
                ),
                const ListTile(
                  title: Text(
                    'Groups',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  subtitle: Text('Friends',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        color: Colors.black,
                      )),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Account Linked',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          Container(
              color: Colors.grey,
              child: Column(children: const [
                ListTile(
                  title: Text('Telegram', style: TextStyle(fontSize: 18)),
                  trailing: Image(image: AssetImage('assets/telegram.png')),
                ),
                ListTile(
                  title: Text('WhatsApp', style: TextStyle(fontSize: 18)),
                  trailing: Image(image: AssetImage('assets/whatsapp.png')),
                )
              ])),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('More Options',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          Container(
              color: Colors.grey,
              child: Column(children: const [
                ListTile(
                  title: Text('Share Contact', style: TextStyle(fontSize: 18)),
                  trailing: Icon(
                    Icons.share,
                    color: CupertinoColors.black,
                  ),
                ),
                ListTile(
                    title:
                        Text('Delete Contact', style: TextStyle(fontSize: 18)),
                    trailing: Icon(Icons.delete, color: CupertinoColors.black))
              ]))
        ],
      ),
    );
  }
}
