import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Contact us'),
          actions: [
            IconButton(
              alignment: AlignmentDirectional.topStart,
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Center(
          child: ContactUs(
            textColor: Colors.black,
            cardColor: Colors.white,
            taglineColor: Colors.black,
            companyColor: Colors.black,
            dividerColor: Colors.black,
            logo: AssetImage('assets/profile.jpg'),
            email: 'test23@gmail.com',
            companyName: 'Rental Cars',
            phoneNumber: '+970598922914',
            dividerThickness: 2,
            website: 'https://abhishekdoshi.godaddysites.com',
            githubUserName: 'AbhishekDoshi26',
            linkedinURL:
                'https://www.linkedin.com/in/abhishek-doshi-520983199/',
            tagLine: 'Flutter Developer',
            twitterHandle: 'AbhishekDoshi26',
            //instagramUserName: '_abhishek_doshi',
          ),
        ));
  }
}
