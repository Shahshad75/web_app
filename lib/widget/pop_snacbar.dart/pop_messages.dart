import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_app/widget/textfields/textfield.dart';

class PopMessages {
  final username = TextEditingController();
  final password = TextEditingController();
  final rejectDescription = TextEditingController();
  void showSnackBar(BuildContext context) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text(
            'Approving Drivers',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: 350,
            width: 500,
            child: Column(
              children: [
                const Divider(),
                CustomTextfield(
                    controller: username,
                    text: "Username",
                    keyboardType: TextInputType.none,
                    readOnly: false),
                CustomTextfield(
                    controller: password,
                    text: "Password",
                    keyboardType: TextInputType.none,
                    readOnly: false),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
            ElevatedButton(
                onPressed: () {
                  emailLauncher(username.text, password.text);
                  Navigator.of(context).pop();
                },
                child: const Text("Confirm"))
          ],
        );
      },
    );
  }

  void emailLauncher(String username, String password) async {
    final String decodedUsername = Uri.decodeFull(username.trim());
    final String decodedPassword = Uri.decodeFull(password.trim());
    String body = """
We are delighted to inform you that your job application for the position of a driver at [Your Company Name] has been approved. Congratulations on your successful application!

Here are your login credentials to access our driver app:

Username: $decodedUsername
Password: $decodedPassword

Please make sure to keep these login details confidential and secure. You will need them to log in to our app and start your new journey as a member of our team.

We are excited to have you on board and look forward to working with you. If you have any questions or need further information, please do not hesitate to contact us.

Once again, welcome to [Your Company Name], and we wish you a prosperous and fulfilling career with us.

Best regards,

[Your Name]
[Your Title]
[Your Company Name]
[Contact Information]
""";

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'www.shahshadbabu.com@gmail.com',
      queryParameters: {
        'subject': 'Driver Approved',
        'body': body.trim(),
      },
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());

      print(emailLaunchUri.queryParameters);
    } else {}
  }

  void rejectSnacbar(BuildContext context) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text(
            'Reject Driver',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: 350,
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    "Reason for rejecting Wade Warren’s Driver profile * "),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: rejectDescription,
                  maxLines: 9,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    rejectEmail(rejectDescription.text.trim());
                    Navigator.of(context).pop();
                    rejectDescription.clear();
                  },
                  child: const Text("Reject")),
            )
          ],
        );
      },
    );
  }

  rejectEmail(String rejectDescription) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'dilshadsanu17@gmail.com',
      queryParameters: {
        'subject': 'Driver Rejected',
        'body': rejectDescription,
      },
    );

    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());

      print(emailLaunchUri.queryParameters);
    } else {}
  }

  void logOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (
        BuildContext context,
      ) {
        return AlertDialog(
          title: const Text(
            'Logout',
            style: TextStyle(
                color: Colors.grey, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: const Text("Are you sure to Logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Yes"))
          ],
        );
      },
    );
  }
}
