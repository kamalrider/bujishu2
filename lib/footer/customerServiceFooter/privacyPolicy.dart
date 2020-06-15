import 'package:Bujishu/home/customer_home/nav_drawer.dart';
import 'package:Bujishu/home/general_appbar.dart';
import 'package:flutter/material.dart';
import 'package:Bujishu/constant.dart' as Constants;

void main() => runApp(PrivacyPolicy());

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrivacyPolicyHome(),
    );
  }
}

class PrivacyPolicyHome extends StatefulWidget {
  @override
  _PrivacyPolicyState createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicyHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Container(
        width: 200,
        child: NavDrawer(),
      ),
      appBar: GeneralAppBar(context),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/images/bujishu_background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([

                        Text('PRIVACY POLICY'),
                        Text('Our Pledge'),
                        Text('We are dedicated to safeguarding your privacy and to preserving your sensitive data. Consequently, we ensure that our policies and activities regarding personal data comply with the provisions of the Personal Data Protection Act 2010 (the "Act") under the Malaysian law.'),
                        Text('Privacy Policy'),
                        Text('In the course of providing you access to this platform (“Site’) to source/search/purchase the products and services from our approved vendors (“Services”), we will be collecting, using, disclosing and/or processing data, including your personal data. By using the Site, you are agreeing to the terms of this Privacy Policy. If you do not agree with any term of this policy, please do not use the Site.'),
                        Text('This Privacy Policy exists to keep you in the know about how we collect, use, disclose and/or process the data we collect and receive during the course of providing the Services or access to the Site. We will only collect, use, disclose and/or process your personal data in accordance with this Privacy Policy.'),
                        Text('It is important that you read this Privacy Policy together with any other applicable notices we may provide on specific occasions when we are collecting, using, disclosing and/or processing personal data about you, so that you are fully aware of how and why we are using your personal data.'),
                        Text('BY CLICKING OR CHECKING “SIGN UP”, “I AGREE TO BUJISHU’S PRIVACY POLICY” OR SIMILAR STATEMENTS AVAILABLE AT THE BUJISHU REGISTRATION PAGE, YOU ACKNOWLEDGE THAT YOU HAVE BEEN NOTIFIED OF AND UNDERSTOOD THE TERMS OF THIS PRIVACY POLICY AND THAT YOU HAVE AGREED AND CONSENTED TO THE COLLECTION, USE, DICLOSURE AND/OR PROCESSING OF YOUR PERSONAL DATA AS DESCRIBED AND UNDER THE TERMS HEREIN.'),
                        Text('Please note that this Privacy Policy may be amended from time to time. Any changes we make to this Privacy Policy in future will be posted on this page and, where appropriate, notified to you, whereupon your continued use of the Services, access to the Site or use of the Services, including placing Orders on the Site, shall constitute your acknowledgment and acceptance of the changes we make to this Privacy Policy, as notified to you. Please check back frequently to see any updates or changes to this Privacy Policy.'),
                        Text('This Privacy Policy applies in conjunction with other notices, contractual clauses and consent clauses that apply in relation to the collection, use, disclosure and/or processing of your personal data by us, and is not intended to override them unless we state expressly otherwise.'),
                        Text('You can visit the Site and browse without having to provide personal details. However, you will be required to sign up for an account if you wish to use the Services.'),

                        Text('Collection of Personal Identifiable Information.'),
                        Text('When you visit the Site, we will record your visit only and will not collect any personally identifiable information (i.e. information that is about you and identifies you) from you unless otherwise stated. We use cookies and similar technologies to collect data about your use of the Site. For your information, Cookies are small computer files that can be stored on your computer for the purposes of obtaining configuration information and analysing your browsing habits. They can save you from registering again when re-visiting a web site and are commonly used to track your preferences in relation to the subject matter of the website. You may refuse to accept Cookies (by modifying the relevant Internet options or browsing preferences of your computer system), but if you do so you may not be able to utilize or activate certain available functions on our Site.'),
                        Text('During the course of your use of the Site and the provision of the Services, we may receive personal data from you in the following situations:'),
                        Text('When you create an account with us.'),
                        Text('When you apply for any of the Services or purchase any products available on the Site;'),
                        Text('When you use any of the features or functions available on the Site or Services, including the recording of any user-generated content to be uploaded on the Site;'),
                        Text('When you subscribe to our publications or marketing collaterals;'),
                        Text('When you enter a competition, promotion or survey;'),
                        Text('When you participate in any activity or campaign on the Site;'),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),
                        Text(''),

                      ]),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 0,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 2, 0, 2),
                  child: Text(
                    '@2020 Bujishu. All Rights Reserved',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
