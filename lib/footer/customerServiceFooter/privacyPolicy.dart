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
              image: new AssetImage("assets/images/privacypolicybg.jpg"),
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

                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text('PRIVACY POLICY',
                              style: TextStyle(
                                  color: Constants.gold, fontSize: 30),
                              textAlign: TextAlign.center,)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Our Pledge', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('We are dedicated to safeguarding your privacy and to preserving your sensitive data. Consequently, '
                              'we ensure that our policies and activities regarding personal data comply with the provisions of the Personal '
                              'Data Protection Act 2010 (the "Act") under the Malaysian law.',style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('1', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('In the course of providing you access to this platform (“Site’) to source/search/purchase '
                                      'the products and services from our approved vendors (“Services”), we will be collecting, using, '
                                      'disclosing and/or processing data, including your personal data. By using the Site, you are agreeing to '
                                      'the terms of this Privacy Policy. If you do not agree with any term of this policy, please do not use '
                                      'the Site.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('2', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('This Privacy Policy exists to keep you in the know about how we collect, use, disclose and/or '
                                      'process the data we collect and receive during the course of providing the Services or access to the '
                                      'Site. We will only collect, use, disclose and/or process your personal data in accordance with this Privacy Policy.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('3', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('It is important that you read this Privacy Policy together with any other applicable notices we may '
                                      'provide on specific occasions when we are collecting, using, disclosing and/or processing personal data about '
                                      'you, so that you are fully aware of how and why we are using your personal data.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('4', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('BY CLICKING OR CHECKING “SIGN UP”, “I AGREE TO BUJISHU’S PRIVACY POLICY” OR SIMILAR STATEMENTS AVAILABLE AT '
                                      'THE BUJISHU REGISTRATION PAGE, YOU ACKNOWLEDGE THAT YOU HAVE BEEN NOTIFIED OF AND UNDERSTOOD THE TERMS OF THIS PRIVACY '
                                      'POLICY AND THAT YOU HAVE AGREED AND CONSENTED TO THE COLLECTION, USE, DICLOSURE AND/OR PROCESSING OF YOUR PERSONAL DATA '
                                      'AS DESCRIBED AND UNDER THE TERMS HEREIN.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('5', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('(a)', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Please note that this Privacy Policy may be amended from time to time. Any changes we make to this Privacy Policy in future '
                                    'will be posted on this page and, where appropriate, notified to you, whereupon your continued use of the Services, access to the '
                                    'Site or use of the Services, including placing Orders on the Site, shall constitute your acknowledgment and acceptance of the changes '
                                    'we make to this Privacy Policy, as notified to you. Please check back frequently to see any updates or changes to this Privacy Policy.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('(b)', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('This Privacy Policy applies in conjunction with other notices, contractual clauses and consent clauses that apply in relation to the '
                                    'collection, use, disclosure and/or processing of your personal data by us, and is not intended to override them unless we state '
                                    'expressly otherwise.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('(c)', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('You can visit the Site and browse without having to provide personal details. However, you will be required to sign up for an account '
                                    'if you wish to use the Services.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),



                        Padding(
                                padding: const EdgeInsets.fromLTRB(15,15,15,0),
                                child: Text('Collection of Personal Identifiable Information.', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                              ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('When you visit the Site, we will record your visit only and will not collect any personally identifiable '
                                      'information (i.e. information that is about you and identifies you) from you unless otherwise stated. We use cookies and '
                                      'similar technologies to collect data about your use of the Site. For your information, Cookies are small computer files '
                                      'that can be stored on your computer for the purposes of obtaining configuration information and analysing your browsing '
                                      'habits. They can save you from registering again when re-visiting a web site and are commonly used to track your '
                                      'preferences in relation to the subject matter of the website. You may refuse to accept Cookies (by modifying the '
                                      'relevant Internet options or browsing preferences of your computer system), but if you do so you may not be able to '
                                      'utilize or activate certain available functions on our Site.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('During the course of your use of the Site and the provision of the Services, we may receive personal data from '
                                      'you in the following situations:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you create an account with us.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you apply for any of the Services or purchase any products available on the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you use any of the features or functions available on the Site or Services, including the recording of any user-generated content to be uploaded on the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you subscribe to our publications or marketing collaterals;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you enter a competition, promotion or survey;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you participate in any activity or campaign on the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you log in to your account on the Site or otherwise interact with us via an external service or application, such as Facebook or Google;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When any other user of the Site posts any comments on the content you have uploaded on the Site or when you post any comments on other users’ content uploaded to the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When a third party lodges a complaint against you or the content you have posted on the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('When you interact with us offline, including when you interact with our customer service agents.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('During the course of your use of the Site and the provision of the Services, we may also receive your personal '
                                      'data from third parties for the purposes set out in this Privacy Policy or any other terms.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('You must only submit personal data which is accurate and not misleading and you must keep it up to date and '
                                      'inform us of any changes to the personal data you have provided to us. We shall have the right to request for '
                                      'documentation to verify the personal data provided by you as part of our customer verification processes.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We will only be able to collect your personal data if you voluntarily submit the personal data to us or as '
                                      'otherwise provided for under this Privacy Policy. Unfortunately, if you choose not to submit your personal data to us '
                                      'or subsequently withdraw your consent to our use of your personal data, we may not be able to provide you with the '
                                      'Services or access to the Site.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('You may access and update your personal information submitted to us at any time as described below.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('If you provide personal data of any third party to us, you represent and warrant that you have obtained the necessary consent from that third party to share and transfer '
                                    'his/her personal data to us, and for us to collect, use and disclose that data in accordance with this Privacy Policy.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('If you sign up to be a user on our Site using your social media account or link your Bujishu account to your social media account or use certain other Bujishu social media '
                                    'features, we may access personal data about you which you have voluntarily provided to your social media provider in accordance with the provider\'s policies and we will '
                                    'manage your personal data in accordance with this Privacy Policy.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Types of Personal Data Collected', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Personal Data means any information, whether recorded in a material form or not, from which the identity of an '
                                      'individual is apparent or can be reasonably and directly ascertained by the entity holding the information, or when put '
                                      'together with other information would directly and certainly identify an individual.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('During the course of your use of the Site and the provision of the Services, we may collect personal data '
                                      'from you, which includes but not limited to:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Identification - name, gender, profile picture, and date of birth;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Correspondence - billing address, delivery address, email address and phone numbers;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Financial - bank account and payment details;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Transaction - details about payments to and from you, and other details of products and Services you have placed with us;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Technical - internet protocol (IP) address, your login data, browser type and version, time zone setting and location, browser plug-in types and versions, operating system and platform,'
                                    ' and other technology on the devices you use to access the site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Personal Profile – log in ID, username, log in password, purchases behaviour, your interests, preferences, feedback and survey responses;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Browsing Usage – frequency of visits, usage of the site, contents of the site that you visit or viewed;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Check-in - location that you share or check-in with us, form of photographs or videos that you uploaded to the site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Market Information - your preferences in receiving marketing information from us and our third parties and your communication preferences.',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Security', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('All personal data you provide to us is secured on our Site with restricted access by authorized personnel '
                                      'only. We maintain appropriate administrative, technical and physical safeguards to protect the personal data you '
                                      'provide to us against accidental, unlawful or unauthorised destruction, loss, alteration, access, disclosure or use '
                                      'and other unlawful forms of processing.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Personal Information Collection Statement (“PICS”)', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('As a Bujishu customer, it is necessary for you to provide us with your complete and correct Personal Data when '
                                      'you use this Site. If your Personal Data is incomplete or incorrect, we may not be able to provide or continue to '
                                      'provide the Services to you.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We shall keep your Personal Data confidential at all times. Our policies and practices with respect to the '
                                      'collection, use, retention, disclosure, transfer, security and access of Personal Data will be in accordance with the '
                                      'laws of Malaysia and are as set out in this PICS.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('You agree that all the Personal Data we collect from you or via third parties may be used by us, or shared '
                                      'with or transferred to third parties (including related companies, third party service providers and their service '
                                      'providers and related companies, third party sellers, and companies located both inside and outside your home country), '
                                      'for certain purposes, which include but are not limited to the following:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To consider and/or process your application with us',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To manage, operate, provide and/or administer your use of and/or access to the Site;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Analysis, verification and/or review of your account, payment and/or status with respect to the provision of the Services;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Processing any payment orders, direct debit and/or credit facilities that you instructed;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Enabling the regular running of your account and/or the recovery of uncollected sum in respect of the Services in your account;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Allowing us to conduct date analysis and sorting on your characteristic and buying behaviour, so that we may provide other services better tailored to your needs, and to assist us in '
                                    'selecting goods and services that are likely to be of interest to you;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Provides you with updates on specific programs, products and/or services;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To conduct research, analysis and development activities (including, but not limited to, data analytics, surveys, technology development and/or profiling), to analyse how you use the Site, '
                                    'to improve and/or to enhance the Site',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To maintain and administer any software updates and/or other updates and support that may be required from time to time to ensure the smooth running of the Site; to deal with or '
                                    'respond to any enquiries from (or purported to be from) you;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Research and product development, enhancement, improvement of the services provided to you;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Inquiry into allegations and fraudulent transactions;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To enforce our Terms and Conditions or any applicable end user license agreements',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To protect personal safety and the rights, property or safety of others;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To allow for audits and surveys to, among other things, validate the size and composition of our target audience, and understand their experience with the Site',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To respond to legal processes or to comply with or as required by any applicable law, tax, governmental or regulatory requirements of any relevant jurisdiction, including, without limitation, meeting '
                                    'the requirements to make disclosure under the requirements of any law binding on Bujishu or on its related corporations or affiliates;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('to produce statistics and research for internal and statutory reporting and/or record-keeping requirements;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To carry out due diligence or other screening activities (including, without limitation, background checks) in accordance with legal or regulatory obligations or our risk management procedures that may '
                                    'be required by law or that may have been put in place by us;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('To audit our Site; to prevent or investigate any fraud, unlawful activity, omission or misconduct, whether relating to your use of the Site or any other matter arising from your relationship '
                                    'with us, and whether or not there is any suspicion of the aforementioned;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We would also like to use your Personal Data for direct marketing to you (whether by post, email, phone, SMS or '
                                      'the like) in relation to:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Promotion activities;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Promotion activities by our affiliates and/or vendors/third parties;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Promotion activities from us in relation to telecommunication goods and/or services, e-commerce services, geomancy studies and related services, and real estates and related services;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('other offers and promotions from the third party merchants that we cooperate with to provide benefits to our customers in relation to the following types of products or services:',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Retail Goods or Services;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Financial, insurance, banking and credit cards;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Transportation, travel and accommodation;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Sports, leisure, recreation and entertainment;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('Telecommunications products and services;',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:1,
                                  child: Text('○', textAlign: TextAlign.center,style: TextStyle(fontSize: 12),)),
                              Expanded(
                                flex: 8,
                                child: Text('E-commerce (including trading and payment platforms and online auctions)',
                                  style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We may disclose and transfer (whether in Malaysia or abroad) to our agents or contractors or vendors under a '
                                      'duty of confidentiality to us who provide administrative, data processing, research and marketing, distribution, '
                                      'telecommunications, professional or other similar services to us and to any of our actual or proposed assignees or '
                                      'transferees of our rights with respect to you in connection with a merger, sale or transfer (whether of assets or '
                                      'shares), to use, hold, process or retain such Personal Data for the purposes mentioned in paragraphs 6.3 and 6.4 above '
                                      'on our behalf.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('In accordance with the Act, we have the right to charge you a reasonable fee for the processing of any '
                                      'Personal Data access request.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Nothing in this PICS shall limit your rights under the Act.'
                                    ,
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('You agree not to take any action and/or waive your rights to take any action against BUJISHU for the disclosure '
                                      'of your Personal Data in the above circumstances.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Updating Your Personal Data', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('It is important that the personal data you provide to us is accurate and complete for you to continue using '
                                      'the Site and for us to provide the Services. You are responsible for informing us of changes to your personal data, or '
                                      'in the event you believe that the personal data we have about you is inaccurate, incomplete, misleading or out of date.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('You can update your personal data anytime by accessing your account on the Site. If you are unable to update '
                                      'your personal data through your account, you can do so by contacting our Data Protection Officer through our Contact Us '
                                      'page.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We take steps to share the updates to your personal data with third parties and our affiliates with whom we have '
                                      'shared your personal data if your personal data is still necessary for the above-stated purposes.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Retention of Personal Data', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We will only retain your personal data for as long as we are either required to by law or as is relevant for the '
                                      'purposes for which it was collected.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('We will cease to retain your personal data, or remove the means by which the data can be associated with you, as '
                                      'soon as it is reasonable to assume that such retention no longer serves the purposes for which the personal data was '
                                      'collected, and is no longer necessary for any legal or business purpose.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Governing Law', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('The contents of this Privacy Policy shall be governed by the laws of Malaysia.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('If any provisions of this Privacy Policy or any part thereof is rendered void, illegal or unenforceable in any '
                                      'respect under any law, the validity, legality and enforceability of the remaining provisions shall not in any way be '
                                      'effected or impaired thereby.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Text('Enquiries', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline, fontSize: 15),),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('•', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Should you have any enquiries concerning our Privacy Policy, please feel free to contact our Customer Services '
                                      'Manager.',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('The address is as follows:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('1-26-05 Menara Bangkok Bank,',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Berjaya Central Park,',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('No 105, Jalan Ampang,',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('50450 Kuala Lumpur, Malaysia',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('Email Address:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('bujishu-cs@delhubdigital.com',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,15,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('For enquiries, please contact Bujishu Customer Hotline:',
                                    style: TextStyle(fontSize: 12), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15,0,15,0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex:1,
                                  child: Text('', textAlign: TextAlign.center,style: TextStyle(fontSize: 20),)),
                              Expanded(
                                  flex:9,
                                  child: Text('03-2181 8821',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.justify,)),
                            ],
                          ),
                        ),


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
                    style: TextStyle(color: Colors.black, fontSize: 12),
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
