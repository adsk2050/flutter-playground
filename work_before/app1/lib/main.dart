import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

// Home screen displaying people list
class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> people = [
    {
      'name': 'Rohan Sharma',
      'age': 28,
      'occupation': 'Marketing Specialist',
    },
    {
      'name': 'Priya Menon',
      'age': 34,
      'occupation': 'Software Engineer',
    },
    {
      'name': 'Anjali Deshmukh',
      'age': 42,
      'occupation': 'Graphic Designer',
    },
    {
      'name': 'Rajiv Kapoor',
      'age': 38,
      'occupation': 'Financial Analyst',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person List'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(12.0),
            elevation: 4.0,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  people[index]['name'][0],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              title: Text(people[index]['name']),
              subtitle: Text(
                  '${people[index]['occupation']}, Age: ${people[index]['age']}'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddressForm(person: people[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Address Form Screen (After Selecting a Person)
class AddressForm extends StatefulWidget {
  final Map<String, dynamic> person;

  AddressForm({required this.person});

  @override
  _AddressFormState createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  String? selectedState;
  String? selectedDistrict;
  String? selectedConstituency;
  String? selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address of ${widget.person['name']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Address of ${widget.person['name']}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Occupation: ${widget.person['occupation']}, Age: ${widget.person['age']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'State'),
              items: ['Bihar', 'Delhi', 'Maharashtra', 'Karnataka']
                  .map((state) => DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedState = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'District'),
              items: ['District 1', 'District 2', 'District 3']
                  .map((district) => DropdownMenuItem(
                        value: district,
                        child: Text(district),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDistrict = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Assembly Constituency'),
              items: ['Constituency 1', 'Constituency 2']
                  .map((constituency) => DropdownMenuItem(
                        value: constituency,
                        child: Text(constituency),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedConstituency = value;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: 'Language'),
              items: ['English', 'Hindi']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
