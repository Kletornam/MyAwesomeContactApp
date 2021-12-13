import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:grouped_list/grouped_list.dart';

import 'contact_details_model.dart';
import 'contact_details_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> data = [
    {
      "name": "Dylan Lyons",
      "phone": "1-367-488-4042",
      "email": "sit.amet@google.couk",
      "region": "Cornwall",
      "country": "South Korea"
    },
    {
      "name": "Chloe Meyer",
      "phone": "954-9373",
      "email": "enim.mi.tempor@google.org",
      "region": "Kayseri",
      "country": "France"
    },
    {
      "name": "Ignatius Willis",
      "phone": "133-7476",
      "email": "lobortis.risus.in@protonmail.org",
      "region": "San Luis Potosí",
      "country": "France"
    },
    {
      "name": "Dieter Norton",
      "phone": "1-597-421-6737",
      "email": "quisque.tincidunt.pede@hotmail.ca",
      "region": "Kocaeli",
      "country": "France"
    },
    {
      "name": "Mary Kennedy",
      "phone": "813-8365",
      "email": "eu.tempor@protonmail.com",
      "region": "Champagne-Ardenne",
      "country": "United Kingdom"
    },
    {
      "name": "Amos Wooten",
      "phone": "1-558-145-5843",
      "email": "ligula@outlook.couk",
      "region": "Khyber Pakhtoonkhwa",
      "country": "Poland"
    },
    {
      "name": "Noah Copeland",
      "phone": "1-758-843-9555",
      "email": "nulla.vulputate@yahoo.edu",
      "region": "Vorarlberg",
      "country": "Mexico"
    },
    {
      "name": "Lacey Pierce",
      "phone": "1-957-816-5064",
      "email": "orci.ut@hotmail.net",
      "region": "North Island",
      "country": "Indonesia"
    },
    {
      "name": "Illiana Gould",
      "phone": "1-445-633-6433",
      "email": "integer.vulputate@yahoo.ca",
      "region": "Lima",
      "country": "Pakistan"
    },
    {
      "name": "Kylynn Wright",
      "phone": "169-1594",
      "email": "quam.quis.diam@yahoo.com",
      "region": "Coquimbo",
      "country": "Canada"
    },
    {
      "name": "Natalie Dunn",
      "phone": "286-6785",
      "email": "aliquet.sem@outlook.net",
      "region": "Alaska",
      "country": "India"
    },
    {
      "name": "Addison Davidson",
      "phone": "737-0313",
      "email": "dolor.sit.amet@hotmail.net",
      "region": "Azad Kashmir",
      "country": "Brazil"
    },
    {
      "name": "Audra Sanders",
      "phone": "1-363-438-3583",
      "email": "proin.vel@google.ca",
      "region": "Uttar Pradesh",
      "country": "Nigeria"
    },
    {
      "name": "Lacota Olsen",
      "phone": "531-7811",
      "email": "vel.arcu.curabitur@hotmail.org",
      "region": "Overijssel",
      "country": "Vietnam"
    },
    {
      "name": "Naomi Allison",
      "phone": "1-417-441-7720",
      "email": "mauris.elit@hotmail.couk",
      "region": "Coquimbo",
      "country": "Turkey"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text(
              'My Contacts',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Center(
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/avatar.jpg'),
                  ),
                ),
              )
            ],
            elevation: 0,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(70),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        hintText: 'Search by name or number',
                        prefixIcon: const Icon(Icons.search))),
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(controller: _scrollController, children: [
            const Text(
              'Recent',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            ListView.separated(
                controller: _scrollController,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ContactDetailsView(
                            contact: Contact(
                              country: 'Ghana',
                              email: 'mail@etornam.me',
                              name: 'Etornam',
                              phone: '+233 558 06 86 37',
                              region: 'Greater Accra',
                            ),
                          );
                        }));
                      },
                      leading: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/avatar2.jpg'),
                      ),
                      title: const Text('Etornam',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      subtitle: const Text('+233 558 06 86 37'),
                      trailing: const IconButton(
                          onPressed: null, icon: Icon(Icons.more_horiz)));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                      indent: 25, thickness: 1, color: Colors.grey);
                },
                itemCount: 3),
            const Text(
              "Contacts",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            GroupedListView<Map<String, String>, String>(
              shrinkWrap: true,
              elements: data,
              groupBy: (element) => element['name'].toString().substring(0, 1),
              groupSeparatorBuilder: (String groupByValue) => SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  groupByValue.substring(0, 1),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
              itemBuilder: (context, Map<String, String> element) {
                Contact contact = Contact.fromJson(element);
                return Column(
                  children: [
                    ListTile(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ContactDetailsView(contact: contact);
                          }));
                        },
                        leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage('assets/avatar3.jpg'),
                        ),
                        title: Text('${element['name']}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600)),
                        subtitle: Text('${element['phone']}'),
                        trailing: const IconButton(
                            onPressed: null, icon: Icon(Icons.more_horiz))),
                    const Divider(indent: 25, thickness: 1, color: Colors.grey),
                  ],
                );
              },
              itemComparator: (item1, item2) =>
                  item1['name']!.compareTo(item2['name']!), // optional
              useStickyGroupSeparators: true, // optional
              floatingHeader: true, // optional
              order: GroupedListOrder.ASC, // optional
            ),
          ]),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.teal,
            onPressed: () {},
            child: const Icon(Icons.add)));
  }
}
